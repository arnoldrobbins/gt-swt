# whereami --- print out machine location

   subroutine whereami
   integer fd, open, getlin, length
   integer i
   character buf (MAXLINE)
   string unknown "unknown"

   fd = open ("=installation="s, READ)
   if (fd == ERR)
      call scopy (unknown, 1, buf, 1)
   else {
      i = getlin (buf, fd, MAXLINE)
      if (i == ERR || i == EOF)
         call scopy (unknown, 1, buf, 1)
      call close (fd)
      }
   i = length (buf)
   if (buf (i) == NEWLINE)
      buf (i) = EOS

   call mesg (buf, REMARK_MSG)

   return
   end
