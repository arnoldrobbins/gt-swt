# delete --- delete lines from through to

   integer function delete (pfrom, pto, status)
   integer pfrom, pto, status

   include SE_COMMON

   integer from, to
   integer l1
   integer prevln
   pointer k1, k2, j1, j2
   pointer getind

   from = pfrom      # value parameters; sometimes Curln is passed
   to = pto          # and we modify Curln explicitly later on!!!!

   if (from <= 0) {        # can't delete line 0
      status = ERR
      Errcode = EORANGE
      }
   else {
      if (First_affected > from)
         First_affected = from
      k1 = getind (prevln (from))
      j1 = Nextline (k1)
      j2 = getind (to)
      k2 = Nextline (j2)
      Lastln -= to - from + 1       # adjust number of Last line
      Curln = prevln (from)
      call relink (k1, k2, k1, k2)  # close chain around deleted lines

      if (Limbo ~= NOMORE) {        # discard lines currently in limbo
         l1 = Prevline (Limbo)
         Prevline (Limbo) = Free
         Free = l1
         }
      Lost_lines = Lost_lines + Limcnt

      Limbo = j1                 # put what we just deleted in limbo
      Limcnt = to - from + 1     # number of lines "deleted"
      call relink (j2, j1, j2, j1)  # close the ring
      call svdel (from, to - from + 1)
      status = OK
      Buffer_changed = YES
      }

   return (status)

   end
