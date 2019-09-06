# doprnt --- set curln, locate window (modified for screen editor)

   integer function doprnt (from, to)
   integer from, to

   include SE_COMMON

   integer local_to, local_from

   local_to = to        # simulate value parameters
   local_from = from

   if (local_from <= 0) {
      doprnt = ERR
      Errcode = EORANGE
      }
   else {
      call adjust_window (local_from, local_to)
      Curln = local_to
      doprnt = OK
      }

   return
   end
