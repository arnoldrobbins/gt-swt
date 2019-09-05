# cpseg$ --- copy a segment directory

   subroutine cpseg$ (ifd, ofd, rc)
   integer ifd, ofd, rc

   include SWT_COMMON

   integer entrya, entryb, ifd2, ofd2, code, type

   rc = ERR

   ### Make the "to" segdir the same size as the "from" segdir
   call sgdr$$ (KGOND, ifd, entrya, entryb, Errcod)
   if (Errcod ~= 0)
      return
   call sgdr$$ (KMSIZ, ofd, entryb, entrya, Errcod)
   if (Errcod ~= 0)
      return

   entryb = -1
   repeat {
      entrya = entryb + 1

      ### Position both segdirs to the next entry
      call sgdr$$ (KFULL, ifd, entrya, entryb, code)
      if (entryb == -1) {  # none left
         Errcod = 0
         break
         }
      if (Errcod ~= 0)
         return
      call sgdr$$ (KSPOS, ofd, entryb, entrya, Errcod)
      if (Errcod ~= 0)
         return

      ### Open both entries
      call srch$$ (KREAD + KISEG + KGETU, ifd, 0, ifd2, type, Errcod)
      if (Errcod ~= 0)
         return
      call srch$$ (KRDWR + KISEG + KGETU + ls (type, 10),
                   ofd, 0, ofd2, type, Errcod)
      if (Errcod ~= 0) {
         call srch$$ (KCLOS, 0, 0, ifd2, 0, code)
         return
         }

      ### Copy the entry
      if (type >= 2)
         call cpseg$ (ifd2, ofd2, code)
      else
         call cpfil$ (ifd2, ofd2, code)
      if (code == ERR)
         return

      ### Close the entries
      call srch$$ (KCLOS, 0, 0, ifd2, 0, Errcod)
      call srch$$ (KCLOS, 0, 0, ofd2, 0, Errcod)
      }

   rc = OK

   return
   end
