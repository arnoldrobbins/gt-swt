# print --- easy-to-use semi-formatted print routine

   subroutine print (fd, fmt, a1, a2, a3, a4, a5, a6, a7, a8, a9, a10)
   integer fd, a1, a2, a3, a4, a5, a6, a7, a8, a9, a10
   character fmt (ARB)

   character str (MAXPRINT), fmt1 (MAXLINE)

   if (fmt (1) == EOS || and (fmt (1), :177400) == 0)
      call encode (str, MAXPRINT, fmt,
         a1, a2, a3, a4, a5, a6, a7, a8, a9, a10)

   else {
      call ptoc (fmt, '.'c, fmt1, MAXLINE)
      call encode (str, MAXPRINT, fmt1,
         a1, a2, a3, a4, a5, a6, a7, a8, a9, a10)
      }

   call putlin (str, fd)

   return
   end
