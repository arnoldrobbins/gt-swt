# anppos --- position cursor on Allen & Paul model 1

   subroutine anppos (row, col)
   integer row, col

   include SE_COMMON

   if (row == Currow) {                # if close,
      select                           #     just sneak right or left
         when (col == Curcol + 1)
            call t1ou (HT)
         when (col == Curcol + 2) {
            call t1ou (HT)
            call t1ou (HT)
            }
         when (col == Curcol - 1)
            call t1ou (BS)
         when (col == Curcol - 2) {
            call t1ou (BS)
            call t1ou (BS)
            }
      else {                           # otherwise position in this row
         call t1ou (ESC)
         call t1ou ('C'c)
         call t1ou (col - 1 + ' 'c)
         }
      }

   else if (col == Curcol) {           # if close,
      select                           #     just sneak up or down
         when (row == Currow + 1)
            call t1ou (LF)
         when (row == Currow + 2) {
            call t1ou (LF)
            call t1ou (LF)
            }
         when (row == Currow - 1)
            call t1ou (VT)
         when (row == Currow - 2) {
            call t1ou (VT)
            call t1ou (VT)
            }
      else {                           # otherwise position in this column
         call t1ou (ESC)
         call t1ou ('R'c)
         call t1ou (row - 1 + ' 'c)
         }
      }

   else {                              # resort to absolute positioning
      call t1ou (ESC)                  #     only if absolutely necessary
      call t1ou ('P'c)
      call t1ou (row - 1 + ' 'c)
      call t1ou (col - 1 + ' 'c)
      }

   Currow = row
   Curcol = col

   return
   end
