# c$incr --- increment count for a given statement

   subroutine c$incr (stmt)
   integer stmt

   integer limit
   longint count (1)
   common /c$stc/ limit, count

   count (stmt) += 1

   return
   end
