# lookup --- find a symbol in the symbol table, return its data

   integer function lookup (symbol, info, st)
   character symbol (ARB)
   integer info (ARB)
   pointer st

   integer Mem (1)
   common /ds$mem/ Mem

   integer i, nodesize
   integer st$lu

   pointer node, pred

   if (st$lu (symbol, node, pred, st) == NO) {
      lookup = NO
      return
      }

   nodesize = Mem (st)
   for (i = 1; i <= nodesize; i += 1)
      info (i) = Mem (node + ST_DATA - 1 + i)
   lookup = YES

   return
   end
