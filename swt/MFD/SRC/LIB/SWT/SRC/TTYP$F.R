# ttyp$f --- obtain the terminal type from the 'terms' file

   integer function ttyp$f (ttype)
   character ttype (ARB)

   integer fd, pid, i, j
   integer open, ctoi, getlin, ttyp$v
   character str (MAXLINE)

   fd = open ("=termlist="s, READ)
   if (fd == ERR) {
      ttype (1) = EOS
      return (NO)
      }

   call date (SYS_PID, pid)        # get the user's numeric process id

   ttype (1) = EOS
   while (getlin (str, fd) ~= EOF) {
      i = 1
      j = ctoi (str (6), i)
      if (j == pid) {
         i = 11
         SKIPBL (str, i)
         for (j = 1; i <= 16 && str (i) ~= EOS && str (i) ~= ' 'c;
                        {i += 1; j += 1})
            ttype (j) = str (i)
         ttype (j) = EOS
         break
         }
      }

   call close (fd)

   if (ttype (1) == EOS)
      return (NO)

   return (ttyp$v (ttype))
   end
