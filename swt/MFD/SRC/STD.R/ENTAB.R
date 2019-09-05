# entab --- replace blanks by tabs and blanks

   character getch
   character c, tabch
   integer tabpos
   integer col, newcol, tabs (MAXLINE)

   call settab (tabs, tabch)
   col = 1
   repeat {
      newcol = col
      repeat {
         if (getch (c, STDIN) == tabch) {
            repeat {
               newcol = newcol + 1
               } until (tabpos (newcol, tabs) == YES)
            call putch (tabch, STDOUT)
            col = newcol
            }
         else if (c == ' 'c) {
            newcol = newcol + 1
            if (tabpos (newcol, tabs) == YES) {
               call putch (tabch, STDOUT)
               col = newcol
               }
            }
         else
            break
         }
      for ( ; col < newcol; col = col + 1)
         call putch (' 'c, STDOUT)      # output leftover blanks
      if (c == EOF)
         break
      call putch (c, STDOUT)
      if (c == NEWLINE)
         col = 1
      else
         col = col + 1
      }

   stop
   end



# tabpos --- return YES if col is a tab stop

   integer function tabpos (col, tabs)
   integer col, tabs (MAXLINE)

   if (col < 1 || col >= MAXLINE)
      tabpos = YES
   else
      tabpos = tabs (col)

   return
   end



# settab --- set initial tab stops, tab character

   subroutine settab (tabs, tabch)
   integer tabs (MAXLINE)
   character tabch

   integer i, j, n, max, last
   integer getarg, ctoi

   character arg (MAXARG)

   for (i = 1; i <= MAXLINE; i = i + 1)   # clear all tab stops
      tabs (i) = NO

   tabch = TAB          # set default tab character

   max = 0
   last = 1
   for (i = 1; getarg (i, arg, MAXARG) ~= EOF; i = i + 1)
      if (arg (1) == '-'c) {    # -t option?
         if (arg (2) == 't'c || arg (2) == 'T'c) {
            i = i + 1
            if (getarg (i, arg, 2) == EOF)
               call usage
            tabch = arg (1)
            }
         }
      else if (arg (1) == '+'c) {   # increment
         j = 2
         n = ctoi (arg, j)
         if (n > 0 && arg (j) == EOS) {
            for (j = last + n; j < MAXLINE; j = j + n) {
               tabs (j) = YES
               max = max0 (j, max)
               }
            last = 1
            }
         else
            call usage
         }
      else {
         j = 1
         n = ctoi (arg, j)
         if (n > 0 && n < MAXLINE && arg (j) == EOS) {
            tabs (n) = YES
            last = n
            max = max0 (n, max)
            }
         else
            call usage
         }

   if (max == 0) {   # no tab stops specified, use defaults
      for (i = 5; i < MAXLINE; i = i + 4)
         tabs (i) = YES
      max = i - 4
      }

   for (i = max + 1; i < MAXLINE; i = i + 1)
      tabs (i) = YES

   return
   end



# usage --- print usage diagnostic and die

   subroutine usage

   call error ("Usage: entab { -t <tab char> | <col> | +<inc> }"p)

   end
