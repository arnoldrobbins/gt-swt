# uniquely_name --- mark-name line; make sure no other line named same

   subroutine uniquely_name (kname, status)
   character kname
   integer status

   include SE_COMMON

   integer k, line

   call defalt (Curln, Curln)

   if (Line1 <= 0) {
      status = ERR
      Errcode = EORANGE
      return
      }

   status = OK
   line = 0
   k = Line0

   repeat {
      line += 1
      k = Nextline (k)
      if (line == Line2)
         Markname (k) = kname
      elif (Markname (k) == kname)
         Markname (k) = DEFAULTNAME
      } until (line >= Lastln)

   return
   end
