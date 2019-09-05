# vtmsg --- display a message in the status line (if any)

   subroutine vtmsg (s, t)
   character s (ARB)
   integer t

   include SWT_COMMON

   integer col, need, c, first, last
   integer length
   character ch

   if (Msg_row <= 0)          # Are we maintaining a status line?
      return

   for (first = 1; first <= Maxcol; first += 1)
      if (Msg_owner (first) == t)
         break

   for (last = first; last <= Maxcol; last += 1) {
      if (Msg_owner (last) ~= t)
         break
      Msg_owner (last) = NOMSG
      }

   need = length (s) + 2               # for two blanks

   if (need > 2) {                     # not empty message
      if (need <= last - first)        # fits where was last time
         col = first                   # keep it there
      else                             # find another place for it
         for (col = 1; col < Maxcol; col = c) {
            while (col < Maxcol && Msg_owner (col) ~= NOMSG)
               col += 1
            for (c = col; Msg_owner (c) == NOMSG; c += 1)
               if (c >= Maxcol)
                  break
            if (c - col >= need)
               break
            }

      if (col + need > Maxcol) {        # have to garbage collect
         col = 1
         for (c = 1; c <= Maxcol; c += 1)
            if (Msg_owner (c) ~= NOMSG) {
               vt$upk (ch, Newscr, Msg_row, c)
               call vt$put (ch, Msg_row, col, 1)
               Msg_owner (col) = Msg_owner (c)
               col += 1
               }
         for (c = col; c <= Maxcol; c += 1)
            Msg_owner (c) = NOMSG
         }

      call vt$put (' 'c, Msg_row, col, 1)
      call vt$put (s, Msg_row, col + 1, need - 2)
      call vt$put (' 'c, Msg_row, col + need - 1, 1)

      for (c = col; c <= min0 (col + need - 1, Maxcol); c += 1)
         Msg_owner (c) = t
      }

   do col = 1, Maxcol
      if (Msg_owner (col) == NOMSG)
         call vt$put ('.'c, Msg_row, col, 1)

   return
   end
