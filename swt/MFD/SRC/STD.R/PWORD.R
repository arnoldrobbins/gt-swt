# pword --- change a users's login password

   include PRIMOS_ERRD

   integer duplx$, equal, input

   integer code, i, save_duplex
   character opw (9), npw (9)
   character buf1 (MAXLINE), buf2 (MAXLINE)


   save_duplex = duplx$ (-1)
   call duplx$ (:140000)      # turn off terminal echo

   if (input (STDIN, "Old password: *s"s, buf1) ~= EOF) {
      call putch (NEWLINE, STDOUT)
      i = 1
      call ctov (buf1, i, opw, 9)

      if (input (STDIN, "New password: *s"s, buf1) ~= EOF) {
         call putch (NEWLINE, STDOUT)

         if (input (STDIN, "Reenter new password for verification: *s"s, buf2)
               ~= EOF) {
            call putch (NEWLINE, STDOUT)

            if (equal (buf1, buf2) == NO)
               call error ("The new passwords do not match"p)

            i = 1
            call ctov (buf1, i, npw, 9)

            call chg$pw (opw, npw, code)

            select (code)
               when (EBPAR)
                  call error ("One of the passwords was illegal."p)
               when (EBPAS)
                  call error ("The old password did not match the actual password."p)
               when (EWTPR)
                  call error ("Disk is write protected. See system administrator."p)
            }
         }
      }

   call duplx$ (save_duplex)     # restore terminal echo

   stop
   end
