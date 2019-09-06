# doundo --- restore last set of lines deleted

   integer function doundo (dflg, status)
   integer status, dflg

   include SE_COMMON

   integer l1, l2, oldcnt
   integer nextln
   pointer k1, k2
   pointer getind

   status = ERR

   if (dflg == NO && Line1 <= 0)
      Errcode = EORANGE
   elif (Limbo == NOMORE)
      Errcode = ENOLIMBO
   elif (Line1 > Line2)
      Errcode = EBACKWARD
   elif (Line2 > Lastln)
      Errcode = ELINE2
   else {
      status = OK
      Curln = Line2
      k1 = getind (Line2)
      k2 = getind (nextln (Line2))
      l1 = Limbo
      l2 = Prevline (l1)
      call relink (k1, l1, l2, k2)
      call relink (l2, k2, k1, l1)
      call svins (Line2, Limcnt)
      oldcnt = Limcnt
      Limcnt = 0
      Limbo = NOMORE
      Lastln = Lastln + oldcnt
      if (dflg == NO)
         call delete (Line1, Line2, status)
      Curln += oldcnt
      if (First_affected > Line1)
         First_affected = Line1
      }

   return (status)

   end
