# cprow --- copy from one row to another for append

   subroutine cprow (from, to)
   integer from, to

   include SE_COMMON

   integer col

   for (col = 1; col <= Ncols; col += 1)
      call load (Screen_image (col, from), to, col)

   return
   end
