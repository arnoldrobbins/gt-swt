# clrrow --- clear out all of a row except the bar

   subroutine clrrow (row)
   integer row

   include SE_COMMON

   call loadstr (EOS, row, 1, BARCOL - 1)
   call loadstr (EOS, row, BARCOL + 1, Ncols)

   return
   end
