# mesg --- display a message in the status row

   subroutine mesg (s, t)
   character s (ARB)
   integer t

   include SE_COMMON

   integer col, need, c, first, last
   integer length

   for (first = 1; first <= Ncols; first += 1)
      if (Msgalloc (first) == t)
         break

   for (last = first; last <= Ncols; last += 1) {
      if (Msgalloc (last) ~= t)
         break
      Msgalloc (last) = NOMSG
      }

   for ( ; first > 1 && Msgalloc (first - 1) == NOMSG; first -= 1)
      ;

   need = length (s) + 2               # for two blanks

   if (need > 2) {                     # not empty message
      if (need <= last - first)        # fits where was last time
         col = first                   # keep it there
      else                             # find another place for it
         for (col = 1; col < Ncols; col = c) {
            while (col < Ncols && Msgalloc (col) ~= NOMSG)
               col += 1
            for (c = col; Msgalloc (c) == NOMSG; c += 1)
               if (c >= Ncols)
                  break
            if (c - col >= need)
               break
            }

      if (col + need > Ncols) {        # have to garbage collect
         col = 1
         for (c = 1; c <= Ncols; c += 1)
            if (Msgalloc (c) ~= NOMSG) {
               call load (Screen_image (c, Nrows), Nrows, col)
               Msgalloc (col) = Msgalloc (c)
               col += 1
               }
         for (c = col; c <= Ncols; c += 1)
            Msgalloc (c) = NOMSG
         }

      call load (' 'c, Nrows, col)
      call loadstr (s, Nrows, col + 1, 0)
      call load (' 'c, Nrows, col + need - 1)
      for (c = col; c <= min (col + need - 1, Ncols); c += 1)
         Msgalloc (c) = t
      }

   do col = 1, Ncols
      if (Msgalloc (col) == NOMSG)
         call load ('.'c, Nrows, col)

   return
   end
