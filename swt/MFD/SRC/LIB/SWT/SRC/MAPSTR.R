# mapstr --- map case of a K&P string

   integer function mapstr (str, case)
   character str (ARB)
   integer case

   integer i

   if (case == UPPER) {
      for (i = 1; str (i) ~= EOS; i += 1)
         if (IS_LOWER (str (i)))
            str (i) = str (i) - 'a'c + 'A'c
      }
   else {
      for (i = 1; str (i) ~= EOS; i += 1)
         if (IS_UPPER (str (i)))
            str (i) = str (i) - 'A'c + 'a'c
      }

   mapstr = i - 1    # return length of string

   return
   end
