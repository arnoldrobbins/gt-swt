# cck1 --- first phase of C program checker

   define (FLAG, '#'c)
   define (MAXBUF, 4096)
   define (MAXLEVELS, 100)

   integer sbp (MAXLEVELS), bp, lvl, i
   integer getlin
   character buf (MAXBUF)

   bp = 1
   lvl = 0
   while (getlin (buf (bp), STDIN, MAXBUF - bp) ~= EOF)
      for (i = bp; buf (i) ~= EOS; i += 1)
         if (buf (i) == FLAG) {
            lvl += 1
            if (lvl > MAXLEVELS)
               call error ("Too many nesting levels"p)
            sbp (lvl) = i
            }
         else if (buf (i) == NEWLINE) {
            call putlin (buf (sbp (lvl)), STDOUT)
            bp = sbp (lvl)
            lvl -= 1
            if (lvl < 0)
               call error ("Nesting stack underflow"p)
            }

   stop
   end
