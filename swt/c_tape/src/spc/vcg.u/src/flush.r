#  flush --- write out the current block

define (DB,#)


   subroutine flush

   include "otg_com.r.i"

   integer writef


   if (Block (1) > 1) {
DB    call print (ERROUT, "flush: writing out *,-8i words*n"s, Block (1) + 1)
      Block (2) += Block (1)

      if (writef (Block, Block (1) + 1, Fd) ~= Block (1) + 1)
         call error ("error while writing object file (flush)"p)

      Block (1) = 1
      Block (2) = lt (Block (2), 4)
      }

   return
   end
