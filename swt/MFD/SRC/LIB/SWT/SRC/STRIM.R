# strim --- trim trailing blanks and tabs from a string

   integer function strim (str)
   character str (ARB)

   integer lnb, i

   lnb = 0
   for (i = 1; str (i) ~= EOS; i += 1)
      if (str (i) ~= ' 'c && str (i) ~= TAB)
         lnb = i

   str (lnb + 1) = EOS
   return (lnb)

   end
