# enter --- place a symbol in the symbol table, updating if already present

   integer function enter (symbol, info, st)
   character symbol (ARB)
   integer info (ARB)
   pointer st

   integer Mem (1)
   common /ds$mem/ Mem

   integer i, nodesize, fortrash
   integer st$lu, length

   pointer node, pred
   pointer dsget

   nodesize = Mem (st)

   if (st$lu (symbol, node, pred, st) == NO) {
      node = dsget (1 + nodesize + length (symbol) + 1)
      Mem (node + ST_LINK) = LAMBDA
      Mem (pred + ST_LINK) = node
      call scopy (symbol, 1, Mem, node + ST_DATA + nodesize)
      }

   for (i = 1; i <= nodesize; i += 1) {
      fortrash = node + ST_DATA + i - 1
      Mem (fortrash) = info (i)
      }

   return (node + ST_DATA + nodesize)
   end
