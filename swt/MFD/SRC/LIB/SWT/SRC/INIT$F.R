# init$f --- force the Fortran IOCS to understand the Subsystem

   subroutine init$f

   integer f
   integer mapfd, mapsu

   call flush$ (mapsu (STDIN))
   call flush$ (mapsu (STDOUT))

   f = mapfd (STDIN)
   if (f > 0)
      call attdev (5, 7, f, 128)
   else
      call attdev (5, 1, 0, 128)

   f = mapfd (STDOUT)
   if (f > 0)
      call attdev (6, 7, f, 128)
   else
      call attdev (6, 1, 0, 128)

   return
   end
