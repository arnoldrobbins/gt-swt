# putdec --- put decimal integer  n  in field width >= w

   subroutine putdec (n, w, unit)
   integer n, w, unit

   character chars (20)
   integer itoc
   integer i, nd

   nd = itoc (n, chars, 20)
   for (i = nd + 1; i <= w; i += 1)
      call putch (' 'c, unit)
   for (i = 1; i <= nd; i += 1)
      call putch (chars (i), unit)

   return
   end
