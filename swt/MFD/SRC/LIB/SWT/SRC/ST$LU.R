# st$lu --- symbol table lookup primitive

   integer function st$lu (symbol, node, pred, st)
   character symbol (ARB)
   pointer node, pred, st

   integer Mem (1)
   common /ds$mem/ Mem

   integer hash, i, nodesize
   integer equal

   nodesize = Mem (st)

   hash = 0
   for (i = 1; symbol (i) ~= EOS; i += 1)
      hash += symbol (i)
   hash = mod (iabs (hash), ST_HTABSIZE) + 1

   pred = st + hash
   node = Mem (pred)
   while (node ~= LAMBDA) {
      if (equal (symbol, Mem (node + ST_DATA + nodesize)) == YES) {
         st$lu = YES
         return
         }
      pred = node
      node = Mem (pred + ST_LINK)
      }

   st$lu = NO
   return
   end
