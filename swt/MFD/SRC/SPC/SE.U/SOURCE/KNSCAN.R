# knscan --- scan for a line with given mark name

   integer function knscan (way, num)
   integer way, num

   include SE_COMMON

   pointer k
   pointer getind
   logical intrpt, brkflag

   num = Curln
   k = getind (num)
   repeat {
      call bump (num, k, way)
      if (Markname (k) == Savknm)
         return (OK)
      } until (num == Curln || intrpt (brkflag))

   knscan = ERR
   if (Errcode == EEGARB)
      Errcode = EKNOTFND

   return
   end
