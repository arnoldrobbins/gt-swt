# vtmove --- position cursor to row, col with least cost

   subroutine vtmove (row, col)
   integer row, col

   include SWT_COMMON

   integer i
   character chr

DEBUG call print (ERROUT, "In vtmove (*i, *i)*n"s, row, col)

   call vt$pos(row, col, Currow, Curcol)
   Currow = row
   Curcol = col

   return
   end
