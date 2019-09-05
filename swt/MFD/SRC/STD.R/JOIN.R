# join --- replace newlines with string

   character line (MAXLINE), outbuf (MAXLINE),
               delim (MAXARG), arg (MAXARG)

   integer i, j, k, l, nlines
   integer getlin, getarg, ctoi


   nlines = 0
   delim (1) = ' 'c
   delim (2) = EOS

   for (i = 1; getarg (i, arg, MAXARG) ~= EOF; i = i + 1) {
      if (arg (1) == '-'c)
         if (arg (2) == 'l'c || arg (2) == 'L'c) {
            j = 3
            nlines = ctoi (arg, j)
            if (arg (j) == EOS && j > 3)
               next
            else
               nlines = 0
            }

      call scopy (arg, 1, delim, 1)
      }

   j = 1
   k = 0

   repeat {
      l = getlin (line, STDIN)
      if (l == EOF)
         break
      for (i = 1; i <= l; i = i + 1) {
         if (line (i) == NEWLINE) {
            outbuf (j) = EOS
            call putlin (outbuf, STDOUT)
            k = k + 1
            if (k >= nlines) {
               k = 0
               if (nlines ~= 0)
                  call putch (NEWLINE, STDOUT)
               else
                  call putlin (delim, STDOUT)
               }
            else
               call putlin (delim, STDOUT)
            j = 1
            }
         else {
            outbuf (j) = line (i)
            j = j + 1
            }
         }
      }
   if (j > 1) {
      outbuf (j) = EOS
      call putlin (outbuf, STDOUT)
      }
   call putch (NEWLINE, STDOUT)

   stop
   end
