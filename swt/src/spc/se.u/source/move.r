# move --- move line1 through line2 after line3

   integer function move (line3)
   integer line3

   include SE_COMMON

   integer prevln
   pointer k0, k1, k2, k3, k4, k5
   pointer getind

   move = ERR
   if (Line1 <= 0)
      Errcode = EORANGE
   elif (Line1 <= line3 && line3 <= Line2)
      Errcode = EINSIDEOUT
   else {
      k0 = getind (prevln (Line1))
      k1 = Nextline (k0)
      k2 = getind (Line2)
      k3 = Nextline (k2)
      call relink (k0, k3, k0, k3)
      if (line3 > Line1) {
         Curln = line3
         line3 -= Line2 - Line1 + 1
         }
      else
         Curln = line3 + (Line2 - Line1 + 1)
      k4 = getind (line3)
      k5 = Nextline (k4)
      call relink (k4, k1, k2, k5)
      call relink (k2, k5, k4, k1)
      move = OK
      Buffer_changed = YES
      First_affected = min (First_affected, Line1, line3)
      }

   return
   end
