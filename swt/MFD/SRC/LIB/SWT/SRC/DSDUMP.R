# dsdump --- produce semi-readable dump of storage

   subroutine dsdump (form)
   character form

   integer Mem (1)
   common /ds$mem/ Mem

   pointer p, t, q

   t = DS_AVAIL

   call print (ERROUT, "** DYNAMIC STORAGE DUMP ***n.")
   call print (ERROUT, "*5i   *i words in use*n.", 1, DS_OHEAD + 1)

   p = Mem (t + DS_LINK)
   while (p ~= LAMBDA) {
      call print (ERROUT, "*5i   *i words available*n.",
         p, Mem (p + DS_SIZE))
      q = p + Mem (p + DS_SIZE)
      while (q ~= Mem (p + DS_LINK) && q < Mem (DS_MEMEND))
         call dsdbiu (q, form)
      p = Mem (p + DS_LINK)
      }

   call print (ERROUT, "** END DUMP ***n.")

   return
   end
