# dowrit --- write "from" through "to" into file

   integer function dowrit (from, to, file, aflag, fflag)
   integer from, to, aflag, fflag
   character file (MAXLINE)

   include SE_COMMON

   integer fd, line, temp, counter
   integer create, open, mapfd, equal, filtst
   pointer k
   pointer getind
   logical intrpt, brkflag

   dowrit = ERR

   if (Line1 <= 0)
      Errcode = EORANGE

   else {
      if (aflag == YES)
         fd = open (file, READWRITE)
      elif (equal (file, Savfil) == YES
            || fflag == YES || Probation == WRITECOM
            || filtst (file, NO, NO, YES, NO, NO, NO, NO) == NO)
         fd = create (file, WRITE)
      else {
         Errcode = EFEXISTS
         Probation = WRITECOM
         return
         }
      if (fd == ERR)
         Errcode = ECANTWRITE
      else {
         dowrit = OK
         call mesg ("writing"s, REMARK_MSG)
         if (aflag == YES)
            call wind (fd)
         counter = READ_WRITE_COUNT_MODULUS
         for ({k = getind (from); line = from}; line <= to;
                                    {k = Nextline (k); line += 1}) {
            counter -= 1
            if (counter <= 0)
               if (intrpt (brkflag)) {
                  dowrit = ERR
                  break
                  }
               else
                  counter = READ_WRITE_COUNT_MODULUS
            call gtxt (k)
            call putlin (Txt, fd)
            }
         temp = mapfd (fd)
         if (temp ~= ERR)  # make sure the file is on the disk
            call forcew (0, temp)
         call close (fd)
         call saynum (line - from)
         if (from == 1 && line - 1 == Lastln)
            Buffer_changed = NO
         }
      }

   return
   end
