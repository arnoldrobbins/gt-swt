# getarg --- get an argument from the linked string space

   integer function getarg (arg_p, str, size)
   integer arg_p, size
   character str (ARB)

   integer p, i

   include SWT_COMMON

   if (arg_p < 0 || arg_p >= Arg_c) {
      str (1) = EOS
      return (EOF)
      }

   p = Arg_v (arg_p + 1)
   for (i = 1; i < size; i += 1) {
      while (Ls_ref (p) >= 300)
         p = Ls_ref (p) - 300
      if (Ls_ref (p) == EOS)
         break
      str (i) = Ls_ref (p)
      p += 1
      }
   str (i) = EOS

   return (i - 1)
   end
