# dsfree --- return a block of storage to the available space list

   subroutine dsfree (block)
   pointer block

   integer Mem (1)
   common /ds$mem/ Mem

   pointer p0, p, q
   integer n
   character con (10)

   p0 = block - DS_OHEAD
   n = Mem (p0 + DS_SIZE)
   q = DS_AVAIL

   repeat {
      p = Mem (q + DS_LINK)
      if (p == LAMBDA || p > p0)
         break
      q = p
      }

   if (q + Mem (q + DS_SIZE) > p0) {
      call remark ("in dsfree:  attempt to free unallocated block.")
      call remark ("type 'c' to continue.")
      call getlin (con, ERRIN, 10)
      if (con (1) ~= 'c'c && con (1) ~= 'C'c)
         stop
      return      # do not attempt to free the block
      }

   if (p0 + n == p & p ~= LAMBDA) {
      n = n + Mem (p + DS_SIZE)
      Mem (p0 + DS_LINK) = Mem (p + DS_LINK)
      }
   else
      Mem (p0 + DS_LINK) = p

   if (q + Mem (q + DS_SIZE) == p0) {
      Mem (q + DS_SIZE) = Mem (q + DS_SIZE) + n
      Mem (q + DS_LINK) = Mem (p0 + DS_LINK)
      }
   else {
      Mem (q + DS_LINK) = p0
      Mem (p0 + DS_SIZE) = n
      }

   return
   end
