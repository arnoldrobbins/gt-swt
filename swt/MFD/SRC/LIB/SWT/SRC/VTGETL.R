# vtgetl --- get a line from the VTH screen

   integer function vtgetl (str, row, col, clen)
   character str (ARB)
   integer row, col, clen

   include SWT_COMMON

   integer pos, i, len
   character c

   len = clen

   if (row < 1 || row > Maxrow) {
      str (1) = EOS
      return (0)
      }

   pos = min0 (Maxcol, col + len - 1)
   while (pos >= col) {
      vt$upk (c, Newscr, row, pos)
      if (c ~= ' 'c)
         break
      pos -= 1
      }
   i = pos - col + 1
   len = i
   str (i + 1) = EOS
   if (i > 0)
      repeat {
         str (i) = c
         i -= 1
         pos -= 1
         if (i <= 0)
            break
         vt$upk (c, Newscr, row, pos)
         }

   return (len)
   end
