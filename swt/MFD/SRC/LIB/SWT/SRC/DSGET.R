# dsget --- get pointer to block of at least w available words

   pointer function dsget (w)
   integer w

   integer Mem (1)
   common /ds$mem/ Mem

   pointer p, q, l
   integer n, k
   character c (10)

   n = w + DS_OHEAD
   q = DS_AVAIL

   repeat {
      p = Mem (q + DS_LINK)
      if (p == LAMBDA) {
         call remark ("in dsget: out of storage space.")
         call remark ("type 'c' or 'i' for char or integer dump.")
         call getlin (c, ERRIN, 10)
         select (c (1))
         when ('c'c, 'C'c)
            call dsdump (LETTER)
         when ('i'c, 'I'c)
            call dsdump (DIGIT)
         call error ("program terminated.")
         }
      if (Mem (p + DS_SIZE) >= n)
         break
      q = p
      }

   k = Mem (p + DS_SIZE) - n
   if (k >= DS_CLOSE) {
      Mem (p + DS_SIZE) = k
      l = p + k
      Mem (l + DS_SIZE) = n
      }
   else {
      Mem (q + DS_LINK) = Mem (p + DS_LINK)
      l = p
      }

   return (l + DS_OHEAD)

   end
