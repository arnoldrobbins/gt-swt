# loadstr --- load a string into a field of the screen

   subroutine loadstr (str, row, stcol, endcol)
   character str (ARB)
   integer row, stcol, endcol

   include SE_COMMON

   character ch
   integer p, c, limit

   if (row >= 1 && row <= Nrows && stcol >= 1) {
      c = stcol
      for (p = 1; str (p) ~= EOS; p += 1) {
         if (c > Ncols)
            break
         ch = str (p)
         if (ch < ' 'c || ch >= DEL)
            ch = Unprintable
         if (Screen_image (c, row) ~= ch) {
            Screen_image (c, row) = ch
            call position_cursor (row, c)
            call send (ch)
            }
         c += 1
         }
      if (endcol >= Ncols && c < Ncols)
         call clear_to_eol (row, c)
      else
         for (limit = min (endcol, Ncols); c <= limit; c += 1)
            if (Screen_image (c, row) ~= ' 'c) {
               Screen_image (c, row) = ' 'c
               call position_cursor (row, c)
               call send (' 'c)
               }
      }

   return
   end
