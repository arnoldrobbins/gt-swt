# szseg$ --- find number of records in a segment directory

   subroutine szseg$ (size, fd)
   longint size
   integer fd

   include LIBRARY_DEFS
   include SWT_COMMON
   include PRIMOS_KEYS

   integer entry_a, entry_b, nfd, ntype
   longint temp
   longint szfil$


   size = ERR
   call sgdr$$ (KGOND, fd, entry_a, entry_b, Errcod)
   call sgdr$$ (KSPOS, fd, 0, entry_a, Errcod)
   if (Errcod ~= 0)
      return

   if (entry_b == 0)
      size = 1
   else
      size = entry_b

   ### now size the contents of the segment directory:
   entry_b = -1
   repeat {
      entry_a = entry_b + 1
      call sgdr$$ (KFULL, fd, entry_a, entry_b, Errcod)
      if (entry_b == -1 || Errcod ~= 0)
         break
      call srch$$ (KREAD + KGETU + KISEG, fd, 0, nfd, ntype, Errcod)
      if (Errcod ~= 0) {
         size = ERR
         return
         }
      select (ntype)
         when (0, 1)    # SAM or DAM file
            temp = szfil$ (nfd)
         when (2, 3)    # SAM or DAM segment directory
            call szseg$ (temp, nfd)
      if (temp == ERR) {
         size = ERR
         return
         }
      else
         size += temp
      call srch$$ (KCLOS, 0, 0, nfd, 0, Errcod)
      }

   return
   end
