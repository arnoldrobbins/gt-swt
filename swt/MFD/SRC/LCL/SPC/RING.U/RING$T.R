include NET_DEFS

   define(BUFFSIZE,136) # Size of Ring user request

   define(INITIATED,1)
   define(REJECTED,2)
   define(NOTFOUND,3)
   define(NOREQUEST,4)
   define(WRONGSIZE,5)
   define(COMPLETED,6)


   subroutine ring$t(vcid, vcstat, buff, size, error)

#  ring$t --- transmit request to Ring process.

   integer vcid, vcstat(2), buff(BUFFSIZE), size, error(MAXLINE)

   integer rcvstat(3)

   integer status

   error(1) = EOS

   call x$tran(vcid, 0, buff, 2 * size, status)
   while (status == XS$IP)
      call x$wait(1)

   if (vcstat(1) == XS$CMP)
   {
      call x$rcv(vcid, buff, 2 * BUFFSIZE, rcvstat)
      while (rcvstat(1) == XS$IP)
         call x$wait(1)

      select (buff(2))
         when (INITIATED)
         {
            call x$rcv(vcid, buff, 2 * BUFFSIZE, rcvstat)
            while (rcvstat(1) == XS$IP)
               call x$wait(1)

            if (vcstat(1) ~= XS$CLR)
            {
               size = (rcvstat(3) + 1) / 2

               select (buff(size))
                  when (COMPLETED)
                  {
                     call x$clr(vcid, 0, status)
                     while (vcstat(1) ~= XS$CLR)
                        call x$wait(1)
                  }

                  when (NOTFOUND)
                     call ptoc("System is not in the ring"p, "."c, error, MAXLINE)
            }
            else
               call ptoc("Connection has been terminated"p, "."c, error, MAXLINE)
         }

         when (REJECTED)
            call ptoc("Request is invalid"p, "."c, error, MAXLINE)

         when (NOTFOUND)
            call ptoc("System is not in the ring"p, "."c, error, MAXLINE)

         when (NOREQUEST)
            call ptoc("Request is unknown"p, "."c, error, MAXLINE)

         when (WRONGSIZE)
            call ptoc("Request is the wrong size"p, "."c, error, MAXLINE)
   }
   else
      call ptoc("Cannot transmit request"p, "."c, error, MAXLINE)

   return
   end
