# makset --- make set from array (k) in set

   integer function makset (array, k, set, size)
   character array (ARB), set (ARB)
   integer k, size

   include SE_COMMON

   integer i, j, l
   integer addset
   character saved_sub

   if (Unix_mode == NO)
      saved_sub = '&'c
   else
      saved_sub = '%'c

   makset = ERR
   Errcode = EBADLIST

   # try to allow missing delimiter for translit command

   if (array (k) == EOS)
      return

   if (array (k+1) == saved_sub && (array (k+2) == array (k)
                                    || array (k+2) == NEWLINE)) {
      call ctoc (Tset, set, MAXPAT)
      k += 2
      if (array (k) == NEWLINE) {
         # fix it up for the rest of the routines
         array (k) = array (k-2)
         array (k+1) = NEWLINE
         array (k+2) = EOS
         Peekc = SKIP_RIGHT
         }
      }
   else {
      for (l = k; array (l) ~= EOS; l += 1)
         ;

      l -= 2      # l now points to char before NEWLINE

      if (l == k) {  # "t/.../NEWLINE"
         array (k + 1) = array (k)  # add delimiter
         array (k + 2) = NEWLINE
         array (k + 3) = EOS
         Peekc = SKIP_RIGHT
         }
      else if (array (l) == 'p'c || array (l) == 'P'c) {
         l -= 1
         if (l >= k + 1 && array (l) == array (k) &&
               (array (l - 1) ~= ESCAPE || array (l - 2) == ESCAPE))
            ;  # leave alone
         else {
            # ESCAPE <delim> p NEWLINE is the set
            # supply trailing delim
            l += 2
            array (l) = array (k)
            array (l + 1) = NEWLINE
            array (l + 2) = EOS
            Peekc = SKIP_RIGHT
            }
         }
      else if (array (l) ~= array (k)        # no delim, and no p
               || (array (l - 1) == ESCAPE   # or last char is escaped delim
                  && array (l - 2) ~= ESCAPE)) {
         # simply missing trailing delimiter
         # supply it
         l += 1
         array (l) = array (k)
         array (l + 1) = NEWLINE
         array (l + 2) = EOS
         Peekc = SKIP_RIGHT
         }
      # else
         # delim is there
         # leave well enough alon

      # end inserted code to kludge trailing delimiters

      j = 1
      i = k + 1
      call filset (array (k), array, i, set, j, size)

      if (array (i) ~= array (k))
         return

      if (addset (EOS, set, j, size) == NO)
         return

      call ctoc (set, Tset, MAXPAT) # save for later

      k = i
      }

   Errcode = EEGARB

   return (OK)

   end
