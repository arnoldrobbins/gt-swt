# tlit --- transliterate characters

   define (MAXSET,128)
   define (DASH,'-'c)

   character line (MAXLINE), from (MAXSET), to (MAXSET)

   integer allbut, collap, i, last_to, to_size
   integer arglin, getarg, getlin, length, makset, xindex

   procedure transliterate forward

   if (getarg (1, line, MAXLINE) == EOF)  # get <from> set
      call error ("Usage: tlit <from> [ <to> { <string> } ]"s)

   if (line (1) == NOT) {
      allbut = YES
      i = 2
      }
   else {
      allbut = NO
      i = 1
      }

   if (makset (line, i, from, MAXSET) == NO)
      call error ("<from> set too large"s)

   if (getarg (2, line, MAXLINE) == EOF)  # get <to> set
      to (1) = EOS
   elif (makset (line, 1, to, MAXSET) == NO)
      call error ("<to> set too large"s)

   call delarg (1)   # get rid of <from> and <to>
   call delarg (1)

   to_size = length (to)
   if (length (from) > to_size || allbut == YES)
      collap = YES
   else
      collap = NO

   last_to = 0    # initialize index of last <to> char output

   for (i = 1; arglin (i, line, MAXLINE) ~= EOF; i += 1) {
      transliterate
      call putlin (line, STDOUT)
      }

   if (i == 1)
      while (getlin (line, STDIN) ~= EOF) {
         transliterate
         call putlin (line, STDOUT)
         }

   stop


   # transliterate --- map characters in one line

      procedure transliterate {

      local rp, wp, i
      integer rp, wp, i

      for ({rp = 1; wp = 1}; line (rp) ~= EOS; rp += 1) {
         i = xindex (from, line (rp), allbut, to_size)
         select
            when (collap == YES && i >= to_size && to_size > 0) {
               if (last_to ~= to_size) {
                  line (wp) = to (to_size)   # translate first occurrence
                  wp += 1
                  last_to = to_size          # ...collapse thereafter
                  }
               }
            when (i > 0 && to_size > 0) {    # translate
               last_to = i
               line (wp) = to (i)
               wp += 1
               }
            when (i == 0) {                  # copy
               last_to = 0
               line (wp) = line (rp)
               wp += 1
               }
                                             # else delete
         }

      line (wp) = EOS

      }

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



# makset --- make set from  array (k)  in  set

   integer function makset (array, k, set, size)
   integer k, size
   character array (ARB), set (size)

   integer i, j
   integer addset

   i = k
   j = 1
   call filset (EOS, array, i, set, j, size)
   makset = addset (EOS, set, j, size)

   return
   end



# xindex --- invert condition returned by index

   integer function xindex (array, c, allbut, to_size)
   character array (ARB), c
   integer allbut, to_size

   integer index

   if (c == EOS)
      xindex = 0
   else if (allbut == NO)
      xindex = index (array, c)
   else if (index (array, c) > 0)
      xindex = 0
   else
      xindex = to_size + 1

   return
   end
