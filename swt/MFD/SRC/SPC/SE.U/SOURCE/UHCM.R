# uhcm --- universal horizontal cursor motion

   subroutine uhcm (col)
   integer col

   include SE_COMMON

   while (Curcol < col) {
      call t1ou (Screen_image (Curcol, Currow))
      Curcol += 1
      }

   while (Curcol > col) {
      call t1ou (BS)              # backspace
      Curcol -= 1
      }

   return
   end
