# mapup --- fold characters to upper case

   character function mapup (c)
   character c

   if (IS_LOWER (c))
      mapup = c - 'a'c + 'A'c
   else
      mapup = c

   return
   end
