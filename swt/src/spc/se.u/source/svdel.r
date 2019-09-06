# svdel --- record a buffer deletion to assist later in screen repair

   subroutine svdel (ln, n)
   integer ln, n

   include SE_COMMON

   integer i, lb, ub

   if (ln + n <= Sctop)
      Sctop -= n
   else if (ln < Sctop) {
      ub = ln + n - Sctop
      for (i = 1; i <= Sclen; i += 1)
         if (Scline (i) == -1)
            ;
         else if (Scline (i) <= ub)
            Scline (i) = -1
         else
            Scline (i) -= ub
      Sctop = ln
      }
   else {
      lb = ln - Sctop
      ub = ln + n - Sctop
      for (i = 1; i <= Sclen; i += 1)
         if (Scline (i) == -1 || Scline (i) <= lb)
            ;
         else if (Scline (i) <= ub)
            Scline (i) = -1
         else
            Scline (i) -= n
      }

   return
   end
