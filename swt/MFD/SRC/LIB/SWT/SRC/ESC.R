# esc --- map  array (i)  into escaped character if appropriate

   character function esc (array, i)
   character array (ARB)
   integer i

   if (array (i) ~= ESCAPE)
      esc = array (i)
   else if (array (i + 1) == EOS)   # @ not special at end
      esc = ESCAPE
   else {
      i += 1
      if (array (i) == 'n'c)
         esc = NEWLINE
      else if (array (i) == 't'c)
         esc = TAB
      else
         esc = array (i)
      }

   return
   end
