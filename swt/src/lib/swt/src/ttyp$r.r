# ttyp$r --- get the terminal type from the common area

   integer function ttyp$r (ttype)
   character ttype (ARB)

   include SWT_COMMON

   integer chkstr

   if (chkstr (Termtype, MAXTERMTYPE) == NO) {
      ttype (1) = EOS
      return (NO)
      }

   call ctoc (Termtype, ttype, MAXTERMTYPE)

   return (YES)
   end
