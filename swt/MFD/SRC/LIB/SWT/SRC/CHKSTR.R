# chkstr --- check if an EOS-terminated string is valid (all printable)

   integer function chkstr (str, len)
   character str (ARB)
   integer len

   integer i

   for (i = 1; i <= len && str (i) ~= EOS; i += 1)
      if (' 'c > str (i) || str (i) >= DEL)
         return (NO)

   if (i > len)
      return (NO)

   return (YES)

   end
