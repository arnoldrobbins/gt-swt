# cgpos --- position cursor on Chromatics CG

   subroutine cgpos (row, col)
   integer row, col

   include SE_COMMON

   integer i, j

   if (row == Currow + 1 && col == 1) {
      call t1ou (NEWLINE)        # Prime translates to CR followed by LF
      Curcol = 1
      Currow += 1
      }
   elif (row == 1 && col == 1) {     # home cursor
      call t1ou (FS)
      Currow = 1
      Curcol = 1
      }
   elif (row == Currow && col > Curcol && col <= Curcol + 7 )
      while (Curcol ~= col) {
         call t1ou (GS)
         Curcol += 1
         }
   elif (row == Currow & col < Curcol & col >= Curcol - 7)
      while (Curcol ~= col) {
         call t1ou (BS)
         Curcol -= 1
         }
   else {   # resort to absolute addressing
      call t1ou (SOH)
      call t1ou ("U"c)
      i = 511 - 10 * (row - 1)
      j = 6 * (col - 1)
      call cgcoord (j)
      call cgcoord (i)
      Currow = row
      Curcol = col
      }

   return
   end
