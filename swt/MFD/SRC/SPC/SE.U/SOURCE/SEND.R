# send --- send a printable character, predict cursor position

   subroutine send (char)
   character char

   include SE_COMMON

   if (Currow == Nrows && Curcol == Ncols)
      return # Put anything in that corner and you will cause a scroll!
   call t1ou (char)
   if (Curcol == Ncols) {
      if (Term_type ~= TVT && Term_type ~= NETRON
            && Term_type ~= BANTAM && Term_type ~= FOX
            && Term_type ~= HP9845 && Term_type ~= VT100) {  # wrap around
         Curcol = 1
         Currow += 1
         }
      }
   else   # cursor not at extreme right
      Curcol += 1

   return
   end
