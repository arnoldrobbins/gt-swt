# des --- National Bureau of Standards encrypter/decrypter

#  Usage:   des  (-e | -d)  [ -k <key> ]  { <file> }
#           output (cipher or plaintext) to standard output

   linkage _
      encrypt_chunk,
      decrypt_chunk,
      cipher_function,
      initial_permutation,
      inverse_initial_permutation

define(USAGE_MESSAGE,"Usage:  des  (-e | -d)  [ -k <key> ]  { <file> }"p)
define(bit,integer)
undefine(bits)

define(ON,)
define(OFF,#)
define(ASSERTIONS,OFF)
define(assert(bool),ASSERTIONS if(~(bool))
   ASSERTIONS call error("false assertion:  bool"p))

   include ARGUMENT_DEFS

   ARG_DECL

   character keystr (MAXLINE), filename (MAXPATH)

   bit key (64)

   filedes fd
   filedes mktemp, open

   integer arg
   integer getarg

   PARSE_COMMAND_LINE ("e<f>d<f>k<rs>"s, USAGE_MESSAGE)

   if (ARG_PRESENT (e) && ARG_PRESENT (d)
     || ~ARG_PRESENT (e) && ~ARG_PRESENT (d))
      call error (USAGE_MESSAGE)

   if (ARG_PRESENT (k))
      call explode_key (ARG_TEXT (k), key)
   else {
      call prompt_for_key (keystr)
      call explode_key (keystr, key)
      }

   if (ARG_PRESENT (e)) {
      fd = mktemp (READWRITE)
      call gather_plaintext (fd)
      call encrypt (fd, key, STDOUT)
      call rmtemp (fd)
      }
   elif (ARG_PRESENT (d)) {
      for (arg = 1; getarg (arg, filename, MAXPATH) ~= EOF; arg += 1) {
         fd = open (filename, READ)
         if (fd == ERR) {
            call putlin (filename, ERROUT)
            call remark (": can't open"p)
            }
         else
            call decrypt (fd, key, STDOUT)
         }
      if (arg == 1)        # no files specified; use STDIN
         call decrypt (STDIN, key, STDOUT)
      }

   stop
   end



# prompt_for_key --- prod user for the encryption/decryption key

   subroutine prompt_for_key (key)
   character key (MAXLINE)

   integer lword, len
   integer duplx$, getlin, equal

   character validation (MAXLINE)

   lword = duplx$ (-1)        # get the current terminal descriptor word
   call duplx$ (:140000)      # turn off the echo

   call putlin ("Enter key:  "s, ERROUT)
   len = getlin (key, ERRIN)
   if (len == EOF) {
      call duplx$ (lword)
      call error (""p)
      }
   call putch (NEWLINE, ERROUT)

   call putlin ("Reenter key for validation:  "s, ERROUT)
   if (getlin (validation, ERRIN) == EOF) {
      call duplx$ (lword)
      call error (""p)
      }
   call putch (NEWLINE, ERROUT)

   call duplx$ (lword)        # restore terminal to former setting

   if (equal (key, validation) == NO)
      call error ("Keys do not match"p)

   key (len) = EOS            # chop off the NEWLINE

   return
   end



# explode_key --- convert key string to bits required by the DES

   subroutine explode_key (keystr, key)
   character keystr (MAXLINE)
   bit key (64)

   # Several peculiar machine-dependent operations take place in this
   # routine.

   # The DES wants an array of 8 characters, where each character is
   # composed of 7 bits plus a parity bit.  The bits of a character
   # are numbered 1 to 8, left to right, where bit 8 is parity.
   # Significance of bits is unspecified; there is no indication of
   # whether bit 1 is most significant or least significant.  Parity,
   # if checked, must be odd.

   # For this implementation, 'explode_key' pads the supplied key
   # string with blanks to a length of 8, unpacks each character with
   # the LSB on the left and the MSB and parity on the right, and
   # completely ignores the values of the parity bits.

   character str (MAXLINE)

   integer i, bp, mask

   for (i = 1; keystr (i) ~= EOS; i += 1)
      str (i) = keystr (i)
   for (; i <= 8; i += 1)
      str (i) = ' 'c

   bp = 1
   do i = 1, 8
      for (mask = 1; mask <= 128; mask = ls (mask, 1)) {
         if (and (mask, str (i)) == 0)
            key (bp) = 0
         else
            key (bp) = 1
         bp += 1
         }

   return
   end



# gather_plaintext --- read plaintext input files, find total size

   subroutine gather_plaintext (scratchfile)
   filedes scratchfile

   integer arg, buf (1024), nwr
   integer readf, getarg

   character filename (MAXPATH)

   filedes fd
   filedes open

   long_int size

   size = 0
   call writef (buf, 4, scratchfile)      # reserve space for size

   for (arg = 1; getarg (arg, filename, MAXPATH) ~= EOF; arg += 1) {
      fd = open (filename, READ)
      if (fd == ERR) {
         call putlin (filename, ERROUT)
         call remark (": can't open"p)
         }
      else {
         repeat {
            nwr = readf (buf, 1024, fd)
            if (nwr == EOF)
               break
            size += nwr
            call writef (buf, nwr, scratchfile)
            }
         call close (fd)
         }
      }
   if (arg == 1)                       # no files specified, use STDIN
      repeat {
         nwr = readf (buf, 1024, STDIN)
         if (nwr == EOF)
            break
         size += nwr
         call writef (buf, nwr, scratchfile)
         }

   call rewind (scratchfile)
   call writef (size, 2, scratchfile)  # put size in stuff to be encrypted
   call rewind (scratchfile)           # so it's not sent in the clear

   return
   end



# encrypt --- apply DES encryption to file, using key, yielding new file

   subroutine encrypt (in, key, out)
   filedes in, out
   bit key (64)

   bit key_sched (48, 16), plain (64), cipher (64)

   integer buf (4)
   integer readf

   call compute_key_schedule (key, key_sched)

   while (readf (buf, 4, in) ~= EOF) {
      call unpack (64, buf, plain)
      call encrypt_chunk (plain, cipher, key_sched)
      call pack (64, cipher, buf)
      call writef (buf, 4, out)
      }

   return
   end



# encrypt_chunk --- encrypt one chunk of data
#  Re-coded in PMA
#
#   subroutine encrypt_chunk (plain, cipher, key_sched)
#   bit plain (64), cipher (64), key_sched (48, 16)
#
#   bit left_even (32), right_even (32), left_odd (32), right_odd (32),
#      temp (32)
#
#   integer i, j
#
#   call initial_permutation (plain, left_even, right_even)
#
#   do i = 1, 15, 2; {
#      do j = 1, 32
#         left_odd (j) = right_even (j)
#      call cipher_function (right_even, key_sched (1, i), temp)
#      do j = 1, 32; {
#         right_odd (j) = xor (left_even (j), temp (j))
#         assert (right_odd (j) == 0 || right_odd (j) == 1)
#         }
#      do j = 1, 32
#         left_even (j) = right_odd (j)
#      call cipher_function (right_odd, key_sched (1, i + 1), temp)
#      do j = 1, 32; {
#         right_even (j) = xor (left_odd (j), temp (j))
#         assert (right_even (j) == 0 || right_even (j) == 1)
#         }
#      }
#
#   call inverse_initial_permutation (right_even, left_even, cipher)
#
#   return
#   end



# decrypt --- apply DES decryption to file, using key, yielding new file

   subroutine decrypt (in, key, out)
   filedes in, out
   bit key (64)

   bit key_sched (48, 16), cipher (64), plain (64)

   integer buf (4)
   integer readf

   long_int size

   call compute_key_schedule (key, key_sched)

   if (readf (buf, 4, in) == EOF)
      return
   call unpack (64, buf, cipher)
   call decrypt_chunk (cipher, plain, key_sched)
   call pack (32, plain, size)
   assert (size >= 0)

   while (readf (buf, 4, in) ~= EOF) {
      call unpack (64, buf, cipher)
      call decrypt_chunk (cipher, plain, key_sched)
      call pack (64, plain, buf)
      if (size > 4)
         call writef (buf, 4, out)
      else
         call writef (buf, ints (size), out)
      size -= 4
      }

   return
   end



# decrypt_chunk --- decrypt one chunk of data
#  Re-coded in PMA
#
#   subroutine decrypt_chunk (cipher, plain, key_sched)
#   bit cipher (64), plain (64), key_sched (48, 16)
#
#   bit left_even (32), right_even (32), left_odd (32), right_odd (32),
#      temp (32)
#
#   integer i, j
#
#   call initial_permutation (cipher, right_even, left_even)
#
#   for (i = 15; i >= 1; i -= 2) {
#      do j = 1, 32
#         right_odd (j) = left_even (j)
#      call cipher_function (left_even, key_sched (1, i + 1), temp)
#      do j = 1, 32; {
#         left_odd (j) = xor (right_even (j), temp (j))
#         assert (left_odd (j) == 0 || left_odd (j) == 1)
#         }
#      do j = 1, 32
#         right_even (j) = left_odd (j)
#      call move$ (left_odd, right_even, 32)
#      call cipher_function (left_odd, key_sched (1, i), temp)
#      do j = 1, 32; {
#         left_even (j) = xor (right_odd (j), temp (j))
#         assert (left_even (j) == 0 || left_even (j) == 1)
#         }
#      }
#
#   call inverse_initial_permutation (left_even, right_even, plain)
#
#   return
#   end



# compute_key_schedule --- convert key to complete key schedule

   subroutine compute_key_schedule (key, key_sched)
   bit key (64), key_sched (48, 16)

   bit c (28), d (28)

   integer i, j, k, c_carry, d_carry

   integer c_select (28), d_select (28), shift_amount (16), k_select (48)

   data c_select / 57, 49, 41, 33, 25, 17, 9, 1, 58, 50, 42, 34,
      26, 18, 10, 2, 59, 51, 43, 35, 27, 19, 11, 3, 60, 52, 44, 36 /
   data d_select / 63, 55, 47, 39, 31, 23, 15, 7, 62, 54, 46, 38,
      30, 22, 14, 6, 61, 53, 45, 37, 29, 21, 13, 5, 28, 20, 12, 4 /
   data shift_amount / 1, 1, 2, 2, 2, 2, 2, 2, 1, 2, 2, 2, 2, 2, 2, 1 /
   data k_select / 14, 17, 11, 24, 1, 5, 3, 28, 15, 6, 21, 10, 23, 19,
      12, 4, 26, 8, 16, 7, 27, 20, 13, 2, 41, 52, 31, 37, 47, 55, 30,
      40, 51, 45, 33, 48, 44, 49, 39, 56, 34, 53, 46, 42, 50, 36, 29, 32 /

   do i = 1, 28; {
      c (i) = key (c_select (i))
      d (i) = key (d_select (i))
      }

   do i = 1, 16; {
      for (j = 1; j <= shift_amount (i); j += 1) {
         c_carry = c (1)
         d_carry = d (1)
         do k = 1, 27; {
            c (k) = c (k + 1)
            d (k) = d (k + 1)
            }
         c (28) = c_carry
         d (28) = d_carry
         }
      do j = 1, 48; {
         if (k_select (j) <= 28)
            key_sched (j, i) = c (k_select (j))
         else
            key_sched (j, i) = d (k_select (j) - 28)
         assert (key_sched (j, i) == 0 || key_sched (j, i) == 1)
         }
      }

   return
   end



# initial_permutation --- carry out the DES initial permutation step

   subroutine initial_permutation (text, left, right)
   bit text (64), left (32), right (32)

   integer i

   integer l_select (32), r_select (32)

   data l_select / 58, 50, 42, 34, 26, 18, 10, 2, 60, 52, 44, 36, 28, 20,
      12, 4, 62, 54, 46, 38, 30, 22, 14, 6, 64, 56, 48, 40, 32, 24, 16, 8 /
   data r_select / 57, 49, 41, 33, 25, 17, 9, 1, 59, 51, 43, 35, 27, 19,
      11, 3, 61, 53, 45, 37, 29, 21, 13, 5, 63, 55, 47, 39, 31, 23, 15, 7 /

   do i = 1, 32; {
      left (i) = text (l_select (i))
      assert (left (i) == 0 || left (i) == 1)
      right (i) = text (r_select (i))
      assert (right (i) == 0 || right (i) == 1)
      }

   return
   end



# inverse_initial_permutation --- perform DES inverse IP step

   subroutine inverse_initial_permutation (left, right, text)
   bit left (32), right (32), text (64)

   integer i

   integer t_select (64)

   data t_select / 40, 8, 48, 16, 56, 24, 64, 32, 39, 7, 47, 15, 55, 23,
      63, 31, 38, 6, 46, 14, 54, 22, 62, 30, 37, 5, 45, 13, 53, 21, 61,
      29, 36, 4, 44, 12, 52, 20, 60, 28, 35, 3, 43, 11, 51, 19, 59, 27,
      34, 2, 42, 10, 50, 18, 58, 26, 33, 1, 41, 9, 49, 17, 57, 25 /

   do i = 1, 64; {
      if (t_select (i) <= 32)
         text (i) = left (t_select (i))
      else
         text (i) = right (t_select (i) - 32)
      assert (text (i) == 0 || text (i) == 1)
      }

   return
   end



# cipher_function --- perform central DES cipher function
#  re-coded in PMA
#
#   subroutine cipher_function (a, key, val)
#   bit a (32), key (48), val (32)
#
#   bit e (48), r (32)
#
#   integer i, j, k, loc
#
#   integer e_select (48), val_select (32), s (2048)
#
#   data e_select / 32, 1, 2, 3, 4, 5, 4, 5, 6, 7, 8, 9, 8, 9, 10, 11,
#      12, 13, 12, 13, 14, 15, 16, 17, 16, 17, 18, 19, 20, 21, 20, 21,
#      22, 23, 24, 25, 24, 25, 26, 27, 28, 29, 28, 29, 30, 31, 32, 1 /
#
#   data val_select / 16, 7, 20, 21, 29, 12, 28, 17, 1, 15, 23, 26, 5, 18,
#      31, 10, 2, 8, 24, 14, 32, 27, 3, 9, 19, 13, 30, 6, 22, 11, 4, 25 /
#
#   data s / _
#      1, 1, 1, 0, 0, 1, 0, 0, 1, 1, 0, 1, 0, 0, 0, 1,
#      0, 0, 1, 0, 1, 1, 1, 1, 1, 0, 1, 1, 1, 0, 0, 0,
#      0, 0, 1, 1, 1, 0, 1, 0, 0, 1, 1, 0, 1, 1, 0, 0,
#      0, 1, 0, 1, 1, 0, 0, 1, 0, 0, 0, 0, 0, 1, 1, 1,
#      0, 0, 0, 0, 1, 1, 1, 1, 0, 1, 1, 1, 0, 1, 0, 0,
#      1, 1, 1, 0, 0, 0, 1, 0, 1, 1, 0, 1, 0, 0, 0, 1,
#      1, 0, 1, 0, 0, 1, 1, 0, 1, 1, 0, 0, 1, 0, 1, 1,
#      1, 0, 0, 1, 0, 1, 0, 1, 0, 0, 1, 1, 1, 0, 0, 0,
#      0, 1, 0, 0, 0, 0, 0, 1, 1, 1, 1, 0, 1, 0, 0, 0,
#      1, 1, 0, 1, 0, 1, 1, 0, 0, 0, 1, 0, 1, 0, 1, 1,
#      1, 1, 1, 1, 1, 1, 0, 0, 1, 0, 0, 1, 0, 1, 1, 1,
#      0, 0, 1, 1, 1, 0, 1, 0, 0, 1, 0, 1, 0, 0, 0, 0,
#      1, 1, 1, 1, 1, 1, 0, 0, 1, 0, 0, 0, 0, 0, 1, 0,
#      0, 1, 0, 0, 1, 0, 0, 1, 0, 0, 0, 1, 0, 1, 1, 1,
#      0, 1, 0, 1, 1, 0, 1, 1, 0, 0, 1, 1, 1, 1, 1, 0,
#      1, 0, 1, 0, 0, 0, 0, 0, 0, 1, 1, 0, 1, 1, 0, 1,
#
#      1, 1, 1, 1, 0, 0, 0, 1, 1, 0, 0, 0, 1, 1, 1, 0,
#      0, 1, 1, 0, 1, 0, 1, 1, 0, 0, 1, 1, 0, 1, 0, 0,
#      1, 0, 0, 1, 0, 1, 1, 1, 0, 0, 1, 0, 1, 1, 0, 1,
#      1, 1, 0, 0, 0, 0, 0, 0, 0, 1, 0, 1, 1, 0, 1, 0,
#      0, 0, 1, 1, 1, 1, 0, 1, 0, 1, 0, 0, 0, 1, 1, 1,
#      1, 1, 1, 1, 0, 0, 1, 0, 1, 0, 0, 0, 1, 1, 1, 0,
#      1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 0, 1, 0,
#      0, 1, 1, 0, 1, 0, 0, 1, 1, 0, 1, 1, 0, 1, 0, 1,
#      0, 0, 0, 0, 1, 1, 1, 0, 0, 1, 1, 1, 1, 0, 1, 1,
#      1, 0, 1, 0, 0, 1, 0, 0, 1, 1, 0, 1, 0, 0, 0, 1,
#      0, 1, 0, 1, 1, 0, 0, 0, 1, 1, 0, 0, 0, 1, 1, 0,
#      1, 0, 0, 1, 0, 0, 1, 1, 0, 0, 1, 0, 1, 1, 1, 1,
#      1, 1, 0, 1, 1, 0, 0, 0, 1, 0, 1, 0, 0, 0, 0, 1,
#      0, 0, 1, 1, 1, 1, 1, 1, 0, 1, 0, 0, 0, 0, 1, 0,
#      1, 0, 1, 1, 0, 1, 1, 0, 0, 1, 1, 1, 1, 1, 0, 0,
#      0, 0, 0, 0, 0, 1, 0, 1, 1, 1, 1, 0, 1, 0, 0, 1,
#
#      1, 0, 1, 0, 0, 0, 0, 0, 1, 0, 0, 1, 1, 1, 1, 0,
#      0, 1, 1, 0, 0, 0, 1, 1, 1, 1, 1, 1, 0, 1, 0, 1,
#      0, 0, 0, 1, 1, 1, 0, 1, 1, 1, 0, 0, 0, 1, 1, 1,
#      1, 0, 1, 1, 0, 1, 0, 0, 0, 0, 1, 0, 1, 0, 0, 0,
#      1, 1, 0, 1, 0, 1, 1, 1, 0, 0, 0, 0, 1, 0, 0, 1,
#      0, 0, 1, 1, 0, 1, 0, 0, 0, 1, 1, 0, 1, 0, 1, 0,
#      0, 0, 1, 0, 1, 0, 0, 0, 0, 1, 0, 1, 1, 1, 1, 0,
#      1, 1, 0, 0, 1, 0, 1, 1, 1, 1, 1, 1, 0, 0, 0, 1,
#      1, 1, 0, 1, 0, 1, 1, 0, 0, 1, 0, 0, 1, 0, 0, 1,
#      1, 0, 0, 0, 1, 1, 1, 1, 0, 0, 1, 1, 0, 0, 0, 0,
#      1, 0, 1, 1, 0, 0, 0, 1, 0, 0, 1, 0, 1, 1, 0, 0,
#      0, 1, 0, 1, 1, 0, 1, 0, 1, 1, 1, 0, 0, 1, 1, 1,
#      0, 0, 0, 1, 1, 0, 1, 0, 1, 1, 0, 1, 0, 0, 0, 0,
#      0, 1, 1, 0, 1, 0, 0, 1, 1, 0, 0, 0, 0, 1, 1, 1,
#      0, 1, 0, 0, 1, 1, 1, 1, 1, 1, 1, 0, 0, 0, 1, 1,
#      1, 0, 1, 1, 0, 1, 0, 1, 0, 0, 1, 0, 1, 1, 0, 0,
#
#      0, 1, 1, 1, 1, 1, 0, 1, 1, 1, 1, 0, 0, 0, 1, 1,
#      0, 0, 0, 0, 0, 1, 1, 0, 1, 0, 0, 1, 1, 0, 1, 0,
#      0, 0, 0, 1, 0, 0, 1, 0, 1, 0, 0, 0, 0, 1, 0, 1,
#      1, 0, 1, 1, 1, 1, 0, 0, 0, 1, 0, 0, 1, 1, 1, 1,
#      1, 1, 0, 1, 1, 0, 0, 0, 1, 0, 1, 1, 0, 1, 0, 1,
#      0, 1, 1, 0, 1, 1, 1, 1, 0, 0, 0, 0, 0, 0, 1, 1,
#      0, 1, 0, 0, 0, 1, 1, 1, 0, 0, 1, 0, 1, 1, 0, 0,
#      0, 0, 0, 1, 1, 0, 1, 0, 1, 1, 1, 0, 1, 0, 0, 1,
#      1, 0, 1, 0, 0, 1, 1, 0, 1, 0, 0, 1, 0, 0, 0, 0,
#      1, 1, 0, 0, 1, 0, 1, 1, 0, 1, 1, 1, 1, 1, 0, 1,
#      1, 1, 1, 1, 0, 0, 0, 1, 0, 0, 1, 1, 1, 1, 1, 0,
#      0, 1, 0, 1, 0, 0, 1, 0, 1, 0, 0, 0, 0, 1, 0, 0,
#      0, 0, 1, 1, 1, 1, 1, 1, 0, 0, 0, 0, 0, 1, 1, 0,
#      1, 0, 1, 0, 0, 0, 0, 1, 1, 1, 0, 1, 1, 0, 0, 0,
#      1, 0, 0, 1, 0, 1, 0, 0, 0, 1, 0, 1, 1, 0, 1, 1,
#      1, 1, 0, 0, 0, 1, 1, 1, 0, 0, 1, 0, 1, 1, 1, 0,
#
#      0, 0, 1, 0, 1, 1, 0, 0, 0, 1, 0, 0, 0, 0, 0, 1,
#      0, 1, 1, 1, 1, 0, 1, 0, 1, 0, 1, 1, 0, 1, 1, 0,
#      1, 0, 0, 0, 0, 1, 0, 1, 0, 0, 1, 1, 1, 1, 1, 1,
#      1, 1, 0, 1, 0, 0, 0, 0, 1, 1, 1, 0, 1, 0, 0, 1,
#      1, 1, 1, 0, 1, 0, 1, 1, 0, 0, 1, 0, 1, 1, 0, 0,
#      0, 1, 0, 0, 0, 1, 1, 1, 1, 1, 0, 1, 0, 0, 0, 1,
#      0, 1, 0, 1, 0, 0, 0, 0, 1, 1, 1, 1, 1, 0, 1, 0,
#      0, 0, 1, 1, 1, 0, 0, 1, 1, 0, 0, 0, 0, 1, 1, 0,
#      0, 1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1, 1, 0, 1, 1,
#      1, 0, 1, 0, 1, 1, 0, 1, 0, 1, 1, 1, 1, 0, 0, 0,
#      1, 1, 1, 1, 1, 0, 0, 1, 1, 1, 0, 0, 0, 1, 0, 1,
#      0, 1, 1, 0, 0, 0, 1, 1, 0, 0, 0, 0, 1, 1, 1, 0,
#      1, 0, 1, 1, 1, 0, 0, 0, 1, 1, 0, 0, 0, 1, 1, 1,
#      0, 0, 0, 1, 1, 1, 1, 0, 0, 0, 1, 0, 1, 1, 0, 1,
#      0, 1, 1, 0, 1, 1, 1, 1, 0, 0, 0, 0, 1, 0, 0, 1,
#      1, 0, 1, 0, 0, 1, 0, 0, 0, 1, 0, 1, 0, 0, 1, 1,
#
#      1, 1, 0, 0, 0, 0, 0, 1, 1, 0, 1, 0, 1, 1, 1, 1,
#      1, 0, 0, 1, 0, 0, 1, 0, 0, 1, 1, 0, 1, 0, 0, 0,
#      0, 0, 0, 0, 1, 1, 0, 1, 0, 0, 1, 1, 0, 1, 0, 0,
#      1, 1, 1, 0, 0, 1, 1, 1, 0, 1, 0, 1, 1, 0, 1, 1,
#      1, 0, 1, 0, 1, 1, 1, 1, 0, 1, 0, 0, 0, 0, 1, 0,
#      0, 1, 1, 1, 1, 1, 0, 0, 1, 0, 0, 1, 0, 1, 0, 1,
#      0, 1, 1, 0, 0, 0, 0, 1, 1, 1, 0, 1, 1, 1, 1, 0,
#      0, 0, 0, 0, 1, 0, 1, 1, 0, 0, 1, 1, 1, 0, 0, 0,
#      1, 0, 0, 1, 1, 1, 1, 0, 1, 1, 1, 1, 0, 1, 0, 1,
#      0, 0, 1, 0, 1, 0, 0, 0, 1, 1, 0, 0, 0, 0, 1, 1,
#      0, 1, 1, 1, 0, 0, 0, 0, 0, 1, 0, 0, 1, 0, 1, 0,
#      0, 0, 0, 1, 1, 1, 0, 1, 1, 0, 1, 1, 0, 1, 1, 0,
#      0, 1, 0, 0, 0, 0, 1, 1, 0, 0, 1, 0, 1, 1, 0, 0,
#      1, 0, 0, 1, 0, 1, 0, 1, 1, 1, 1, 1, 1, 0, 1, 0,
#      1, 0, 1, 1, 1, 1, 1, 0, 0, 0, 0, 1, 0, 1, 1, 1,
#      0, 1, 1, 0, 0, 0, 0, 0, 1, 0, 0, 0, 1, 1, 0, 1,
#
#      0, 1, 0, 0, 1, 0, 1, 1, 0, 0, 1, 0, 1, 1, 1, 0,
#      1, 1, 1, 1, 0, 0, 0, 0, 1, 0, 0, 0, 1, 1, 0, 1,
#      0, 0, 1, 1, 1, 1, 0, 0, 1, 0, 0, 1, 0, 1, 1, 1,
#      0, 1, 0, 1, 1, 0, 1, 0, 0, 1, 1, 0, 0, 0, 0, 1,
#      1, 1, 0, 1, 0, 0, 0, 0, 1, 0, 1, 1, 0, 1, 1, 1,
#      0, 1, 0, 0, 1, 0, 0, 1, 0, 0, 0, 1, 1, 0, 1, 0,
#      1, 1, 1, 0, 0, 0, 1, 1, 0, 1, 0, 1, 1, 1, 0, 0,
#      0, 0, 1, 0, 1, 1, 1, 1, 1, 0, 0, 0, 0, 1, 1, 0,
#      0, 0, 0, 1, 0, 1, 0, 0, 1, 0, 1, 1, 1, 1, 0, 1,
#      1, 1, 0, 0, 0, 0, 1, 1, 0, 1, 1, 1, 1, 1, 1, 0,
#      1, 0, 1, 0, 1, 1, 1, 1, 0, 1, 1, 0, 1, 0, 0, 0,
#      0, 0, 0, 0, 0, 1, 0, 1, 1, 0, 0, 1, 0, 0, 1, 0,
#      0, 1, 1, 0, 1, 0, 1, 1, 1, 1, 0, 1, 1, 0, 0, 0,
#      0, 0, 0, 1, 0, 1, 0, 0, 1, 0, 1, 0, 0, 1, 1, 1,
#      1, 0, 0, 1, 0, 1, 0, 1, 0, 0, 0, 0, 1, 1, 1, 1,
#      1, 1, 1, 0, 0, 0, 1, 0, 0, 0, 1, 1, 1, 1, 0, 0,
#
#      1, 1, 0, 1, 0, 0, 1, 0, 1, 0, 0, 0, 0, 1, 0, 0,
#      0, 1, 1, 0, 1, 1, 1, 1, 1, 0, 1, 1, 0, 0, 0, 1,
#      1, 0, 1, 0, 1, 0, 0, 1, 0, 0, 1, 1, 1, 1, 1, 0,
#      0, 1, 0, 1, 0, 0, 0, 0, 1, 1, 0, 0, 0, 1, 1, 1,
#      0, 0, 0, 1, 1, 1, 1, 1, 1, 1, 0, 1, 1, 0, 0, 0,
#      1, 0, 1, 0, 0, 0, 1, 1, 0, 1, 1, 1, 0, 1, 0, 0,
#      1, 1, 0, 0, 0, 1, 0, 1, 0, 1, 1, 0, 1, 0, 1, 1,
#      0, 0, 0, 0, 1, 1, 1, 0, 1, 0, 0, 1, 0, 0, 1, 0,
#      0, 1, 1, 1, 1, 0, 1, 1, 0, 1, 0, 0, 0, 0, 0, 1,
#      1, 0, 0, 1, 1, 1, 0, 0, 1, 1, 1, 0, 0, 0, 1, 0,
#      0, 0, 0, 0, 0, 1, 1, 0, 1, 0, 1, 0, 1, 1, 0, 1,
#      1, 1, 1, 1, 0, 0, 1, 1, 0, 1, 0, 1, 1, 0, 0, 0,
#      0, 0, 1, 0, 0, 0, 0, 1, 1, 1, 1, 0, 0, 1, 1, 1,
#      0, 1, 0, 0, 1, 0, 1, 0, 1, 0, 0, 0, 1, 1, 0, 1,
#      1, 1, 1, 1, 1, 1, 0, 0, 1, 0, 0, 1, 0, 0, 0, 0,
#      0, 0, 1, 1, 0, 1, 0, 1, 0, 1, 1, 0, 1, 0, 1, 1 /
#
#   do i = 1, 48; {
#      e (i) = xor (a (e_select (i)), key (i))
#      assert (e (i) == 0 || e (i) == 1)
#      }
#
#   k = 1
#   j = 1
#   do i = 1, 8; {
#      loc = 256 * (i - 1) _
#         + 64 * (2 * e (k) + e (k + 5)) _
#         + 4 * (8 * e(k + 1) + 4 * e(k + 2) + 2 * e(k + 3) + e(k + 4)) _
#         + 1
#      assert (loc >= 1 && loc <= 2045)
#      r (j) = s (loc)
#      r (j + 1) = s (loc + 1)
#      r (j + 2) = s (loc + 2)
#      r (j + 3) = s (loc + 3)
#      k = k + 6
#      j = j + 4
#      }
#
#   do i = 1, 32
#      val (i) = r (val_select (i))
#
#   return
#   end



# pack --- pack specified number of bits into an integer array

   subroutine pack (bits, source, dest)
   integer bits, dest (ARB)
   bit source (ARB)

   integer si, di, mask

   di = 0
   mask = 0
   for (si = 1; si <= bits; si += 1) {
      if (mask == 0) {
         mask = :100000
         di += 1
         dest (di) = 0
         }
      if (source (si) ~= 0)
         dest (di) |= mask
      mask = rs (mask, 1)
      }

   return
   end




# unpack --- unpack specified number of bits from an integer array

   subroutine unpack (bits, source, dest)
   integer bits, source (ARB)
   bit dest (ARB)

   integer si, di, mask

   si = 0
   mask = 0
   for (di = 1; di <= bits; di += 1) {
      if (mask == 0) {
         si += 1
         mask = :100000
         }
      if (and (mask, source (si)) ~= 0)
         dest (di) = 1
      else
         dest (di) = 0
      mask = rs (mask, 1)
      }

   return
   end
