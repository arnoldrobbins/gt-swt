# rmfil$ --- remove a file, return status

   integer function rmfil$ (name)
   integer name (MAXPACKEDFNAME)

   include SWT_COMMON

   integer fd, code, type
   character vname (MAXVARYFNAME)

   call srch$$ (KCLOS, name, 32, 0, 0, code)
   call srch$$ (KDELE, name, 32, 0, 0, Errcod)
   if (Errcod == EDNTE) {  # non-empty directory, see if segdir
      call srch$$ (KRDWR + KGETU, name, 32, fd, type, code)
      if (code == 0) {
         if (type == 2 || type == 3)
            call rmseg$ (fd)
         call srch$$ (KCLOS, 0, 0, fd, 0, code)
         call srch$$ (KDELE, name, 32, 0, 0, Errcod)
         }
      }
   elif (Errcod == EIACL) {   # access category, deletes differently
      call ptov (name, ' 'c, vname, MAXVARYFNAME)
      call cat$dl (vname, Errcod)
      }
   rmfil$ = ERR
   if (Errcod == 0)
      rmfil$ = OK

   return
   end
