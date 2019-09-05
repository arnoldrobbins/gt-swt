include NET_DEFS

   define(NAMESIZE,3)
   define(TERMINATE,3)

   define(BUFFSIZE,137)

   define(SUCCEEDED,7)
   define(FAILED,8)

   external cleanup
   integer getarg, strim, ctop

   character line(MAXLINE)
   integer vcstat(2), buff(BUFFSIZE)

   integer vcid, size, i, j, k

   i = 1

   buff(i) = TERMINATE
   i += 1

   if (getarg(1, line, MAXARG) ~= EOF)
   {
      call mapstr(line, UPPER)

      for (j = strim(line); j < 2 * NAMESIZE; j += 1)
         line(j + 1) = " "c
      line(2 * NAMESIZE + 1) = EOS

      j = 1
      size = i + (ctop(line, j, buff(i), NAMESIZE) + 1) / 2 - 1
   }
   else
   {
      do j = 1, NAMESIZE
      {
         buff(i) = 0
         i += 1
      }

      size = i - 1
   }

   call ring$c(vcid, vcstat, line)

   if (line(1) == EOS)
      call mkon$f("CLEANUP$", 8, cleanup)
   else
      call error(line)

   call ring$t(vcid, vcstat, buff, size, line)

   if (line(1) == EOS)
   {
      i = 2
      j = size - NAMESIZE - 1

      while (i < j)
      {
         select (buff(i + NAMESIZE))
            when (SUCCEEDED)
               call print(STDOUT, "Ring has been terminated on system *,#h*n"s,
                  2 * NAMESIZE, buff(i))

            when (FAILED)
               call print(STDOUT, "Termination request failed on system *,#h*n"s,
                  2 * NAMESIZE, buff(i))

         i += NAMESIZE + 2
      }
   }
   else
      call error(line)

   stop
   end


   subroutine cleanup(cp)

   longint cp

   call x$clra

   return
   end
