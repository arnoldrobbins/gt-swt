# rsa --- toy RSA public-key cryptosystem

#     usage:   rsa -i
#              rsa -e correspondent
#              rsa -d

   define(file_des,integer * 2)

   character option (MAXLINE), correspondent (MAXLINE)
   character mapdn

   string options "ied"

   integer choice
   integer getarg, index

   if (getarg (1, option, MAXLINE) == EOF || option (1) ~= '-'c)
      call usage

   choice = index (options, mapdn (option (2)))
   case choice {

     #   -i
      call initialize

     #   -e
      {
         if (getarg (2, correspondent, MAXLINE) == EOF)
            call usage
         call send (STDIN, STDOUT, correspondent)
         }

     #   -d
      {
         if (getarg (2, correspondent, MAXLINE) == EOF)
            ;  # do nothing now --- correspondent is optional
         call receive (STDIN, STDOUT, correspondent)
         }

      }

   else
      call usage

   stop
   end



# usage --- print usage message, then die

   subroutine usage

   call remark ("Usage:  rsa (-i | -e correspondent | -d).")

   stop
   end



# initialize --- create RSA parameter files

   subroutine initialize

   long_int p, q, E, D, n
   long_int invmod

   string en_file "=varsdir=/.rsa_encipher"
   string en_prot "a/r"             # owners all, non-owners read-only
   string de_file "=varsdir=/.rsa_decipher"
   string de_prot "a"               # owners all, non-owners none

   character en_perm(MAXLINE), de_perm(MAXLINE), name(MAXUSERNAME)
   file_des en_fd, de_fd
   file_des create
   integer at

   en_fd = create (en_file, READWRITE)
   if (en_fd == ERR) {
      call remark ("cannot create encryption parameters file.")
      return
      }

   de_fd = create (de_file, READWRITE)
   if (de_fd == ERR) {
      call close (en_fd)
      call remark ("cannot create decryption parameters file.")
      return
      }

   call get_primes (p, q, E)
   n = p * q
   call print (en_fd, "*l,*l*n.", E, n)
   D = invmod (E, (p - 1) * (q - 1))
   call print (de_fd, "*l,*l*n.", D, n)

   call close (en_fd)
   call close (de_fd)

   call sprot$ (en_file, en_prot)
   call sprot$ (de_file, de_prot)

   call date(SYS_USERID, name)
   call encode(en_perm, MAXLINE, "*s=$all $rest=r"s, name)
   call encode(de_perm, MAXLINE, "*s=$all $rest=0"s, name)

   call sfdata (FILE_ACL, en_file, en_perm, at, EOS)
   call sfdata (FILE_ACL, de_file, de_perm, at, EOS)

   return
   end



# get_primes --- get prime numbers for generating encryption parameters

   subroutine get_primes (p, q, E)
   long_int p, q, E

   long_int random, prime

   call randomize

   p = prime (random (intl (20), intl (54)))
   q = prime (random (intl (20), intl (54)))
   E = prime (random (intl (55), intl (3511)))

   return
   end



# randomize --- set random number generator to nonobvious seed

   subroutine randomize

   integer td (10), i, seed

   call timdat (td, 10)
   seed = 0
   do i = 1, 10
      seed = seed + td (i)
   call rnd (iabs (seed))

   return
   end



# random --- return random number between bounds

   long_int function random (lwb, upb)
   long_int lwb, upb

   real rnd

   random = (upb - lwb) * rnd (0) + lwb

   return
   end



# send --- encrypt fin to fout using parameters of self and correspondent

   subroutine send (fin, fout, correspondent)
   file_des fin, fout
   character correspondent (ARB)

   integer get_en_params
   long_int E, n

   if (get_en_params (correspondent, E, n) == OK)
      call encipher (fin, fout, E, n)
   else
      call remark ("RSA enciphering file missing or unreadable.")

   return
   end



# get_en_params --- get enciphering parameters from user's RSA file

   integer function get_en_params (user, E, n)
   character user (ARB)
   long_int E, n

   string prefix "=vars=/"
   string suffix "/.rsa_encipher"
   character param_file (MAXLINE)

   integer length, input

   file_des param
   file_des open

   call scopy (prefix, 1, param_file, 1)
   call scopy (user, 1, param_file, length (param_file) + 1)
   call scopy (suffix, 1, param_file, length (param_file) + 1)

   param = open (param_file, READ)
   if (param == ERR || input (param, "*,,,l*l.", E, n) == EOF)
      get_en_params = ERR
   else
      get_en_params = OK

   if (param ~= ERR)
      call close (param)

   return
   end



# encipher --- RSA encipher characters on file 'fi' to file 'fo'

   subroutine encipher (fi, fo, E, n)
   file_des fi, fo
   long_int E, n

   character p
   character getch

   long_int pwrmod

   while (getch (p, fi) ~= EOF)
      call print (fo, "*l*n.", pwrmod (intl (p), E, n))

   return
   end



# receive --- decrypt fin to fout using params of self and correspondent

   subroutine receive (fin, fout, correspondent)
   file_des fin, fout
   character correspondent (ARB)    # presently unused

   integer get_de_params
   long_int D, n

   if (get_de_params (D, n) == OK)
      call decipher (fin, fout, D, n)
   else
      call remark ("RSA deciphering file missing or unreadable.")

   return
   end



# get_de_params --- get deciphering parameters from user's RSA file

   integer function get_de_params (D, n)
   long_int D, n

   string param_file "=varsdir=/.rsa_decipher"

   integer input

   file_des param
   file_des open

   param = open (param_file, READ)
   if (param == ERR || input (param, "*,,,l*l.", D, n) == EOF)
      get_de_params = ERR
   else
      get_de_params = OK

   if (param ~= ERR)
      call close (param)

   return
   end



# decipher --- RSA decipher integers on file 'fi' to file 'fo'

   subroutine decipher (fi, fo, D, n)
   file_des fi, fo
   long_int D, n

   long_int c
   integer get_cipher

   long_int pwrmod

   while (get_cipher (c, fi) ~= EOF)
      call putch (ints (pwrmod (c, D, n)), fo)

   return
   end



# get_cipher --- read ciphertext integer from specified file

   integer function get_cipher (l, fi)
   long_int l
   file_des fi

   integer input

   get_cipher = input (fi, "*l.", l)

   return
   end
