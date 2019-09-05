# rmseg$ --- remove a segment directory

   subroutine rmseg$ (fd)
   integer fd

   integer entrya, entryb, fd, fd2, junk, code

   entryb = -1
   repeat {
      entrya = entryb + 1
      call sgdr$$ (KFULL, fd, entrya, entryb, code)
      if (entryb == -1 || code ~= 0)
         break
      call srch$$ (KDELE + KISEG, fd, 0, 0, 0, code)
      if (code == EDNTE) {    # non-empty nested segdir
         call srch$$ (KRDWR + KISEG + KGETU, fd, 0, fd2, junk, code)
         if (code == 0)
            call rmseg$ (fd2)
         call srch$$ (KCLOS, 0, 0, fd2, junk, code)
         call srch$$ (KDELE + KISEG, fd, 0, 0, junk, code)
         }
      }

   call sgdr$$ (KMSIZ, fd, 0, entryb, code)

   return
   end
