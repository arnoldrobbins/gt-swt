# copy --- copy line1 through line2 after line3

   integer function copy (line3)
   integer line3

   include SE_COMMON

   integer i
   integer inject
   pointer ptr3, after3, k
   pointer getind
   logical intrpt, brkflag

   copy = ERR

   ptr3 = getind (line3)
   after3 = Nextline (ptr3)

   if (Line1 <= 0 )
      Errcode = EORANGE
   else {
      copy = OK
      Curln = line3
      k = getind (Line1)
      for (i = Line1; i <= Line2; i += 1) {
         call gtxt (k)
         if (inject (Txt) == ERR || intrpt (brkflag)) {
            copy = ERR
            break
            }
         if (k == ptr3)    # make sure we don't copy stuff that's
            k = after3     #   already been copied!
         else
            k = Nextline (k)
         }
      First_affected = min (First_affected, line3 + 1)
      }

   return
   end
