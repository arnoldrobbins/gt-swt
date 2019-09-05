# delete --- remove a symbol from the symbol table

   subroutine delete (symbol, st)
   character symbol (ARB)
   pointer st

   integer Mem (1)
   common /ds$mem/ Mem

   integer st$lu

   pointer node, pred

   if (st$lu (symbol, node, pred, st) == YES) {
      Mem (pred + ST_LINK) = Mem (node + ST_LINK)
      call dsfree (node)
      }

   return
   end
