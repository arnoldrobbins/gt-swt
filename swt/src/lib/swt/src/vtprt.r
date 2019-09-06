# vtprt --- place characters using formatted strings into
#           the new screen buffer

   integer function vtprt (row, col, fmt,
                                 a1, a2, a3, a4, a5, a6, a7, a8, a9, a10)

   include SWT_COMMON

   integer row, col
   character fmt (ARB)
   untyped a1, a2, a3, a4, a5, a6, a7, a8, a9, a10
   character str (MAXLINE), fmt1 (MAXLINE)
   integer encode, size

   if (row > Maxrow || row < 1 || col < 1)
      return (ERR)

   if (and (fmt (1), :177400) == 0)
      size = encode (str, MAXLINE, fmt,
         a1, a2, a3, a4, a5, a6, a7, a8, a9, a10)
   else {
      call ptoc (fmt, '.'c, fmt1, MAXLINE)
      size = encode (str, MAXLINE, fmt1,
         a1, a2, a3, a4, a5, a6, a7, a8, a9, a10)
      }

# now put the encoded string into screen buffer
   call vt$put (str, row, col, size)

   return (size)
   end

