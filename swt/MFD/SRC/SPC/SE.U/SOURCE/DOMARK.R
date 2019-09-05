# domark --- name lines line1 through line2 kname

   integer function domark (kname)
   character kname

   include SE_COMMON

   integer line
   pointer k
   pointer getind
   logical intrpt, brkflag

   if (Line1 <= 0) {
      Errcode = EORANGE
      domark = ERR
      }
   else {
      for ({k = getind (Line1); line = Line1}; line <= Line2;
                                    {k = Nextline (k); line += 1}) {
         if (intrpt (brkflag))
            return (ERR)
         Markname (k) = kname
         }
      domark = OK
      }

   return
   end
