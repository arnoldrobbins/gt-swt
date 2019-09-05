# bar --- function to create a bar-type graph in the lights

integer function bar (val, low, high)
integer val, low, high

   integer indx
   integer bitarray(17)

   data bitarray / 0, :100000, :140000, :160000,
         :170000, :174000, :176000, :177000,
         :177400, :177600, :177700, :177740,
         :177760, :177770, :177774, :177776,
         :177777 /

   if (val < low) {     # val below low range
      bar = 0
      }
   else if (val > high) {     # val above high range
      bar = :177777
      }
   else {               # val is just right
      indx = 17 * val / (high - low)   # get actual display bitarray
      bar = bitarray (indx + 1)
      }
   return
   end
