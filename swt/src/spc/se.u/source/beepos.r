# beepos --- position cursor on Beehive terminal

   subroutine beepos (row, col)
   integer row, col

   include SE_COMMON

   if (row == Currow + 1 && col == 1 && Term_type ~= SBEE) {
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
   else {   # resort to absolute addressing
      call t1ou (ESC)
      call t1ou ("F"c)
      if (Term_type == B200 || Term_type == SOL) {
         call b200coord (row)
         call b200coord (col)
         }
      elif (Term_type == B150 || Term_type == MICROB
               || Term_type == PT45) {
         call t1ou (row + " "c - 1)
         call t1ou (col + " "c - 1)
         }
      else { # is Superbee
         call sbeecoord (col)
         call sbeecoord (row)
         }
      Currow = row
      Curcol = col
      }

   return
   end
