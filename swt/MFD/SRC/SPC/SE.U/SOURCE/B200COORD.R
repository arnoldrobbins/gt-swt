# b200coord --- transmit a co-ordinate for Beehive 200 cursor addressing

   subroutine b200coord (coord)
   integer coord

   integer acc, tens, units

   acc = coord - 1
   tens = acc div 10
   units = acc - 10 * tens
   acc = units + 16 * tens
   call t1ou (acc)

   return
   end
