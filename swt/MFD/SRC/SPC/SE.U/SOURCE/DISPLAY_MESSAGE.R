# display_message --- copy contents of message file to screen

   integer function display_message (fd)
   integer fd

   include SE_COMMON

   character lin (MAXCOLS)
   integer row, col, end_of_file, k
   integer getlin, length

   string more " M O R E  T O  C O M E "

   if (Toprow > 1) {
      Topln = max (1, Topln - (Toprow - 1))
      Toprow = 1
      }

   end_of_file = NO
   for (row = Toprow; row <= Botrow - 3; row += 1) {
      if (getlin (lin, fd, Ncols) == EOF) {
         end_of_file = YES
         break
         }
      Toprow += 1
      Topln += 1
      call loadstr (lin, row, 1, Ncols)
      }

   if (end_of_file == NO) {
      k = (Ncols - length (more)) / 2
      for (col = 1; col <= k; col += 1)
         call load ("*"c, row, col)
      for (k = 1; more (k) ~= EOS; {k += 1; col += 1})
         call load (more (k), row, col)
      for (; col <= Ncols; col += 1)
         call load ("*"c, row, col)
      Toprow += 1
      Topln += 1
      row += 1
      }

   do col = 1, Ncols
      call load ('-'c, row, col)
   Toprow += 1
   Topln += 1

   if (Topln > Lastln)
      call adjust_window (1, Lastln)
   if (Curln < Topln)
      Curln = min (Topln, Lastln)

   First_affected = Topln  # must rewrite the whole screen

   call mesg ("Enter o- to restore display"s, HELP_MSG)

   if (end_of_file == YES)
      return (EOF)
   return (OK)
   end
