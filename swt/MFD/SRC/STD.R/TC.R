# tc --- text counter

#     Usage:  tc [-{c | l | p | w | v}] [ <pathname> ]
#        for characters, words, lines, pages respectively
#        'v' option makes output verbose


define (PAGELEN, 66)
define (ORD(ch),'ch'c-'a'c+1)

   integer i, l, fd, inword, opts (26)
   integer getlin, getarg, chkarg, open

   long_int chars, words, lines

   character buf (MAXLINE)


   do i = 1, 26
      opts (i) = -1
   opts (ORD (c)) = 0
   opts (ORD (l)) = 0
   opts (ORD (p)) = 0
   opts (ORD (w)) = 0
   opts (ORD (v)) = 0
   i = 1
   select (chkarg (i, opts))
      when (ERR)
         call error ("Usage: tc [-{c | l | p | w | v}] [<pathname>]"s)
      when (0) {  # use default settings
         opts (ORD (c)) = 1
         opts (ORD (l)) = 1
         opts (ORD (p)) = 1
         opts (ORD (w)) = 1
         opts (ORD (v)) = 1
         }

   if (getarg (i, buf, MAXLINE) == EOF)
      fd = STDIN
   else {
      fd = open (buf, READ)
      if (fd == ERR)
         call cant (buf)
      }

   chars = 0
   words = 0
   inword = NO
   lines = 0

   for (l = getlin (buf, fd); l ~= EOF; l = getlin (buf, fd)) {
      chars += l
      if (buf (l) == NEWLINE)
         lines += 1
      for (i = 1; i <= l; i += 1)
         if (buf (i) == ' 'c || buf (i) == NEWLINE || buf (i) == TAB)
            inword = NO
         else if (inword == NO) {
            inword = YES
            words += 1
            }
      }

   call close (fd)

   if (opts (ORD (c)) > 0) {
      call print (STDOUT, "*l"s, chars)
      if (opts (ORD (v)) > 0)
         call print (STDOUT, " characters*n"s)
      else
         call putch (NEWLINE, STDOUT)
      }

   if (opts (ORD (w)) > 0) {
      call print (STDOUT, "*l"s, words)
      if (opts (ORD (v)) > 0)
         call print (STDOUT, " words*n"s)
      else
         call putch (NEWLINE, STDOUT)
      }

   if (opts (ORD (l)) > 0) {
      call print (STDOUT, "*l"s, lines)
      if (opts (ORD (v)) > 0)
         call print (STDOUT, " lines*n"s)
      else
         call putch (NEWLINE, STDOUT)
      }

   if (opts (ORD (p)) > 0) {
      call print (STDOUT, "*l"s, (lines + PAGELEN - 1) / PAGELEN)
      if (opts (ORD (v)) > 0)
         call print (STDOUT, " pages*n"s)
      else
         call putch (NEWLINE, STDOUT)
      }

   stop
   end
