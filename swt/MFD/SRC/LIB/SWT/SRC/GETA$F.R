# geta$f --- get an argument for a Fortran program

   integer function geta$f (ap, str, len)
   integer ap, len
   integer str (ARB)

   integer i
   integer getarg, ctop
   character arg (MAXARG)

   for (i = (len + 1) / 2; i > 0; i -= 1)
      str (i) = "  "

   if (getarg (ap, arg, MAXARG) == EOF)
      return (-1)

   i = 1
   return (ctop (arg, i, str, len / 2))
   end
