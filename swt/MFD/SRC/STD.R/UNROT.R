# unrot --- unrotate lines rotated by kwic

   define(FOLD,:140) # Grave accent without parity bit
   define(MAXOUT,152)   # maximum width of output line

   character line (MAXLINE), arg (MAXARG)
   integer getlin, getarg, ctoi
   integer i, maxout, middle


   maxout = 65    # default is 65 characters
   if (getarg (1, arg, MAXARG) ~= EOF)
      if (arg (1) == '-'c && (arg (2) == 'w'c | arg (2) == 'W'c))
         if (getarg (2, arg, MAXARG) ~= EOF) {
            i = 1
            maxout = ctoi (arg, i)
            }
         else
            call error ("Usage: unrot [ -w <width> ]"p)
      else
         call error ("Usage: unrot [ -w <width> ]"p)

   maxout = min0 (max0 (0, maxout), MAXOUT - 2)
   middle = maxout / 2
   maxout = maxout + 2

   while (getlin (line, STDIN) ~= EOF)
      call unrotate_line (line, middle, maxout, STDOUT)

   stop
   end


# unrotate_line --- unrotate and output a single line
   subroutine unrotate_line (buf, middle, maxout, fd)
   integer middle, maxout, fd
   character buf (ARB)

   character outbuf (MAXOUT)
   integer i, j, k, l, lastwhite
   integer length, index

   for (i = 1; i < maxout; i = i + 1)   # blank line
      outbuf (i) = ' 'c
   l = middle + 1
   for (k = 1; buf (k) ~= FOLD & buf (k) ~= NEWLINE &
               buf (k) ~= EOS; k = k + 1) {
      if (buf (k) == ' 'c | buf (k) == TAB)
         lastwhite = k
      if (l >= maxout - 1) {  # no room left
         for (; k > lastwhite; k = k - 1) {  # backup to last white space
            l = l - 1
            outbuf (l) = ' 'c
            }
         while (buf (k) == ' 'c | buf (k) == TAB)
            k = k + 1   # k is now index of next token in buf
         l = maxout - 1 # indicate no room left on right side
         break
         }
      outbuf (l) = buf (k)
      l = l + 1
      }

   i = index (buf, NEWLINE) - 1
   if (i <= 0)
      i = length (buf)
   while (buf (i) == ' 'c | buf (i) == TAB)
      if (i >= k)
         i = i - 1
      else
         break
   j = middle - 2

   for ( ; i >= k & buf (i) ~= FOLD; i = i - 1) {
      if (buf (i) == ' 'c | buf (i) == TAB)
         lastwhite = i
      if (j < 1) {   # no room
         for (; i < lastwhite; i = i + 1) {  # backup to last white space
            j = j + 1
            outbuf (j) = ' 'c
            }
         while (buf (i) == ' 'c | buf (i) == TAB)
            i = i - 1   # i is now at end of a token
         j = 0    # indicate no room left on left side
         break
         }
      outbuf (j) = buf (i)
      j = j - 1
      }

   if (buf (k) == FOLD & k < i) {
      if (l < maxout - 3) {
         outbuf (l) = '.'c
         outbuf (l + 1) = '.'c
         outbuf (l + 2) = '.'c
         l = l + 3
         for (k = k + 1; k <= i; k = k + 1)
            if (l < maxout - 1) {
               outbuf (l) = buf (k)
               l = l + 1
               }
            else
               break
         }
      }
   else if (buf (i) == FOLD & i > k) {
      if (j > 2) {
         outbuf (j) = '.'c
         outbuf (j - 1) = '.'c
         outbuf (j - 2) = '.'c
         j = j - 3
         for (i = i - 1; i >= k; i = i - 1)
            if (j > 0) {
               outbuf (j) = buf (i)
               j = j - 1
               }
            else
               break
         }
      }

   outbuf (maxout - 1) = NEWLINE      # terminate line properly
   outbuf (maxout) = EOS
   call putlin (outbuf, fd)

   return
   end
