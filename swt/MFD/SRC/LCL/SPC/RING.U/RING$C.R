include NET_DEFS

   define(USER,99)   # Ring port for user connection requests


   subroutine ring$c(vcid, vcstat, error)

#  ring$c --- connect to local Ring process.

   integer vcid, vcstat(2), error(MAXLINE)

   integer ring(128), address(128)

   integer count, size, status, i, j

   error(1) = EOS

   call x$stat(XI$MYN, i, ring, count, address, size, status, j)

   select (status)
      when (XS$CMP)
      {
         call x$conn(vcid, USER, ring, count, vcstat)
         while (vcstat(1) == XS$IP)
            call x$wait(1)

         if (vcstat(1) ~= XS$CMP)
            call ptoc("Unable to connect to Ring process"p, "."c, error, MAXLINE)
      }

      when (XS$BPM)
         call ptoc("Bad parameter in status call"p, "."c, error, MAXLINE)

      when (XS$NET)
         call ptoc("Networks are not configured"p, "."c, error, MAXLINE)

      when (XS$UNK)
         call ptoc("Primenet name is unknown"p, "."c, error, MAXLINE)

   return
   end
