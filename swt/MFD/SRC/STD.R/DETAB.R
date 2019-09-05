# detab --- convert tabs to equivalent number of blanks

   character line (MAXLINE), tabch, repstr (MAXARG)
   character getrc

   integer col, i, tabs (MAXLINE), rscol
   integer tabpos, getlin


   call settab (tabs, tabch, repstr)   # set initial parameters
   col = 1
   rscol = 1
   while (getlin (line, STDIN) ~= EOF)
      for (i = 1; line (i) ~= EOS; i = i + 1)
         if (line (i) == tabch) {
            repeat {
               call putch (getrc (repstr, rscol), STDOUT)
               col = col + 1
               } until (tabpos (col, tabs) == YES)
            }
         else {
            rscol = 1
            call putch (line (i), STDOUT)
            if (line (i) == NEWLINE)
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
   subroutine settab (tabs, tabch, repstr)
   integer tabs (MAXLINE)
   character tabch, repstr (MAXARG)

   integer i, j, n, max, last
   integer getarg, ctoi

   character arg (MAXARG)

   for (i = 1; i <= MAXLINE; i = i + 1)   # clear all tab stops
      tabs (i) = NO

   tabch = TAB          # set default tab character
   repstr (1) = ' 'c   # set default replacement string
   repstr (2) = EOS

   max = 0
   last = 1
   for (i = 1; getarg (i, arg, MAXARG) ~= EOF; i = i + 1)
      if (arg (1) == '-'c) {         # -r or -t option?
         if (arg (2) == 't'c || arg (2) == 'T'c) {  # -t option
            i = i + 1
            if (getarg (i, arg, 2) == EOF)
               call usage
            tabch = arg (1)
            }
         else if (arg (2) == 'r'c || arg (2) == 'R'c) {   # -r option
            i = i + 1
            if (getarg (i, repstr, MAXARG) == EOF
            || repstr (1) == EOS)   # disallow empty string
               call usage
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
            if (n > max)   # update highest tab stop
               max = n
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



# getrc --- get replacement character from str, increment i
   character function getrc (str, i)
   character str (ARB)
   integer i

   if (str (i) == EOS)
      i = 1
   getrc = str (i)
   i = i + 1

   return
   end



# usage --- print usage diagnostic and die
   subroutine usage

    call error ("Usage: detab { -t <tab char> | -r <repl str> | <col> | +<inc> }"p)

   end
