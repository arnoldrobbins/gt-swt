# relink --- rewrite two half links

   subroutine relink (a, x, y, b)
   pointer a, b, x, y

   include SE_COMMON

   Prevline (x) = a
   Nextline (y) = b

   return
   end
