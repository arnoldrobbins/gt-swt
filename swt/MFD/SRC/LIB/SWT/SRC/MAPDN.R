# mapdn --- fold characters to lower case

   character function mapdn (c)
   character c

   if (IS_UPPER (c))
      mapdn = c  - 'A'c + 'a'c
   else
      mapdn = c

   return
   end
