# mail --- send mail from one user to another

# Usage:

#  mail
#     Checks for mail, prints it if it's there and asks if it
#     is to be saved.  Saves in =varsdir=/.mail if desired.

#  mail { <user> }
#     Validates given user names; appends standard input to the
#     mail files of the named users.

   include ARGUMENT_DEFS

   integer cache, arg
   integer getarg, mktemp, vfyusr

   character user (MAXLINE)

   ARG_DECL

   PARSE_COMMAND_LINE ("p"s,
         "Usage:  mail [ -p ] { <user name> }"s)

   if (getarg (1, user, MAXLINE) == EOF)
      call receive_mail (ARG_PRESENT (p))

   else {
      for (arg = 1; getarg (arg, user, MAXLINE) ~= EOF; arg += 1)
         if (vfyusr (user) == ERR) {
            call print (ERROUT, "*s:  addressee unknown*n"s, user)
            stop
            }

      cache = mktemp (READWRITE)
      if (cache == ERR)
         call error ("can't create temporary file"s)

      call fcopy (STDIN, cache)

      for (arg = 1; getarg (arg, user, MAXLINE) ~= EOF; arg += 1) {
         call rewind (cache)
         call send_mail (cache, user)
         }

      call rmtemp (cache)
      }

   stop
   end



# receive_mail --- fetch a user's mail, print it, and save it if necessary

   subroutine receive_mail (no_page)
   integer no_page

   string mailbox "=mail=/=user="
   string savebox "=mailfile="

   integer box, sbox
   integer open, getlin

   character response (MAXLINE)

   box = open (mailbox, READ)
   if (box ~= ERR) {
      if (no_page == YES)
         call fcopy (box, STDOUT)
      else
         call page (box, "[*i] more? "s, "[END] "s, 22, STDOUT, PG_VTH)

      call print (ERROUT, "Save mail (y) ? "s)

      if (getlin (response, ERRIN) == EOF
        || (response (1) ~= 'n'c & response (1) ~= 'N'c)) {
         call rewind (box)

         sbox = open (savebox, READWRITE)
         if (sbox == ERR) {
            call close (box)
            call cant (savebox)
            }

         call wind (sbox)
         call fcopy (box, sbox)

         call close (sbox)
         }

      call close (box)
      call remove (mailbox)
      }

   return
   end



# send_mail --- send message to named user

   subroutine send_mail (file, user)
   integer file
   character user (ARB)

   character mailfile (40), dat (32), tim (9), sender (MAXUSERNAME)

   integer dest
   integer open

   call expand ("=user="s, sender, MAXUSERNAME)
   call date (SYS_LDATE, dat)
   call date (SYS_TIME, tim); tim (6) = EOS   # chop off the seconds

   call encode (mailfile, 40, "=mail=/*s"s, user)

   dest = open (mailfile, READWRITE)
   if (dest == ERR) {
      call print (ERROUT, "can't open *s's mailbox*n"s, user)
      return
      }

   call wind (dest)
   call print (dest, "*n*nFrom *s at *s on *s:*n*n"s,
      sender, tim, dat)
   call fcopy (file, dest)

   call close (dest)
   return
   end
