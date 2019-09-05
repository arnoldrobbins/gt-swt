# gttype --- get the string for the user's terminal type

   integer function gttype (str)
   character str (ARB)

   integer ttyp$f, ttyp$r, ttyp$q

   if ((ttyp$r (str) == NO || str (1) == EOS) && ttyp$f (str) == NO)
      return (ttyp$q (str, NO))

   return (YES)
   end
