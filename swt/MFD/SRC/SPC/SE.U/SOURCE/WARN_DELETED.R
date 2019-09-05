# warn_deleted --- indicate which rows on screen are no longer true

   subroutine warn_deleted (from, to)
   integer from, to

   include SE_COMMON

   integer row

   for (row = Toprow; row <= Botrow; row += 1)
      if (Topln + row - Toprow >= from && Topln + row - Toprow <= to)
         call loadstr ("gone"s, row, 1, BARCOL - 1)

   return
   end
