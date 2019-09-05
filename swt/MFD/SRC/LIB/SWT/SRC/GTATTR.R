# gtattr --- get user's terminal attributes

   integer function gtattr (attr)
   integer attr

   include SWT_COMMON

   if (0 < attr && attr <= MAXTERMATTR)
      return (Term_attr (attr))
   else
      return (NO)

   end
