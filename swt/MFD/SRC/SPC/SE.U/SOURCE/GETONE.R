# getone --- evaluate one line number expression

   integer function getone (lin, i, num, status)
   character lin (MAXLINE)
   integer i, num, status

   include SE_COMMON

   integer pnum, porm
   integer getnum

   getone = EOF   # assume we won't find anything for now
   num = 0

   if (getnum (lin, i, num, status) == OK) {    # first term
      getone = OK    # to indicate we've seen something
      repeat {             # + or - terms
         porm = EOF
         SKIPBL (lin, i)
         if (lin (i) == '-'c || lin (i) == '+'c) {
            porm = lin (i)
            i += 1
            }
         if (getnum (lin, i, pnum, status) == OK)
            if (porm == '-'c)
               num -= pnum
            else
               num += pnum
         if (status == EOF && porm ~= EOF)   # trailing + or -
            status = ERR
         } until (status ~= OK)
      }

   if (num < 0 || num > Lastln) {   # make sure number is in range
      status = ERR
      Errcode = EORANGE
      }

   if (status == ERR)
      getone = ERR
   else
      status = getone

   return
   end
