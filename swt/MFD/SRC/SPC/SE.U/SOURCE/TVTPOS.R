# tvtpos --- position cursor on TV Typewriter

   subroutine tvtpos (row, col)
   integer row, col

   include SE_COMMON

   integer horirel, horiabs, vertrel, vertabs

   horirel = iabs (col - Curcol)    # cost of horizontal motion from here
   horiabs = col - 1                # cost of horizontal motion from home
   if (row <= Currow)               # cost of vertical motion from here
      vertrel = Currow - row
   else
      vertrel = Nrows - (row - Currow)
   vertabs = Nrows - (row - 1)      # cost of vertical motion from home

   if (1 + horiabs + vertabs <= horirel + vertrel) {  # "1" is cost to home
      call t1ou (FF)                # home cursor
      Currow = 1
      Curcol = 1
      }

   while (Currow ~= row) {   # wrap around from bottom
      call t1ou (VT)
      Currow -= 1
      if (Currow < 1)
         Currow = Nrows
      }

   if (Curcol > col)
      for (; Curcol ~= col; Curcol -= 1)
         call t1ou (BS)             # cursor left
   else
      for (; Curcol ~= col; Curcol += 1)
         call t1ou (HT)             # cursor right

   return
   end
