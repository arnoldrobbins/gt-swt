# join --- join a group of lines into a single line

   integer function join (sub)
   character sub (ARB)

   include SE_COMMON

   character new (MAXLINE)
   integer l, line, sublen
   integer inject, delete, length
   pointer k
   pointer getind
   logical intrpt, brkflag

   join = ERR
   if (Line1 <= 0) {
      Errcode = EORANGE
      return
      }

   sublen = length (sub) + 1     # length of separator, including EOS
   line = Line1
   k = getind (line)
   call gtxt (k)
   call move$ (Txt, new, Lineleng (k))    # move in first chunk
   l = Lineleng (k)

   for (line += 1; line <= Line2; line += 1) {
      if (intrpt (brkflag))
         return
      if (new (l - 1) == NEWLINE)   # zap the newline
         l -= 1
      k = Nextline (k)              # get the next line
      call gtxt (k)
      if (l + sublen - 1 + Lineleng (k) - 1 > MAXLINE) {    # won't fit
         Errcode = E2LONG
         return
         }
      call move$ (sub, new (l), sublen)   # insert separator string
      l += sublen - 1
      call move$ (Txt, new (l), Lineleng (k))   # move next line
      l += Lineleng (k) - 1
      }

   Curln = Line2           # all this will replace line1 thru line2
   join = inject (new)     # inject the new line
   if (join == OK)
      join = delete (Line1, Line2, join)  # delete old Lines
   Curln += 1

   if (First_affected > Curln)
      First_affected = Curln

   return
   end
