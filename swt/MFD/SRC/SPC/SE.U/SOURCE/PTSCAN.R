# ptscan --- scan for next occurrence of pattern

   integer function ptscan (way, num)
   integer way, num

   include SE_COMMON

   integer match
   pointer k
   pointer getind
   logical intrpt, brkflag

   num = Curln
   k = getind (num)
   repeat {
      call bump (num, k, way)
      call gtxt (k)
      if (match (Txt, Pat) == YES)
         return (OK)
      } until (num == Curln || intrpt (brkflag))

   if (Errcode == EEGARB)
      Errcode = EPNOTFND

   return (ERR)

   end
