# updscreen --- update screen from edit buffer

   subroutine updscreen

   include SE_COMMON

   character abs_lineno (10), rel_lineno (10)
   integer line, row, i
   pointer k
   pointer getind
   string sone "1"
   string sdollar "$"
   string rocket ".  ->"

   call fixscreen

   line = Topln
   k = getind (line)
   for (row = Toprow; row <= Botrow; row += 1) {
      if (line > Lastln || line < 1) {
         call loadstr (EOS, row, 1, BARCOL - 1)
         call load ('|'c, row, BARCOL)
         call loadstr (EOS, row, BARCOL + 1, Ncols)
         }
      else {
         if (line == Curln)
            call loadstr (".  ->"s, row, 1, NAMECOL - 1)
         elif (line == 1)
            call loadstr ("1"s, row, 1, NAMECOL - 1)
         elif (line == Lastln)
            call loadstr ("$"s, row, 1, NAMECOL - 1)
         elif (Absnos == NO && row <= 26) {
            rel_lineno (1) = Rel_a + row - 1
            rel_lineno (2) = EOS
            call loadstr (rel_lineno, row, 1, NAMECOL - 1)
            }
         else {
            call itoc (line, abs_lineno, 9)
            call loadstr (abs_lineno, row, 1, NAMECOL - 1)
            }

         call load (Markname (k), row, NAMECOL)
         call load ('|'c, row, BARCOL)

         if (line >= First_affected) {
            call gtxt (k)
            if (Firstcol >= Lineleng (k))
               call loadstr (EOS, row, POOPCOL, Ncols)
            else
               call loadstr (Txt (Firstcol), row, POOPCOL, Ncols)
            }
         }
      line += 1
      k = Nextline (k)
      }

   First_affected = Lastln
   Sctop = Topln
   Sclen = Botrow - Toprow + 1
   for (i = 1; i <= Sclen; i += 1)
      if (Sctop + i - 1 <= Lastln)
         Scline (i) = i
      else
         Scline (i) = -1

   return
   end
