# sbeecoord --- transmit a co-ordinate for Superbee cursor addressing

   subroutine sbeecoord (coord)
   integer coord

   integer where

   call t1ou ('0'c)
   where = coord - 1
   call t1ou ('0'c + (where div 10))
   call t1ou ('0'c + mod (where, 10))

   return
   end
