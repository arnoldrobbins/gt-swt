# ttyp$q --- obtain the terminal type from the user

   integer function ttyp$q (ttype, blankok)
   character ttype (ARB)
   integer blankok

   include SWT_COMMON

   integer i
   integer equal, input, ttyp$v
   character str (MAXLINE)

   while (input (TTY, "Enter terminal type: *s"s, str) ~= EOF) {
      call mapstr (str, LOWER)
      if (str (1) == EOS && blankok == YES) {
         do i = 1, MAXTERMATTR
            Term_attr (i) = NO
         Term_type (1) = EOS
         ttype (1) = EOS
         return (YES)
         }
      else if (equal (str, "?"s) == YES || equal (str, "help"s) == YES)
         call ttyp$l
      else if (ttyp$v (str) == YES) {
         call ctoc (str, ttype, MAXTERMTYPE)
         return (YES)
         }
      else
         call print (TTY, "Invalid terminal type; enter '?' for help.*n"s)
      }

   call print (TTY, "*n"s)

   return (NO)
   end
