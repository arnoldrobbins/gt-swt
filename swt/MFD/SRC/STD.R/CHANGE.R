# change --- change  "from"  into  "to"

   define (MAXLINE,256)    # redefine MAXLINE for here only

   character lin (MAXLINE), pat (MAXPAT), sub (MAXPAT)

   integer i
   integer arglin, getarg, getlin, getpat, getsub

   procedure change_string forward

   if (getarg (1, lin, MAXLINE) == EOF)
      call error ("Usage: change <from> [ <to> { <string> } ]"s)

   if (getpat (lin, pat) == ERR)
      call error ("illegal pattern string"s)

   if (getarg (2, lin, MAXLINE) == EOF)
      lin (1) = EOS

   if (getsub (lin, sub) == ERR)
      call error ("illegal substitution string"s)

   call delarg (1)   # delete pattern string
   call delarg (1)   # delete substitution string

   for (i = 1; arglin (i, lin, MAXLINE) ~= EOF; i += 1)
      change_string

   if (i == 1)
      while (getlin (lin, STDIN, MAXLINE) ~= EOF)
         change_string

   stop


   # change_string --- perform changes on a single line

      procedure change_string {

      local i, junk, k, lastm, m, new, tagbeg, tagend
      character new (MAXLINE)
      integer i, junk, k, lastm, m, tagbeg (10), tagend (10)
      integer amatch, addset

      k = 1
      lastm = 0
      for (i = 1; lin (i) ~= EOS; ) {
         m = amatch (lin, i, pat, tagbeg (2), tagend (2))
         if (m > 0 && lastm ~= m) {   # replace matched text
            tagbeg (1) = i
            tagend (1) = m
            call catsub (lin, tagbeg, tagend, sub, new, k, MAXLINE)
            lastm = m
            }
         if (m == 0 || m == i) {   # no match or null match
            junk = addset (lin (i), new, k, MAXLINE)
            i += 1
            }
         else            # skip matched text
            i = m
         }
      if (addset (EOS, new, k, MAXLINE) == NO) {
         k = MAXLINE
         junk = addset (EOS, new, k, MAXLINE)
         call remark ("line truncated:"p)
         call putlin (new, ERROUT)
         call putch (NEWLINE, ERROUT)
         }

      call putlin (new, STDOUT)

      }


   end



# getpat --- convert argument into pattern

   integer function getpat (arg, pat)
   integer arg (MAXARG), pat (MAXPAT)

   integer makpat

   getpat = makpat (arg, 1, EOS, pat)

   return
   end


# getsub --- get substitution pattern into sub

   integer function getsub (arg, sub)
   character arg (MAXARG), sub (MAXPAT)

   integer maksub

   getsub = maksub (arg, 1, EOS, sub)

   return
   end



# arglin --- read a line from the argument list

   integer function arglin (arg, line, size)
   integer arg, size
   character line (size)

   integer i
   integer getarg

   i = getarg (arg, line, size - 1)
   if (i == EOF)
      return (i)

   line (i + 1) = NEWLINE
   line (i + 2) = EOS

   return (i + 1)
   end
