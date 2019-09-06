# strcmp --- compare two strings and return 1 2 or 3 for < = or >

   integer function strcmp (str1, str2)
   character str1 (ARB), str2 (ARB)

   integer i

   for (i = 1; str1 (i) == str2 (i); i += 1)
      if (str1 (i) == EOS)
         return (2)

   select
      when (str1 (i) == EOS || str1 (i) < str2 (i))
         return (1)
      when (str2 (i) == EOS || str1 (i) > str2 (i))
         return (3)

   return (2)              # should never happen
   end
