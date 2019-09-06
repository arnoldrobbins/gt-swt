# t$trac --- trace subroutine for Ratfor programs

   subroutine t$trac (mode, name)
   integer mode
   character name

   integer level, i

   data level / 0 /

   select (mode)
      when (1) {
         for (i = 1; i <= level & level <= 40; i += 1) {
            call putch ('|'c, ERROUT)
            call putch (' 'c, ERROUT)
            call putch (' 'c, ERROUT)
            }
         call print (ERROUT, "*p {*n"p, name)
         level += 1
         }
      when (2) {
         level -= 1
         for (i = 1; i <= level & level <= 40; i += 1) {
            call putch ('|'c, ERROUT)
            call putch (' 'c, ERROUT)
            call putch (' 'c, ERROUT)
            }
         call print (ERROUT, "..}*n"p)
         }
      when (3) {
         level = 0
         }

   return
   end
