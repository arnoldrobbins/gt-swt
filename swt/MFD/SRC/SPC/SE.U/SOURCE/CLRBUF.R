# clrbuf --- purge scratch file

   subroutine clrbuf

   include SE_COMMON

   if (Lastln > 1)
      call svdel (1, Lastln)
   call closef (Scr)
   call remove (Scrname)

   return
   end
