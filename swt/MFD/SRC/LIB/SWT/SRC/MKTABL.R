# mktabl --- make a new (empty) symbol table

   pointer function mktabl (nodesize)
   integer nodesize

   integer Mem (1)
   common /ds$mem/ Mem

   pointer st
   pointer dsget

   integer i

   st = dsget (ST_HTABSIZE + 1)     # +1 for record of nodesize
   Mem (st) = nodesize
   mktabl = st
   do i = 1, ST_HTABSIZE; {
      st += 1
      Mem (st) = LAMBDA             # null link
      }

   return
   end
