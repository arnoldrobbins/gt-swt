# cn --- change file names

   include PRIMOS_ERRD
   include PRIMOS_KEYS

   define (NAMESIZE, 33)

   character path (MAXARG), newnam (NAMESIZE), nn (NAMESIZE)
   integer old (16), new (16), i, j, k, rc, pwd (3)
   integer getarg, getto

   for (i = 1; getarg (i, path, MAXARG) ~= EOF; i = i + 2) {
      if (getarg (i + 1, newnam, NAMESIZE) == EOF) {
         call putlin (path, ERROUT)
         call error (": missing name.")
         }
      call follow (EOS, 0)
      if (getto (path, old, pwd, 0) == ERR) {
         call putlin (path, ERROUT)
         call error (": bad pathname.")
         }
      for ({j = 1; k = 1}; newnam (j) ~= EOS; {j += 1; k += 1}) {
         if (newnam (j) == ESCAPE && newnam (j + 1) ~= EOS)
            j += 1
         else if (newnam (j) == '/'c) {
            call putlin (newnam, ERROUT)
            call error (": cannot move file to new directory.")
            }
         nn (k) = newnam (j)
         }
      nn (k) = EOS
      for (j = 1; j <= 16; j = j + 1)
         new (j) = '  '
      j = 1
      call ctop (nn, j, new, 16)
      call cnam$$ (old, 32, new, 32, rc)
      if (rc == EEXST)  # already exists
         call print (ERROUT, "*s: already exists*n.", newnam)
      else if (rc == EFNTF)   # not found
         call print (ERROUT, "*s: not found*n.", path)
      else
         call errpr$ (KIRTN, rc, 0, 0, 0, 0)
      }
   if (i == 1)         # No arguments specified
      call error ("Usage: cn old new {old new}.")

   stop
   end
