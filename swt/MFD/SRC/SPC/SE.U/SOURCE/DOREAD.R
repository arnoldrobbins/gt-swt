# doread --- read "file" after "line"

   integer function doread (line, file)
   integer line
   character file (MAXLINE)

   include SE_COMMON

   character lin (MAXLINE)
   integer count, fd, len, local_line, counter
   integer getlin, open
   pointer ptr
   pointer sp_inject, getind
   logical intrpt, brkflag

   local_line = line    # simulate a value parameter; sometimes Curln
                        # is passed as line and we modify Curln later!
   if (Savfil (1) == EOS) {
      call ctoc (file, Savfil, MAXLINE)
      call mesg (Savfil, FILE_MSG)
      }
   fd = open (file, READ)
   if (fd == ERR) {
      doread = ERR
      Errcode = ECANTREAD
      }
   else {
      First_affected = min (First_affected, local_line + 1)
      ptr = getind (local_line)
      doread = OK
      call mesg ("reading"s, REMARK_MSG)
      counter = READ_WRITE_COUNT_MODULUS
      len = getlin (lin, fd, MAXLINE)
      for (count = 0; len ~= EOF; count += 1) {
         counter -= 1
         if (counter <= 0)
            if (intrpt (brkflag)) {
               doread = ERR
               break
               }
            else
               counter = READ_WRITE_COUNT_MODULUS
         ptr = sp_inject (lin, len, ptr)
         if (ptr == NOMORE) {
            doread = ERR
            break
            }
         len = getlin (lin, fd, MAXLINE)
         }
      call close (fd)
      call saynum (count)
      Curln = local_line + count
      call svins (line, count)
      }

   return
   end
