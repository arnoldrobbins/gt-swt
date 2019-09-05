# input --- semi-formatted input routine

   integer function input (fd, fmt, a1, a2, a3, a4, a5, a6, a7, a8, a9, a10)
   file_des fd
   character fmt (ARB)
   integer a1 (ARB), a2 (ARB), a3 (ARB), a4 (ARB), a5 (ARB),
           a6 (ARB), a7 (ARB), a8 (ARB), a9 (ARB), a10 (ARB)

   integer ap, sp, fp, i
   integer getlin, decode, index, isatty
   file_des tf
   character str (MAXDECODE), tfmt (MAXDECODE)
   logical psw

   if (and (fmt (1), :177400) ~= 0)
      call ptoc (fmt, '.'c, tfmt, MAXDECODE)
   else
      call ctoc (fmt, tfmt, MAXDECODE)

   fp = 1
   ap = 1

   psw = (isatty (fd) ~= NO)
   tf = fd

   repeat {
      while (tfmt (fp) ~= FORMATFLAG) {
         if (psw)
            call putch (tfmt (fp), TTY)
         fp += 1
         }

      if (tfmt (fp) == EOS)
         break

      if (getlin (str, tf, MAXDECODE) == EOF)
         return (EOF)

      sp = 1

      select (decode (str, sp, tfmt, fp, ap,
                           a1, a2, a3, a4, a5, a6, a7, a8, a9, a10))
         when (OK)      # there's more format left
            tf = fd
         when (EOF)     # end of format
            break
         when (ERR) {   # error in field
            i = index (str (sp), NEWLINE)    # print only to first NEWLINE
            if (i ~= 0)
               str (sp + i - 1) = EOS
            call print (TTY, "Error: '*s' retype: "s, str (sp))
            tf = TTY
            }
      }

   return (ap - 1)
   end
