# svins --- record buffer insertion to assist in later screen repair

   subroutine svins (ln, n)
   integer ln, n

   include SE_COMMON

   integer i, lb

   if (ln < Sctop)
      Sctop += n
   else {
      lb = ln - Sctop + 1
      for (i = 1; i <= Sclen; i += 1)
         if (Scline (i) ~= -1 && Scline (i) > lb)
            Scline (i) += n
      }

   return
   end
