# makscr --- create a new scratch file

   subroutine makscr (fd, str)
   integer fd
   character str (ARB)

   integer f, i, name (MAXLINE), l
   integer scopy, create, mapfd

   l = scopy ("=temp=/se=pid="s, 1, name, 1)

   for (i = '0'c; i <= '9'c; i += 1) {
      name (l + 1) = i
      name (l + 2) = EOS
      f = create (name, READWRITE + KNDAM)
      if (f ~= ERR) {
         fd = mapfd (f)
         call scopy (name, 1, str, 1)
         return
         }
      }

   call error ("can't create scratch file"p)

   end
