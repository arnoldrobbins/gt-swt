# hppos --- position cursor on HP terminal

   subroutine hppos (row, col)
   integer row, col

   include SE_COMMON

   integer units, tens

   if (row == Currow + 1 && col == 1 ) {
      call t1ou (NEWLINE)        # Prime translates to CR followed by LF
      Curcol = 1
      Currow += 1
      }
   elif (row == 1 && col == 1) {     # home cursor
      call t1ou (ESC)
      call t1ou ("H"c)
      Currow = 1
      Curcol = 1
      }
   elif (row == Currow && col > Curcol && col <= Curcol + 4)
      while (Curcol ~= col) {
         call t1ou (Screen_image (Curcol, Currow))
         Curcol += 1
         }
   elif (row == Currow && col < Curcol && col >= Curcol - 4)
      while (Curcol ~= col) {
         call t1ou (BS)
         Curcol -= 1
         }
   elif (2*iabs(Currow - row) + iabs(Curcol - col) <= 7) {
      while (Currow < row) {
         call t1ou (ESC)
         call t1ou ("B"c)
         Currow += 1
         }
      while (Currow > row) {
         call t1ou (ESC)
         call t1ou ("A"c)
         Currow -= 1
         }
      while (Curcol > col) {
         call t1ou (BS)
         Curcol -= 1
         }
      while (Curcol < col) {
         call t1ou (Screen_image(Curcol, Currow))
         Curcol += 1
         }
      }
    else   {  #resort to absolute addressing
      call t1ou (ESC)
      call t1ou ("&"c)
      call t1ou ("a"c)
      units = mod ((row - 1), 10)
      tens = (row - 1) / 10
      if (tens ~= 0)
         call t1ou (tens + "0"c)
      call t1ou (units + "0"c)
      call t1ou ("y"c)
      units = mod ((col - 1), 10)
      tens = (col - 1) / 10
      if (tens ~= 0)
         call t1ou (tens + "0"c)
      call t1ou (units + "0"c)
      call t1ou ("C"c)
      Currow = row
      Curcol = col
      }

   return
   end
