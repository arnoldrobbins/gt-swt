#  Ring 1.0 --- Software Tools Subsystem Network Utility.
#               R. J. Mongiovi.  04/01/83.
#
#           One  ring  to  rule  them all,
#           One   ring   to   find   them,
#           One  ring  to  bring them all,
#           And in the darkness bind them.
#
#                        J. R. R. Tolkien.

include NET_DEFS
include "ring_def.r.i"

   include RING_COMMON

   external cleanup

   call mkon$f("CLEANUP$", 8, cleanup)

   call initialize

   repeat
   {
      call timdat(Time_info, INFOSIZE)

      call connect
      call accept
      call generate
      call update
      call search
      call examine
      call remove

      call pause
   }

   end


   subroutine accept

#  accept --- determine and accept all connection requests.

   include RING_COMMON

   integer ptoc

   character line(MAXLINE)
   integer name(NAMESIZE), status(2)

   integer vcid, port, size, addr, node, i, j

DB call print(STDOUT, "Checking pending connection requests*n"s)

   repeat
   {
      call xlgcon(XK$NAM, vcid, port, name, 2 * NAMESIZE, i,
                          0, 0, 0, 0, 0, 0, 0, 0, 0, status)

      if (status(1) == XS$CMP)
      {
         size = ptoc(name, " "c, line, i + 1)

         for (i = size + 1; i <= 2 * NAMESIZE; i += 1)
            line(i) = " "c
         line(i) = EOS

         call mapstr(line, UPPER)

         i = 1; call ctop(line, i, name, NAMESIZE)

         addr = 0
         do i = 1, Ring_size
         {
            do j = 1, NAMESIZE
               if (Node_name(j, Index_ring(i)) ~= name(j))
                  next 2

            addr = i
            call print(STDOUT, "Connection received from *,#h*n"s,
               Name_size(Index_ring(i)), Node_name(1, Index_ring(i)))

            break
         }

         if (addr > 0)
         {
            call allocate(node)
            TYPE(node) = BOGUS
            NODE(node) = addr
            VCID(node) = vcid

            select (port)
               when (RING)
                  call verify(node)

               when (CHCK)
                  call respond(node)

               when (USER)
                  call process(node)
         }
         else
         {
            call x$clr(vcid, 0, status)
DB          call print(STDOUT, "Connection from *,#h rejected*n"s,
DB             size, name)
         }
      }
      else
         return
   }

   end


   subroutine allocate(node)

#  allocate --- allocate a virtual circuit block.

   pointer node

   include RING_COMMON

   pointer dsget

   integer i

   Sequence += 1

   node = dsget(NODESIZE + NAMESIZE + PCKTSIZE + MESGSIZE)
DB call print(STDOUT, "Node #*i allocated at *i*n"s, Sequence, node)

   TYPE(node) = CLEAR

   BACK(node) = NULL
   NEXT(node) = NULL

   TIME(node) = ELAPSED

   HOLD(node) = NO
   SENT(node) = NO
   EXEC(node) = NO
   TOLD(node) = NO
   DONE(node) = NO

   NODE(node) = 0
   do i = 1, NAMESIZE
      NAME(i, node) = 0
   PROC(node) = 0
   CODE(node) = Sequence

   VCID(node) = 0
   STAT(node) = XS$CLR
   CLRS(node) = CC$CLR
   XMTS(node) = XS$CLR
   RCVS(node) = XS$CLR
   RCVL(node) = 0
   RCVN(node) = 0

   ANSR(node) = 0
   INDX(node) = 0

   return
   end


   subroutine build

#  build --- determine names of accessable systems.

   include RING_COMMON

   integer ptoc

   character line(MAXLINE)

   integer status, index, i, j, k, l

   call x$stat(XI$ADR, Ring_size, Ring_address, i, Address_size, j, status, k)
DB call print(STDOUT, "Determining *i system names*n"s, Ring_size)

   i = 1
   do j = 1, Ring_size
   {
      Index_ring(j) = j

      Address_index(j) = i
      i += (Address_size(j) + 1) / 2
   }

   do i = 1, Ring_size
   {
      call x$stat(XI$XTP, j, Ring_address(Address_index(i)), Address_size(i),
                             Node_name(1, i), k, status, l)

      Name_size(i) = ptoc(Node_name(1, i), " "c, line, k + 1)

      for (j = Name_size(i) + 1; j <= 2 * NAMESIZE; j += 1)
         line(j) = " "c
      line(j) = EOS

      call mapstr(line, UPPER)

      j = 1; call ctop(line, j, Node_name(1, i), NAMESIZE)
   }

DB call print(STDOUT, "Systems are: "s)
DB do i = 1, Ring_size
DB {
DB    call print(STDOUT, ' "*,#h"'s, Name_size(i), Node_name(1, i))
DB    if (i < Ring_size)
DB       call print(STDOUT, ","s)
DB    else
DB       call print(STDOUT, "*n"s)
DB }

   for (i = Ring_size / 2; i > 0; i /= 2)
      for (j = i + 1; j <= Ring_size; j += 1)
         for (k = j - i; k > 0; k -= i)
         {
            for (l = 1; l < NAMESIZE; l += 1)
               if (Node_name(l, Index_ring(k)) ~= Node_name(l, Index_ring(k + i)))
                  break

            if (Node_name(l, Index_ring(k)) > Node_name(l, Index_ring(k + i)))
            {
               index = Index_ring(k)
               Index_ring(k) = Index_ring(k + i)
               Index_ring(k + i) = index
            }
            else
               break
         }

DB call print(STDOUT, "Sorted order is: "s)
DB do i = 1, Ring_size
DB    call print(STDOUT, " *i"s, Index_ring(i))
DB call print(STDOUT, "*n"s)

   do i = 1, Ring_size
      if (Index_ring(i) == HOME)
      {
         Home_index = i

         break
      }
DB call print(STDOUT, "This system is *i*n"s, Home_index)

   Active_ring = Ring_size
DB call print(STDOUT, "Default ring size is *i*n"s, Active_ring)

   return
   end


   subroutine change(rcv)

#  change --- process and possibly change fields of packet.

   pointer rcv

   include RING_COMMON

   logical valid

   pointer xmt, req

   if (COMMAND(rcv) == INITIALIZE)
   {
      if (PACKET(rcv) == REQUEST)
      {
         COUNT(rcv) += 1
DB       call print(STDOUT, "Count of active systems is *i*n"s, COUNT(rcv))

         if (SOURCE(rcv) == Home_index)
         {
            PACKET(rcv) = RESPONSE
            NUMBER(rcv) = 1
            call print(STDOUT, "Created INITIALIZE response*n"s)
         }
      }

      if (PACKET(rcv) == RESPONSE)
      {
         Active_ring = COUNT(rcv)
DB       call print(STDOUT, "Number of active systems is *i*n"s, Active_ring)

         for (req = NEXT(Request); req ~= Request; req = NEXT(req))
            if (ANSR(req) > Active_ring)
               ANSR(req) = Active_ring

         select (STATE(rcv))
            when (0)
               if (NODE(rcv) > Home_index)
               {
                  SEARCH(Transmit, TYPE, VALID, xmt, DUMMY)

                  if (xmt ~= Transmit && valid(STAT(xmt)) && NODE(xmt) > Home_index)
                     if (Initialized)
                     {
                        STATE(rcv) = 2

                        if (Priviledged)
                        {
                           Synchronize = TRUE
DB                         call print(STDOUT, "This system will synchronize*n"s)
                        }
                     }
                     else
                     {
                        SOURCE(rcv) = Home_index
                        NUMBER(rcv) = 1
                        STATE(rcv) = 1
DB                      call print(STDOUT, "Next initialized system will synchronize*n"s)
                     }
               }

            when (1)
               if (Initialized)
               {
                  STATE(rcv) = 2

                  if (Priviledged)
                  {
                     Synchronize = TRUE
DB                   call print(STDOUT, "This system will synchronize*n"s)
                  }
               }

            when (2)
               ;
      }
   }

   return
   end


   subroutine cleanup(cp)

#  cleanup --- onunit to clean up at end of execution.

   longint cp

   include RING_COMMON

   if (~Terminated)
   {
      call x$clra
DB    call print(STDOUT, "Network cleared*n"s)
   }

   return
   end


   subroutine connect

#  connect --- determine if there is a transmit connection.

   include RING_COMMON

   logical valid

   pointer xmt, rsp

DB call print(STDOUT, "Checking transmission connection*n"s)

   SEARCH(Transmit, TYPE, VALID, xmt, DUMMY)

   if (xmt ~= Transmit)
      if (~valid(STAT(xmt)))
      {
         call print(STDOUT, "Lost transmission to *,#h*n"s,
            Name_size(Index_ring(NODE(xmt))), Node_name(1, Index_ring(NODE(xmt))))

         call delete(xmt)
         call dispose(xmt)
      }
      else
         return

   SEARCH(Transmit, TYPE, BOGUS, xmt, DUMMY)

   if (xmt == Transmit)
   {
      call build

      call allocate(xmt)
      TYPE(xmt) = BOGUS
      NODE(xmt) = Home_index
      call insert(Transmit, xmt)
DB    call print(STDOUT, "Created new transmission circuit*n"s)
   }

   if (~valid(STAT(xmt)))
   {
      TIME(xmt) = ELAPSED

      repeat
      {
         NODE(xmt) = mod(NODE(xmt), Ring_size) + 1

         SEARCH(Response, NODE, NODE(xmt), rsp, 0)

         if (rsp ~= Response && valid(STAT(rsp)))
         {
            call terminate(rsp)
DB          call print(STDOUT, "Invalid response circuit cleared*n"s)
         }

         call x$conn(VCID(xmt), RING, Node_name(1, Index_ring(NODE(xmt))),
                     Name_size(Index_ring(NODE(xmt))), STAT(xmt))
         call print(STDOUT, "Attempting connection to *,#h*n"s,
            Name_size(Index_ring(NODE(xmt))), Node_name(1, Index_ring(NODE(xmt))))
      }
      until (valid(STAT(xmt)))
   }

   return
   end


   subroutine delete(node)

#  delete --- delete node from doubly linked circular list.

   pointer node

   include RING_COMMON

   if (TYPE(node) == DUMMY)
      call error("Can't delete dummy header node"p)

   if (BACK(node) == NULL || NEXT(node) == NULL)
      call error("Node already deleted"p)

   NEXT(BACK(node)) = NEXT(node)
   BACK(NEXT(node)) = BACK(node)

   BACK(node) = NULL
   NEXT(node) = NULL

   return
   end


   subroutine dispose(node)

#  dispose --- return virtual circuit block to free space.

   pointer node

   include RING_COMMON

   if (TYPE(node) == DUMMY)
      call error("Can't dispose dummy header node"p)
   else
      if (TYPE(node) == CLEAR)
      {
         call dsfree(node)
DB       call print(STDOUT, "Disposed node #*i at *i*n"s, CODE(node), node)
      }
      else
         call insert(Complete, node)

   return
   end


   subroutine examine

#  examine --- examine all linked lists for invalid entries.

   include RING_COMMON

   logical valid

   integer time
   pointer xmt, rsp, rcv, val, back, list, ptr

DB call print(STDOUT, "Checking for elapsed virtual circuits*n"s)

   for (xmt = NEXT(Transmit); xmt ~= Transmit; xmt = NEXT(xmt))
      if (TYPE(xmt) == BOGUS && valid(STAT(xmt)))
      {
         time = ELAPSED

         if (time < TIME(xmt))
            time += 28800

         if (time - TIME(xmt) > INTERVAL)
         {
            back = BACK(xmt)

            call terminate(xmt)
DB          call print(STDOUT, "Elapsed transmission circuit cleared*n"s)

            SEARCH(Response, NODE, NODE(xmt), rsp, 0)

            if (rsp ~= Response && valid(STAT(rsp)))
            {
               call terminate(rsp)
DB             call print(STDOUT, "Elapsed response circuit cleared*n"s)

               call delete(rsp)
               call dispose(rsp)
            }

            call delete(xmt)
            call dispose(xmt)

            xmt = back
         }
      }

   for (rcv = NEXT(Receive); rcv ~= Receive; rcv = NEXT(rcv))
      if (valid(STAT(rcv)))
      {
         if (TYPE(rcv) == BOGUS)
         {
            time = ELAPSED

            if (time < TIME(rcv))
               time += 28800

            if (time - TIME(rcv) > INTERVAL)
            {
               back = BACK(rcv)

               call terminate(rcv)
DB             call print(STDOUT, "Elapsed receive circuit cleared*n"s)

               SEARCH(Validate, NODE, NODE(rcv), val, 0)

               if (val ~= Validate && valid(STAT(val)))
               {
                  call terminate(val)
DB                call print(STDOUT, "Elapsed validation circuit cleared*n"s)

                  call delete(val)
                  call dispose(val)
               }

               call delete(rcv)
               call dispose(rcv)

               rcv = back
            }
         }
      }
      else
      {
         back = BACK(rcv)

         call delete(rcv)
         call dispose(rcv)

         rcv = back
      }

   list = Validate
   repeat
   {
      for (ptr = NEXT(list); ptr ~= list; ptr = NEXT(ptr))
         if (valid(STAT(ptr)))
         {
            time = ELAPSED

            if (time < TIME(ptr))
               time += 28800

            if (time - TIME(ptr) > INTERVAL)
            {
               back = BACK(ptr)

               call terminate(ptr)
DB             call print(STDOUT, "Elapsed virtual circuit cleared*n"s)

               call delete(ptr)
               call dispose(ptr)

               ptr = back
            }
         }
         else
         {
            back = BACK(ptr)

            call delete(ptr)
            call dispose(ptr)

            ptr = back
         }

      select (list)
         when (Validate)
            list = Response

         when (Response)
            list = Request

         when (Request)
            return
   }

   end


   subroutine execute(rcv)

#  execute --- determine and perform action for ring.

   pointer rcv

   include RING_COMMON

   logical valid

   integer i
   pointer xmt

   if (valid(RCVS(rcv)))
   {
      if (RCVS(rcv) == XS$CMP)
      {
         TIME(rcv) = ELAPSED

DB       call print(STDOUT, "Received (*i *i *i *i *i *i *i *i *i)*n"s,
DB          PACKET(rcv), SOURCE(rcv), ADDRESS(rcv), NUMBER(rcv),
DB          PROCESS(rcv), JOBNAME(rcv), COMMAND(rcv), STATUS(rcv),
DB          RESULT(rcv))

         if (NUMBER(rcv) < Active_ring)
         {
            NUMBER(rcv) += 1

            if (HOLD(rcv) == NO)
               call change(rcv)

            if (SENT(rcv) == NO && ADDRESS(rcv) ~= Home_index)
            {
               SEARCH(Transmit, TYPE, VALID, xmt, DUMMY)

               if (xmt ~= Transmit && valid(STAT(xmt)) && XMTS(xmt) ~= XS$IP)
               {
                  TIME(xmt) = ELAPSED

                  for (i = 0; i < PCKTSIZE + MESGSIZE; i += 1)
                     BUFF(xmt + i) = BUFF(rcv + i)

                  call x$tran(VCID(xmt), 0, BUFF(xmt), BUFFSIZE, XMTS(xmt))
DB                call print(STDOUT, "Packet passed on to next node*n"s)
DB                call print(STDOUT, "Transmitted (*i *i *i *i *i *i *i *i *i)*n"s,
DB                   PACKET(xmt), SOURCE(xmt), ADDRESS(xmt), NUMBER(xmt),
DB                   PROCESS(xmt), JOBNAME(xmt), COMMAND(xmt), STATUS(xmt),
DB                   RESULT(xmt))

                  HOLD(rcv) = NO
                  SENT(rcv) = YES
               }
               else
               {
                  HOLD(rcv) = YES
DB                call print(STDOUT, "Receive connection has been put on hold*n"s)
               }
            }
            else
               SENT(rcv) = YES

            if (SENT(rcv) == YES)
               if (ADDRESS(rcv) == Home_index)
                  if (PACKET(rcv) == REQUEST)
                  {
                     if (TOLD(rcv) == NO)
                        call perform(rcv)

                     if (TOLD(rcv) == YES)
                     {
                        STATUS(rcv) = COMPLETED
                        RESULT(rcv) = 0
DB                      call print(STDOUT, "Request complete*n"s)

                        call report(rcv)
                     }
                  }
                  else
                     call report(rcv)
               else
                  if (PACKET(rcv) == REQUEST && ADDRESS(rcv) == ALL)
                     if (TOLD(rcv) == NO)
                        call perform(rcv)

            if (HOLD(rcv) == NO)
            {
               call x$rcv(VCID(rcv), BUFF(rcv), BUFFSIZE, RCVS(rcv))
DB             call print(STDOUT, "Awaiting reception of packet*n"s)

               SENT(rcv) = NO
               EXEC(rcv) = NO
               TOLD(rcv) = NO
               DONE(rcv) = NO
            }
            else
               NUMBER(rcv) -= 1
         }
         else
         {
            call finish(rcv)

            if (HOLD(rcv) == NO)
            {
DB             call print(STDOUT, "Discarded exhausted packet*n"s)

               call x$rcv(VCID(rcv), BUFF(rcv), BUFFSIZE, RCVS(rcv))
DB             call print(STDOUT, "Awaiting reception of packet*n"s)

               SENT(rcv) = NO
               EXEC(rcv) = NO
               TOLD(rcv) = NO
               DONE(rcv) = NO
            }
         }
      }
   }
   else
   {
DB    call print(STDOUT, "Invalid receive status*n"s)

      call x$rcv(VCID(rcv), BUFF(rcv), BUFFSIZE, RCVS(rcv))
DB    call print(STDOUT, "Awaiting reception of packet*n"s)
   }

   return
   end


   subroutine finish(rcv)

#  finish --- complete processing of exhausted packet.

   pointer rcv

   include RING_COMMON

   logical valid

   pointer xmt

   if (COMMAND(rcv) == INITIALIZE)
   {
      if (PACKET(rcv) == REQUEST)
      {
         Synchronize = FALSE
         Terminated = FALSE

         if (SENT(rcv) == NO)
         {
            SEARCH(Transmit, TYPE, VALID, xmt, DUMMY)

            if (xmt ~= Transmit && valid(STAT(xmt)) && XMTS(xmt) ~= XS$IP)
            {
               PACKET(xmt) = REQUEST
               SOURCE(xmt) = Home_index
               ADDRESS(xmt) = ALL
               NUMBER(xmt) = 0
               PROCESS(xmt) = Home_pid
               JOBNAME(xmt) = 0
               COMMAND(xmt) = INITIALIZE
               STATUS(xmt) = INITIATED
               RESULT(xmt) = 0

               COUNT(xmt) = 0
               STATE(xmt) = 0

               call x$tran(VCID(xmt), 0, BUFF(xmt), BUFFSIZE, XMTS(xmt))
               call print(STDOUT, "Retransmitted INITIALIZE request*n"s)

               HOLD(rcv) = NO
               SENT(rcv) = YES
            }
            else
            {
               HOLD(rcv) = YES
DB             call print(STDOUT, "Receive connection has been put on hold*n"s)
            }
         }
      }
      else
         if (STATE(rcv) ~= 2)
         {
            Initialized = TRUE
            Synchronize = Priviledged
            Terminated = FALSE
            call print(STDOUT, "Ring initialized by default*n"s)
         }
   }
   else
      if (PACKET(rcv) == REQUEST)
      {
         if (TOLD(rcv) == NO)
         {
            if (ADDRESS(rcv) == ALL)
            {
               STATUS(rcv) = COMPLETED
DB             call print(STDOUT, "Request complete*n"s)
            }
            else
            {
               STATUS(rcv) = NOTFOUND
DB             call print(STDOUT, "Request not complete*n"s)
            }
            RESULT(rcv) = 0

            TOLD(rcv) = YES
         }

         call report(rcv)
      }

   return
   end


   subroutine generate

#  generate --- generate transmissions that originate here.

   include RING_COMMON

   logical valid

   character line(MAXLINE)

   integer i
   longint time
   pointer rcv, xmt

DB call print(STDOUT, "Generating necessary request packets*n"s)

   if (Priviledged)
   {
      SEARCH(Receive, TYPE, VALID, rcv, DUMMY)
      SEARCH(Transmit, TYPE, VALID, xmt, DUMMY)

      time = intl(Time_info(4)) * intl(60) + intl(Time_info(5))
      time %= intl(MODULUS)

      if (time >= intl(MODULUS - TOLERANCE) || time <= intl(TOLERANCE))
         if (rcv ~= Receive && valid(STAT(rcv)) && NODE(rcv) > Home_index)
            if (xmt ~= Transmit && valid(STAT(xmt)) && NODE(xmt) > Home_index)
                  Synchronize = TRUE

      if (Initialized && Synchronize)
         if (valid(STAT(xmt)) && XMTS(xmt) ~= XS$IP && Time_info(5) == 0)
         {
            TIME(xmt) = ELAPSED

            PACKET(xmt) = REQUEST
            SOURCE(xmt) = Home_index
            ADDRESS(xmt) = ALL
            NUMBER(xmt) = 1
            PROCESS(xmt) = Home_pid
            JOBNAME(xmt) = 0
            COMMAND(xmt) = SYNCHRONIZE
            STATUS(xmt) = INITIATED
            RESULT(xmt) = 0

            MONTH(xmt) = Time_info(1)
            DATE(xmt) = Time_info(2)
            YEAR(xmt) = Time_info(3)

            call encode(line, MAXLINE, "*2,,0i"s, Time_info(4) / 60)
            i = 1; call ctop(line, i, HOUR(xmt), 1)

            call encode(line, MAXLINE, "*2,,0i"s, mod(Time_info(4), 60))
            i = 1; call ctop(line, i, MINUTE(xmt), 1)

            call x$tran(VCID(xmt), 0, BUFF(xmt), BUFFSIZE, XMTS(xmt))
            call print(STDOUT,
               "Transmitted SYNCHRONIZE request at *,2h:*,2h on *,2h/*,2h/*,2h*n"s,
               HOUR(xmt), MINUTE(xmt), MONTH(xmt), DATE(xmt), YEAR(xmt))

            Synchronize = FALSE

            call sleep$(intl(TOLERANCE + 1) * intl(1000))
         }
   }

   return
   end


   subroutine identify(node)

#  identify --- determine PID and user name for USER circuit.

   pointer node

   include RING_COMMON

   integer ptoc
   logical valid

   character line(MAXLINE)
   integer circuit(64), vcinfo(13), procid(64), meter(43)
   logical known(64)

   integer number, count, status, i, j
   pointer req

   call x$stat(XI$AVC, number, Ring_address(Address_index(HOME)),
                   Address_size(HOME), circuit, count, status, i)
DB call print(STDOUT, "*i open virtual circuits to this system*n"s, number)

   count = 0
   for (i = 1; i <= number; i += 1)
   {
      call x$stat(XI$VCD, circuit(i), 0, 0, vcinfo, 13, status, j)

      if (status == XS$CMP)
         if (vcinfo(5) == USER && vcinfo(1) == 5 && vcinfo(2) ~= Home_pid)
         {
            count += 1

            known(count) = FALSE
            procid(count) = vcinfo(2)
         }
   }

   for (req = NEXT(Request); req ~= Request; req = NEXT(req))
      if (valid(STAT(req)))
         for (i = 1; i <= count; i += 1)
            if (~known(i) && procid(i) == PROC(req))
            {
               known(i) = TRUE

               break
            }

   for (i = 1; i <= count; i += 1)
      if (~known(i))
      {
         TYPE(node) = VALID
         PROC(node) = procid(i)

         call gmetr$(4, loc(meter), 43, status, procid(i))

         j = ptoc(meter(USERNAME), " "c, line, 2 * NAMESIZE + 1) + 1
         while (j <= 2 * NAMESIZE)
         {
            line(j) = " "c
            j += 1
         }
         line(j) = EOS

         call mapstr(line, UPPER)

         j = 1; call ctop(line, j, NAME(1, node), NAMESIZE)

         break
      }

   return
   end


   subroutine initialize

#  initialize --- initialize variables.

   include RING_COMMON

   integer equal

   integer status

   character line (MAXLINE)

   Terminated = FALSE

   call x$asgn(RING, 0, status)
   if (status ~= XS$CMP)
      call error("Can't assign Ring port"p)
DB call print(STDOUT, "Ring port assigned*n"s)

   call x$asgn(CHCK, 0, status)
   if (status ~= XS$CMP)
      call error("Can't assign Check port"p)
DB call print(STDOUT, "Check port assigned*n"s)

   call x$asgn(USER, 0, status)
   if (status ~= XS$CMP)
      call error("Can't assign User port"p)
DB call print(STDOUT, "User port assigned*n"s)

   call dsinit(HEAPSIZE)

   call timdat(Time_info, INFOSIZE)
   Home_pid = Time_info(12)

   Sequence = 0

   call expand("=GaTech="s, line, MAXLINE)
   Priviledged = (equal(line, "yes"s) == YES)

   Initialized = FALSE
   Synchronize = FALSE

   call allocate(Transmit)
   TYPE(Transmit) = DUMMY
   NEXT(Transmit) = Transmit
   BACK(Transmit) = Transmit
DB call print(STDOUT, "Transmit list initialized*n"s)

   call allocate(Receive)
   TYPE(Receive) = DUMMY
   NEXT(Receive) = Receive
   BACK(Receive) = Receive
DB call print(STDOUT, "Receive list initialized*n"s)

   call allocate(Validate)
   TYPE(Validate) = DUMMY
   NEXT(Validate) = Validate
   BACK(Validate) = Validate
DB call print(STDOUT, "Validate list initialized*n"s)

   call allocate(Response)
   TYPE(Response) = DUMMY
   NEXT(Response) = Response
   BACK(Response) = Response
DB call print(STDOUT, "Response list initialized*n"s)

   call allocate(Request)
   TYPE(Request) = DUMMY
   NEXT(Request) = Request
   BACK(Request) = Request
DB call print(STDOUT, "Request list initialized*n"s)

   call allocate(Complete)
   TYPE(Complete) = DUMMY
   NEXT(Complete) = Complete
   BACK(Complete) = Complete
DB call print(STDOUT, "Complete list initialized*n"s)

   return
   end


   subroutine insert(list, node)

#  insert --- insert node into doubly linked circular list.

   pointer list, node

   include RING_COMMON

   if (TYPE(node) == DUMMY)
      call error("Can't insert dummy header node into list"p)

   if (BACK(node) ~= NULL || NEXT(node) ~= NULL)
      call error("Node already inserted"p)

   BACK(node) = list
   NEXT(node) = NEXT(list)

   NEXT(BACK(node)) = node
   BACK(NEXT(node)) = node

   return
   end


   subroutine pause

#  pause --- wait until next network event occurs.

   include RING_COMMON

   logical valid

   integer name(NAMESIZE), status(2)

   integer vcid, port, size
   longint time
   pointer xmt, rcv, val, rsp, req

DB call print(STDOUT, "Waiting for next network event*n"s)

   SEARCH(Transmit, TYPE, VALID, xmt, DUMMY)
   if (xmt == Transmit)
      SEARCH(Transmit, TYPE, BOGUS, xmt, DUMMY)

   if (xmt == Transmit || ~valid(STAT(xmt)))
      return

   call xlgcon(XK$NAM, vcid, port, name, 2 * NAMESIZE, size,
                          0, 0, 0, 0, 0, 0, 0, 0, 0, status)
   if (status(1) == XS$CMP)
      return

   for (rcv = NEXT(Receive); rcv ~= Receive; rcv = NEXT(rcv))
      if (valid(STAT(rcv)) && (~valid(RCVS(rcv)) || RCVS(rcv) == XS$CMP))
      {
         if (HOLD(rcv) == YES)
            call x$wait(1)

         return
      }

   for (val = NEXT(Validate); val ~= Validate; val = NEXT(val))
      if (valid(STAT(val)) && STAT(val) ~= XS$IP && HOLD(val) == NO)
      {
         if (DONE(val) == YES)
            call x$wait(1)

         return
      }

   for (rsp = NEXT(Response); rsp ~= Response; rsp = NEXT(rsp))
      if (valid(STAT(rsp)) && (~valid(RCVS(rsp)) || (RCVS(rsp) == XS$CMP && HOLD(rsp) == NO)))
      {
         if (DONE(rsp) == YES)
            call x$wait(1)

         return
      }

   for (req = NEXT(Request); req ~= Request; req = NEXT(req))
      if (HOLD(req) == NO && valid(STAT(req)) && RCVS(req) == XS$CMP)
      {
         if (DONE(req) == YES)
            call x$wait(1)

         return
      }

   call timdat(Time_info, INFOSIZE)
   time = mod(intl(Time_info(4)) * intl(60) + intl(Time_info(5)), intl(INTERVAL))

   call x$wait(ints(intl(INTERVAL) - time) * 10)

   return
   end


   subroutine perform(vrcv)

#  perform --- perform action indicated by RING packet.

   pointer vrcv

   include RING_COMMON

   file_des mktemp, create
   integer sys$$, phantom
   logical valid

   character line(MAXLINE), name(MAXLINE)

   file_des temp
   integer status, time, i, j
   pointer brcv, val, list, ptr

   if (EXEC(vrcv) == NO)
   {
      select (COMMAND(vrcv))
         when (VALIDATE)
         {
DB          call print(STDOUT, "VALIDATE request received*n"s)

            SEARCH(Receive, TYPE, BOGUS, brcv, DUMMY)

            if (brcv ~= Receive && valid(STAT(brcv)) && NODE(brcv) == SOURCE(vrcv))
            {
               call terminate(brcv)
DB             call print(STDOUT, "Erroneous receive circuit cleared*n"s)
            }

            SEARCH(Validate, NODE, SOURCE(vrcv), val, 0)

            if (val ~= Validate && valid(STAT(val)))
            {
               call terminate(val)
DB             call print(STDOUT, "Validation circuit cleared*n"s)
            }

            STATUS(vrcv) = 0
            RESULT(vrcv) = 0
         }

         when (INITIALIZE)
         {
            call print(STDOUT, "INITIALIZE request received*n"s)

            Synchronize = FALSE
            Terminated = FALSE

            call build

            STATUS(vrcv) = 0
            RESULT(vrcv) = 0
         }

         when (SYNCHRONIZE)
         {
            call encode(line, MAXLINE, "SETIME -*,2h*,2h*,2h -*,2h*,2h"s,
               MONTH(vrcv), DATE(vrcv), YEAR(vrcv), HOUR(vrcv), MINUTE(vrcv))

            status = sys$$(line, ERR)
            call print(STDOUT, "Synchronized at *,2h:*,2h on *,2h/*,2h/*,2h*n"s,
               HOUR(vrcv), MINUTE(vrcv), MONTH(vrcv), DATE(vrcv), YEAR(vrcv))

            Initialized = TRUE

            call timdat(Time_info, INFOSIZE)
            time = ELAPSED

            list = Transmit
            repeat
            {
               for (ptr = NEXT(list); ptr ~= list; ptr = NEXT(ptr))
                  if (valid(STAT(ptr)))
                     TIME(ptr) = time

               select (list)
                  when (Transmit)
                     list = Receive

                  when (Receive)
                     list = Validate

                  when (Validate)
                     list = Response

                  when (Response)
                     list = Request

                  when (Request)
                     break
            }

            if (JOBNAME(vrcv) ~= 0)
               if (status == OK)
                  STATUS(vrcv) = SUCCEEDED
               else
                  STATUS(vrcv) = FAILED
            else
               STATUS(vrcv) = 0
            RESULT(vrcv) = 0
         }

         when (SHUTDOWN)
         {
            if (Terminated)
            {
               call print(STDOUT, "Ring SHUTDOWN initiated*n"s)
               call sleep$(intl(5000))

               list = Transmit
               repeat
               {
                  for (ptr = NEXT(list); ptr ~= list; ptr = NEXT(ptr))
                     if (valid(STAT(ptr)))
                        call terminate(ptr)

                  select (list)
                     when (Transmit)
                        list = Receive

                     when (Receive)
                        list = Validate

                     when (Validate)
                        list = Response

                     when (Response)
                        list = Request

                     when (Request)
                     {
                        call print(STDOUT, "Shutdown complete*n"s)

                        stop
                     }
               }
            }

            STATUS(vrcv) = 0
            RESULT(vrcv) = 0
         }

         when (BROADCAST)
         {
            if (TARGET(1, vrcv) ~= 0)
               call encode(line, MAXLINE, "MESSAGE *,#h -NOW -FORCE"s,
                  2 * NAMESIZE, TARGET(1, vrcv))
            else
               call encode(line, MAXLINE, "MESSAGE -ALL -NOW -FORCE"s)

            temp = mktemp(READWRITE)
            if (temp ~= ERR)
            {
               call print(temp, "*s*n"s, MESSAGE(1, vrcv))

               call rewind(temp)

               status = sys$$(line, temp)
               if (TARGET(1, vrcv) ~= 0)
                  call print(STDOUT, "Message broadcast to user *,#h*n"s,
                     2 * NAMESIZE, TARGET(1, vrcv))
               else
                  call print(STDOUT, "Message broadcast to ALL users*n"s)

               call rmtemp(temp)

               if (status == OK)
                  STATUS(vrcv) = SUCCEEDED
               else
                  STATUS(vrcv) = FAILED
               RESULT(vrcv) = 0
            }
            else
            {
               STATUS(vrcv) = FAILED
               RESULT(vrcv) = 0
DB             call print(STDOUT, "Cannot create temporary file for message*n"s)
            }
         }

         when (EXECUTE)
         {
            i = 0
            repeat
            {
               i += 1
               call encode(name, MAXLINE, "=temp=/rmph*3,,0i"s, i)

               temp = create(name, WRITE)
            }
            until (temp ~= ERR || i >= 999)

            if (temp ~= ERR)
            {
               call print(temp, "CHAP LOWER 2*n"s)
               call print(temp, "SWT -6*n"s)

               call print(temp, "*s*n"s, CMDLINE(1, vrcv))

               call print(temp, "stop *s*n"s, name)
               call close(temp)

               status = phantom(name, vrcv)
               if (status ~= ERR)
               {
                  STATUS(vrcv) = SUCCEEDED
                  RESULT(vrcv) = status

                  call print(STDOUT, "Phantom (*i) created for user *,#h*n"s,
                     status, 2 * NAMESIZE, USERID(1, vrcv))
               }
               else
               {
                  STATUS(vrcv) = FAILED
                  RESULT(vrcv) = 0

                  call print(STDOUT, "Phantom creation for user *,#h failed*n"s,
                     2 * NAMESIZE, USERID(1, vrcv))
               }
            }
            else
            {
               STATUS(vrcv) = FAILED
               RESULT(vrcv) = 0

DB             call print(STDOUT, "Cannot create temporary file for command*n"s)
            }
         }

         when (TERMINATE)
         {
            Terminated = TRUE
            call print(STDOUT, "TERMINATE request received*n"s)

            STATUS(vrcv) = SUCCEEDED
            RESULT(vrcv) = 0
         }

      EXEC(vrcv) = YES
   }

   if (STATUS(vrcv) ~= 0)
   {
      call report(vrcv)

      if (HOLD(vrcv) == NO)
         TOLD(vrcv) = YES
      DONE(vrcv) = NO
   }
   else
      TOLD(vrcv) = YES

   return
   end


   integer function phantom(file, node)

#  phantom --- spawn a phantom for a user.

   character file(MAXLINE)
   pointer node

   include RING_COMMON

   logical wizard

   character cname(33)
   integer buff(57), pname(16), vname(17), pword(3)

   integer attach, process, status, i

   buff(1) = 1

   call ptoc(USERID(1, node), " "c, cname, 2 * NAMESIZE + 1)
   i = 1; call ctov(cname, i, buff(2), 17)

   if (wizard(USERID(1, node)))
   {
      i = 1; call ctov("LAB"s, i, buff(19), 17)

      buff(40) = 1
      i = 1; call ctov(".GURU"s, i, buff(41), 17)
   }
   else
   {
      i = 1; call ctov("DEFAULT"s, i, buff(19), 17)

      buff(40) = 0
      i = 1; call ctov(""s, i, buff(41), 17)
   }

   buff(36) = 0
   buff(37) = 0
   buff(38) = 0
   buff(39) = 0

   call getto(file, pname, pword, attach)

   call ptoc(pname, " "c, cname, 33)
   i = 1; call ctov(cname, i, vname, 17)

   call spawn$(0, loc(buff), vname, 6, 0, process, status)

   if (attach == YES)
      call follow(""s, 0)

   if (status == 0)
      return (process)
   else
      return (ERR)
   end


   subroutine process(node)

#  process --- process user connection request.

   pointer node

   include RING_COMMON

   if (NODE(node) == Home_index)
   {
      call x$acpt(VCID(node), STAT(node))
DB    call print(STDOUT, "User connection accepted*n"s)

      call identify(node)

      if (TYPE(node) == VALID)
      {
         call insert(Request, node)
         call print(STDOUT, "User connection is from *,#h (*i)*n"s,
            2 * NAMESIZE, NAME(1, node), PROC(node))

         call x$rcv(VCID(node), BUFF(node), BUFFSIZE, RCVS(node))
DB       call print(STDOUT, "Awaiting reception of request*n"s)
      }
      else
      {
         call terminate(node)
DB       call print(STDOUT, "User connection cleared*n"s)

         call dispose(node)
      }
   }
   else
   {
      call terminate(node)
DB    call print(STDOUT, "User connection rejected*n"s)

      call dispose(node)
   }

   return
   end


   subroutine reform(brcv)

#  reform --- check validity of receiver and restructure ring.

   pointer brcv

   include RING_COMMON

   logical valid

   logical flag
   pointer vrcv, xmt, val, req

   if (valid(RCVS(brcv)))
      if (RCVS(brcv) == XS$CMP)
      {
         TIME(brcv) = ELAPSED

         flag = RCVL(brcv) == 0 & RCVN(brcv) == BUFFSIZE

         if (flag)
            flag =  SOURCE(brcv) == NODE(brcv) _
                 & ADDRESS(brcv) == Home_index _
                 &  NUMBER(brcv) == 1 _
                 & COMMAND(brcv) == VALIDATE

         if (flag)
         {
DB          call print(STDOUT, "Response password received*n"s)
DB          call print(STDOUT, "Response password is *i*n"s, RESULT(brcv))

            SEARCH(Validate, NODE, NODE(brcv), val, 0)

            if (val ~= Validate && valid(STAT(val)))
               flag = RESULT(brcv) == RESULT(val)
            else
               flag = FALSE

            if (flag)
            {
               call terminate(val)
DB             call print(STDOUT, "Validation circuit cleared*n"s)

               SEARCH(Receive, TYPE, VALID, vrcv, DUMMY)

               if (vrcv ~= Receive && valid(STAT(vrcv)))
               {
                  flag = FALSE

                  call terminate(vrcv)
DB                call print(STDOUT, "Previous receive circuit cleared*n"s)
               }
               else
                  flag = TRUE

               TYPE(brcv) = VALID
               call print(STDOUT, "Validated reception from *,#h*n"s,
                  Name_size(Index_ring(NODE(brcv))),
                  Node_name(1, Index_ring(NODE(brcv))))

               call x$rcv(VCID(brcv), BUFF(brcv), BUFFSIZE, RCVS(brcv))
DB             call print(STDOUT, "Awaiting reception of packet*n"s)

               if (NODE(brcv) == Home_index)
               {
                  Initialized = TRUE
                  Synchronize = FALSE
                  Terminated = FALSE

                  Active_ring = 1

                  for (req = NEXT(Request); req ~= Request; req = NEXT(req))
                     if (ANSR(req) > Active_ring)
                        ANSR(req) = Active_ring

                  call print(STDOUT, "Degenerate ring initialized*n"s)
               }
               else
               {
                  Synchronize = FALSE
                  Terminated = FALSE

                  SEARCH(Transmit, TYPE, VALID, xmt, DUMMY)

                  if (xmt ~= Transmit && valid(STAT(xmt)))
                  {
                     while (XMTS(xmt) == XS$IP)
                        call x$wait(1)

                     PACKET(xmt) = REQUEST
                     SOURCE(xmt) = Home_index
                     ADDRESS(xmt) = ALL
                     NUMBER(xmt) = 0
                     PROCESS(xmt) = Home_pid
                     JOBNAME(xmt) = 0
                     COMMAND(xmt) = INITIALIZE
                     STATUS(xmt) = INITIATED
                     RESULT(xmt) = 0

                     COUNT(xmt) = 0
                     STATE(xmt) = 0

                     call x$tran(VCID(xmt), 0, BUFF(xmt), BUFFSIZE, XMTS(xmt))
                     call print(STDOUT, "Transmitted INITIALIZE request*n"s)
                  }
               }

               flag = TRUE
            }
         }
         else
         {
            select
               when (RCVL(brcv) ~= 0)
                  call print(STDOUT, "Receive level is not 0*n"s)

               when (RCVN(brcv) ~= BUFFSIZE)
                  call print(STDOUT, "Response size is not BUFFSIZE*n"s)

               when (SOURCE(brcv) ~= NODE(brcv))
                  call print(STDOUT, "Response source is not correct*n"s)

               when (ADDRESS(brcv) ~= Home_index)
                  call print(STDOUT, "Response is not correctly addressed*n"s)

               when (NUMBER(brcv) ~= 1)
                  call print(STDOUT, "Response transmission count is not 1*n"s)

               when (COMMAND(brcv) ~= VALIDATE)
                  call print(STDOUT, "Response is not a validation request*n"s)
         }
      }
      else
         flag = TRUE
   else
   {
DB    call print(STDOUT, "Invalid receive status*n"s)
      flag = FALSE
   }

   if (~flag)
   {
      call terminate(brcv)
DB    call print(STDOUT, "Invalid receive circuit cleared*n"s)

      SEARCH(Validate, NODE, NODE(brcv), val, 0)

      if (val ~= Validate && valid(STAT(val)))
      {
         call terminate(val)
DB       call print(STDOUT, "Validation circuit cleared*n"s)
      }
   }

   return
   end


   subroutine remove

#  remove --- scan Complete VC's and delete all invalid circuits.

   include RING_COMMON

   logical valid

   pointer node, back

DB call print(STDOUT, "Checking for completed circuits*n"s)

   for (node = NEXT(Complete); node ~= Complete; node = NEXT(node))
      if (~valid(STAT(node)))
      {
         back = BACK(node)

         call delete(node)

         TYPE(node) = CLEAR
         call dispose(node)

         node = back
      }

   return
   end


   subroutine report(rcv)

#  report --- deliver status report to requesting user.

   pointer rcv

   include RING_COMMON

   logical valid

   integer i
   pointer xmt, req

   if (PACKET(rcv) == REQUEST && SOURCE(rcv) ~= Home_index)
   {
      if (DONE(rcv) == NO)
      {
         SEARCH(Transmit, TYPE, VALID, xmt, DUMMY)

         if (xmt ~= Transmit && valid(STAT(xmt)) && XMTS(xmt) ~= XS$IP)
         {
            TIME(xmt) = ELAPSED

            PACKET(xmt) = RESPONSE
            SOURCE(xmt) = Home_index
            ADDRESS(xmt) = SOURCE(rcv)
            NUMBER(xmt) = 0
            PROCESS(xmt) = PROCESS(rcv)
            JOBNAME(xmt) = JOBNAME(rcv)
            COMMAND(xmt) = COMMAND(rcv)
            STATUS(xmt) = STATUS(rcv)
            RESULT(xmt) = RESULT(rcv)

            call x$tran(VCID(xmt), 0, BUFF(xmt), BUFFSIZE, XMTS(xmt))
DB          call print(STDOUT, "Ring response transmitted*n"s)
DB          call print(STDOUT, "Transmitted (*i *i *i *i *i *i *i *i *i)*n"s,
DB             PACKET(xmt), SOURCE(xmt), ADDRESS(xmt), NUMBER(xmt),
DB             PROCESS(xmt), JOBNAME(xmt), COMMAND(xmt), STATUS(xmt),
DB             RESULT(xmt))

            HOLD(rcv) = NO
            DONE(rcv) = YES
         }
         else
         {
            HOLD(rcv) = YES
DB          call print(STDOUT, "Receive circuit has been put on hold*n"s)
         }
      }
   }
   else
      if ((PACKET(rcv) ==  REQUEST &&  SOURCE(rcv) == Home_index) ||
          (PACKET(rcv) == RESPONSE && ADDRESS(rcv) == Home_index))
         for (req = NEXT(Request); req ~= Request; req = NEXT(req))
            if (PROC(req) == PROCESS(rcv) && CODE(req) == JOBNAME(rcv))
            {
               if (DONE(rcv) == NO && valid(STAT(req)))
               {
                  do i = 1, NAMESIZE
                  {
                     INDX(req) += 1
                     BUFF(req + INDX(req)) = Node_name(i, Index_ring(SOURCE(rcv)))
                  }
                  INDX(req) += 1
                  BUFF(req + INDX(req)) = STATUS(rcv)
                  INDX(req) += 1
                  BUFF(req + INDX(req)) = RESULT(rcv)

                  if (STATUS(rcv) == NOTFOUND)
                     ANSR(req) -= 1

DB                call print(STDOUT, "*i words reported, *i expected*n"s,
DB                   INDX(req), (NAMESIZE + 2) * ANSR(req))

                  if (INDX(req) > (NAMESIZE + 2) * ANSR(req))
                     if (XMTS(req) ~= XS$IP)
                     {
                        TIME(req) = ELAPSED

                        call x$tran(VCID(req), 0, BUFF(req),
                           2 * (INDX(req) + 1), XMTS(req))
DB                      call print(STDOUT, "Response transmitted to user *,#h (*i)*n"s,
DB                         2 * NAMESIZE, NAME(1, req), PROC(req))

                        HOLD(rcv) = NO
                        DONE(rcv) = YES
                     }
                     else
                     {
                        HOLD(rcv) = YES
DB                      call print(STDOUT, "Receive circuit has been put on hold*n"s)
                     }
               }

               if (DONE(rcv) == YES)
                  call signal(rcv)

               break
            }

   return
   end


   subroutine respond(node)

#  respond --- respond to validation request.

   pointer node

   include RING_COMMON

   logical valid

   pointer rsp

   SEARCH(Response, NODE, NODE(node), rsp, 0)

   if (rsp == Response || ~valid(STAT(rsp)))
   {
      call x$acpt(VCID(node), STAT(node))
DB    call print(STDOUT, "Validation connection accepted*n"s)

      TYPE(node) = VALID
      call insert(Response, node)

      call x$rcv(VCID(node), BUFF(node), BUFFSIZE, RCVS(node))
DB    call print(STDOUT, "Awaiting reception of password*n"s)
   }
   else
   {
DB    call print(STDOUT, "Duplicate validation connection*n"s)

      call terminate(node)
DB    call print(STDOUT, "Validation connection cleared*n"s)
   }

   return
   end


   subroutine search

#  search --- search user connections for request reception.

   include RING_COMMON

   logical valid

   pointer req, xmt

DB call print(STDOUT, "Checking for user requests*n"s)

   for (req = NEXT(Request); req ~= Request; req = NEXT(req))
      if (HOLD(req) == NO && valid(STAT(req)))
         if (valid(RCVS(req)))
         {
            if (RCVS(req) == XS$CMP)
            {
               TIME(req) = ELAPSED
               HOLD(req) = YES
               DONE(req) = YES

               SEARCH(Transmit, TYPE, VALID, xmt, DUMMY)

               if (xmt ~= Transmit && valid(STAT(xmt)) && XMTS(xmt) ~= XS$IP)
               {
                  call translate(req, xmt)

                  if (BUFF(req + 1) == INITIATED)
                  {
                     call x$tran(VCID(xmt), 0, BUFF(xmt), BUFFSIZE, XMTS(xmt))
DB                   call print(STDOUT, "Ring request transmitted*n"s)

                     call x$tran(VCID(req), 0, BUFF(req), USERSIZE, XMTS(req))
                     call print(STDOUT, "User request made for *,#h (*i)*n"s,
                        2 * NAMESIZE, NAME(1, req), PROC(req))
                  }
                  else
                  {
                     call x$tran(VCID(req), 0, BUFF(req), USERSIZE, XMTS(req))
DB                   call print(STDOUT, "User request error status transmitted*n"s)
                  }
               }
               else
               {
                  HOLD(req) = NO
DB                call print(STDOUT, "User request will be retried*n"s)
               }
            }
         }
         else
         {
DB          call print(STDOUT, "Invalid receive status*n"s)

            call terminate(req)
DB          call print(STDOUT, "User connection cleared*n"s)
         }

   return
   end


   subroutine signal(rcv)

#  signal --- send packet signaling that response has been sent.

   pointer rcv

   include RING_COMMON

   logical valid

   pointer xmt

   if (COMMAND(rcv) == TERMINATE && STATUS(rcv) == COMPLETED)
   {
      SEARCH(Transmit, TYPE, VALID, xmt, DUMMY)

      if (xmt ~= Transmit && valid(STAT(xmt)) && XMTS(xmt) ~= XS$IP)
      {
         TIME(xmt) = ELAPSED

         PACKET(xmt) = REQUEST
         SOURCE(xmt) = Home_index
         ADDRESS(xmt) = ALL
         NUMBER(xmt) = 0
         PROCESS(xmt) = Home_pid
         JOBNAME(xmt) = 0
         COMMAND(xmt) = SHUTDOWN
         STATUS(xmt) = INITIATED
         RESULT(xmt) = 0

         call x$tran(VCID(xmt), 0, BUFF(xmt), BUFFSIZE, XMTS(xmt))
         call print(STDOUT, "SHUTDOWN request transmitted*n"s)

         HOLD(rcv) = NO
      }
      else
      {
         HOLD(rcv) = YES
DB       call print(STDOUT, "Receive circuit has been put on hold*n"s)
      }
   }

   return
   end


   subroutine terminate(node)

#  terminate --- clear a virtual circuit and wait for completion.

   pointer node

   include RING_COMMON

   integer status

   if (STAT(node) ~= XS$CLR)
   {
      call x$clr(VCID(node), 0, status)

      while (STAT(node) ~= XS$CLR)
         call x$wait(1)
   }

   TYPE(node) = CLEAR

   return
   end


   subroutine translate(req, xmt)

#  translate --- convert and copy user request into ring request.

   pointer req, xmt

   include RING_COMMON

   logical wizard

   integer status, i, j

   if (RCVN(req) >= USERSIZE)
      if (BUFF(req) > MINREQUEST && BUFF(req) < MAXREQUEST)
      {
         status = INITIATED

         if (BUFF(req) == TERMINATE || BUFF(req) == SETTIME)
            if (~wizard(NAME(1, req)))
            {
               status = REJECTED
DB             call print(STDOUT, "User is not validated to issue request*n"s)
            }

         if (status == INITIATED)
         {
            ADDRESS(xmt) = 0

            select (BUFF(req))
               when (EXECUTE, TERMINATE)
                  if (BUFF(req + 1) ~= 0)
                     do i = 1, Ring_size
                     {
                        do j = 1, NAMESIZE
                           if (Node_name(j, Index_ring(i)) ~= BUFF(req + j))
                              next 2

                        ADDRESS(xmt) = i
DB                      call print(STDOUT, "User request is addressed to *i*n"s, i)
                        break
                     }
                  else
                  {
                     ADDRESS(xmt) = ALL
DB                   call print(STDOUT, "User request is addressed to ALL*n"s)
                  }

               when (BROADCAST, SETTIME)
               {
                  ADDRESS(xmt) = ALL
DB                call print(STDOUT, "User request is addressed to ALL*n"s)
               }

            if (ADDRESS(xmt) ~= 0)
            {
               if (ADDRESS(xmt) == ALL)
                  ANSR(req) = Active_ring
               else
                  ANSR(req) = 1

               PACKET(xmt) = REQUEST
               SOURCE(xmt) = NODE(req)
               NUMBER(xmt) = 0
               PROCESS(xmt) = PROC(req)
               JOBNAME(xmt) = CODE(req)

               COMMAND(xmt) = BUFF(req)
               STATUS(xmt) = status
               RESULT(xmt) = 0

               select (COMMAND(xmt))
                  when (BROADCAST)
                  {
                     do i = 1, NAMESIZE
                        TARGET(i, xmt) = BUFF(req + i)

                     BUFF(req + (RCVN(req) + 1) / 2) = EOS
                     call strim(BUFF(req + 1 + NAMESIZE))

                     call ctoc(BUFF(req + 1 + NAMESIZE), MESSAGE(1, xmt), MAXLINE)
                  }

                  when (EXECUTE)
                  {
                     do i = 1, NAMESIZE
                        USERID(i, xmt) = NAME(i, req)

                     BUFF(req + (RCVN(req) + 1) / 2) = EOS
                     call strim(BUFF(req + 1 + NAMESIZE))

                     call ctoc(BUFF(req + 1 + NAMESIZE), CMDLINE(1, xmt), MAXLINE)
                  }

                  when (TERMINATE)
                     ;

                  when (SETTIME)
                     if (Priviledged)
                        if (RCVN(req) == TIMESIZE)
                        {
                           COMMAND(xmt) = SYNCHRONIZE

                           MONTH(xmt) = BUFF(req + 1)
                           DATE(xmt) = BUFF(req + 2)
                           YEAR(xmt) = BUFF(req + 3)
                           HOUR(xmt) = BUFF(req + 4)
                           MINUTE(xmt) = BUFF(req + 5)
                        }
                        else
                           status = WRONGSIZE
                     else
                     {
                        status = NOREQUEST
DB                      call print(STDOUT, "User request command is unknown*n"s)
                     }
            }
            else
            {
               status = NOTFOUND
DB             call print(STDOUT, "User request address is unknown*n"s)
            }
         }
      }
      else
      {
         status = NOREQUEST
DB       call print(STDOUT, "User request command is unknown*n"s)
      }
   else
   {
      status = WRONGSIZE
DB    call print(STDOUT, "User request packet is too small*n"s)
   }

   BUFF(req + 1) = status

   return
   end


   subroutine update

#  update --- scan node lists and process newly complete nodes.

   include RING_COMMON

   logical valid
   longint uniform

   logical flag
   pointer rcv, xmt, val, rsp

DB call print(STDOUT, "Checking reception connections*n"s)

   for (rcv = NEXT(Receive); rcv ~= Receive; rcv = NEXT(rcv))
      if (valid(STAT(rcv)))
      {
         select (TYPE(rcv))
            when (BOGUS)
               call reform(rcv)

            when (VALID)
               call execute(rcv)
      }

DB call print(STDOUT, "Checking validation connections*n"s)

   for (val = NEXT(Validate); val ~= Validate; val = NEXT(val))
      if (valid(STAT(val)) && STAT(val) ~= XS$IP && HOLD(val) == NO)
      {
         TIME(val) = ELAPSED
         HOLD(val) = YES
         DONE(val) = YES

         if (XMTS(val) ~= XS$IP)
         {
            PACKET(val) = REQUEST
            SOURCE(val) = Home_index
            ADDRESS(val) = NODE(val)
            NUMBER(val) = 0
            PROCESS(val) = Home_pid
            JOBNAME(val) = 0
            COMMAND(val) = VALIDATE
            STATUS(val) = INITIATED

            RESULT(val) = ints(uniform(intl(-32768), intl(32767)))
DB          call print(STDOUT, "Validation password is *i*n"s, RESULT(val))

            call x$tran(VCID(val), 0, BUFF(val), BUFFSIZE, XMTS(val))
DB          call print(STDOUT, "Validation password transmitted*n"s)
         }
         else
         {
            HOLD(val) = NO
DB          call print(STDOUT, "Validation password will be retransmitted*n"s)
         }
      }

DB call print(STDOUT, "Checking response connections*n"s)

   for (rsp = NEXT(Response); rsp ~= Response; rsp = NEXT(rsp))
      if (valid(STAT(rsp)))
      {
         if (valid(RCVS(rsp)))
            if (RCVS(rsp) == XS$CMP && HOLD(rsp) == NO)
            {
               TIME(rsp) = ELAPSED
               HOLD(rsp) = YES
               DONE(rsp) = YES

               flag = RCVL(rsp) == 0 & RCVN(rsp) == BUFFSIZE

               if (flag)
                  flag =  SOURCE(rsp) == NODE(rsp) _
                       & ADDRESS(rsp) == Home_index _
                       &  NUMBER(rsp) == 0 _
                       & COMMAND(rsp) == VALIDATE

               if (flag)
               {
DB                call print(STDOUT, "Validation password received*n"s)

                  SEARCH(Transmit, TYPE, BOGUS, xmt, DUMMY)

                  if (xmt ~= Transmit && valid(STAT(xmt)))
                     flag = NODE(rsp) == NODE(xmt)
                  else
                     flag = FALSE

                  if (~flag)
                  {
DB                   call print(STDOUT, "Circuit is not being validated*n"s)

                     SEARCH(Transmit, TYPE, VALID, xmt, DUMMY)

                     if (xmt ~= Transmit && valid(STAT(xmt)))
                        flag = TRUE
                     else
                        flag = FALSE
                  }

                  if (flag && XMTS(xmt) ~= XS$IP)
                  {
                     TIME(xmt) = ELAPSED

                     PACKET(xmt) = RESPONSE
                     SOURCE(xmt) = Home_index
                     ADDRESS(xmt) = NODE(rsp)
                     NUMBER(xmt) = 1
                     PROCESS(xmt) = Home_pid
                     JOBNAME(xmt) = 0
                     COMMAND(xmt) = VALIDATE
                     STATUS(xmt) = INITIATED

                     RESULT(xmt) = RESULT(rsp)

                     call x$tran(VCID(xmt), 0, BUFF(xmt), BUFFSIZE, XMTS(xmt))
DB                   call print(STDOUT, "Response password transmitted*n"s)

                     if (TYPE(xmt) == BOGUS)
                     {
                        TYPE(xmt) = VALID
                        call print(STDOUT, "Validated transmission to *,#h*n"s,
                           Name_size(Index_ring(NODE(xmt))),
                           Node_name(1, Index_ring(NODE(xmt))))
                     }
                  }
                  else
                  {
                     HOLD(rsp) = NO
DB                   call print(STDOUT, "Response password will be retransmitted*n"s)
                  }
               }
               else
               {
                  select
                     when (RCVL(rsp) ~= 0)
                        call print(STDOUT, "Receive level is not 0*n"s)

                     when (RCVN(rsp) ~= BUFFSIZE)
                        call print(STDOUT, "Request size is not BUFFSIZE*n"s)

                     when (SOURCE(rsp) ~= NODE(rsp))
                        call print(STDOUT, "Request source is not correct*n"s)

                     when (ADDRESS(rsp) ~= Home_index)
                        call print(STDOUT, "Request is not correctly addressed*n"s)

                     when (NUMBER(rsp) ~= 0)
                        call print(STDOUT, "Request transmission count is not 0*n"s)

                     when (COMMAND(rsp) ~= VALIDATE)
                        call print(STDOUT, "Request is not a validation request*n"s)
               }
            }
            else
               flag = TRUE
         else
         {
DB          call print(STDOUT, "Invalid receive status*n"s)
            flag = FALSE
         }

         if (~flag)
         {
            call terminate(rsp)
DB          call print(STDOUT, "Invalid response circuit cleared*n"s)

            SEARCH(Transmit, TYPE, BOGUS, xmt, DUMMY)

            if (xmt ~= Transmit && NODE(xmt) == NODE(rsp) && valid(STAT(xmt)))
            {
               call terminate(xmt)
DB             call print(STDOUT, "Transmission circuit cleared*n"s)
            }
         }
      }

   return
   end


   logical function valid(status)

#  valid --- return .TRUE. if status indicates VC is valid.

   integer status(2)

   include RING_COMMON

   integer code, whyc, diag
   logical flag

   code = status(1)
   whyc = and(status(2), 8r77400)
   diag = and(status(2), 8r00377)

   if (code == XS$CMP || code == XS$IP  || code == XS$RST || _
       code == XS$IDL || code == XS$NOP || code == XS$QUE)
      flag = TRUE
   else
      flag = FALSE

   select (code)
      when (XS$NET)
         call print(STDOUT, "Status is XS$NET*n"s)

DB    when (XS$CMP)
DB       call print(STDOUT, "Status is XS$CMP*n"s)

DB    when (XS$IP)
DB       call print(STDOUT, "Status is XS$IP*n"s)

      when (XS$BVC)
         call print(STDOUT, "Status is XS$BVC*n"s)

      when (XS$BPM)
         call print(STDOUT, "Status is XS$BPM*n"s)

DB    when (XS$CLR)
DB    {
DB       call print(STDOUT, "Status is XS$CLR, "s)
DB
DB       select (whyc)
DB          when (CC$CLR)
DB          {
DB             call print(STDOUT, "CC$CLR, "s)
DB
DB             select (diag)
DB                when (CD$PNA)
DB                   call print(STDOUT, "CD$PNA*n"s)
DB
DB                when (CD$SNU)
DB                   call print(STDOUT, "CD$SNU*n"s)
DB
DB                when (CD$BSY)
DB                   call print(STDOUT, "CD$BSY*n"s)
DB
DB                when (CD$NRU)
DB                   call print(STDOUT, "CD$NRU*n"s)
DB
DB                when (CD$IAD)
DB                   call print(STDOUT, "CD$IAD*n"s)
DB
DB                when (CD$DWN)
DB                   call print(STDOUT, "CD$DWN*n"s)
DB
DB                when (CD$LPE)
DB                   call print(STDOUT, "CD$LPE*n"s)
DB             else
DB                call print(STDOUT, "unknown (*,8i)*n"s, diag)
DB          }
DB
DB          when (CC$BSY)
DB             call print(STDOUT, "CC$BSY*n"s)
DB
DB          when (CC$DWN)
DB             call print(STDOUT, "CC$DWN*n"s)
DB
DB          when (CC$RPE)
DB             call print(STDOUT, "CC$RPE*n"s)
DB
DB          when (CC$RRC)
DB             call print(STDOUT, "CC$RRC*n"s)
DB
DB          when (CC$BAD)
DB             call print(STDOUT, "CC$BAD*n"s)
DB
DB          when (CC$BAR)
DB             call print(STDOUT, "CC$BAR*n"s)
DB
DB          when (CC$LPE)
DB             call print(STDOUT, "CC$LPE*n"s)
DB
DB          when (CC$NET)
DB             call print(STDOUT, "CC$NET*n"s)
DB
DB          when (CC$NOB)
DB             call print(STDOUT, "CC$NOB*n"s)
DB       else
DB          call print(STDOUT, "unknown (*,8i)*n"s, whyc)
DB    }

      when (XS$RST)
         call print(STDOUT, "Status is XS$RST*n"s)

DB    when (XS$IDL)
DB       call print(STDOUT, "Status is XS$IDL*n"s)

      when (XS$UNK)
         call print(STDOUT, "Status is XS$UNK*n"s)

      when (XS$MEM)
         call print(STDOUT, "Status is XS$MEM*n"s)

DB    when (XS$NOP)
DB       call print(STDOUT, "Status is XS$NOP*n"s)

      when (XS$ILL)
         call print(STDOUT, "Status is XS$ILL*n"s)

DB    when (XS$DWN)
DB       call print(STDOUT, "Status is XS$DWN*n"s)

      when (XS$MAX)
         call print(STDOUT, "Status is XS$MAX*n"s)

      when (XS$QUE)
         call print(STDOUT, "Status is XS$QUE*n"s)
DB else
DB    call print(STDOUT, "Unknown status (*i)*n"s, code)

   return (flag)
   end


   subroutine verify(node)

#  verify --- determine if RING connection is valid.

   pointer node

   include RING_COMMON

   logical valid

   pointer rcv, val

   SEARCH(Receive, NODE, NODE(node), rcv, 0)

   if (rcv == Receive || ~valid(STAT(rcv)))
   {
      call insert(Receive, node)

      call x$acpt(VCID(node), STAT(node))
DB    call print(STDOUT, "Ring connection accepted*n"s)

      call x$rcv(VCID(node), BUFF(node), BUFFSIZE, RCVS(node))
DB    call print(STDOUT, "Awaiting reception of password*n"s)

      SEARCH(Validate, NODE, NODE(node), val, 0)

      if (val ~= Validate && valid(STAT(val)))
      {
         call terminate(val)
DB       call print(STDOUT, "Invalid validation circuit cleared*n"s)
      }

      call allocate(val)
      TYPE(val) = VALID
      NODE(val) = NODE(node)
      call insert(Validate, val)

      call x$conn(VCID(val), CHCK, Node_name(1, Index_ring(NODE(val))),
                           Name_size(Index_ring(NODE(val))), STAT(val))
DB    call print(STDOUT, "Validation connection made to *,#h*n"s,
DB       Name_size(Index_ring(NODE(val))), Node_name(1, Index_ring(NODE(val))))
   }
   else
   {
      call terminate(node)
DB    call print(STDOUT, "Duplicate receive circuit cleared*n"s)

      call dispose(node)
   }

   return
   end


   logical function wizard(user)

#  wizard --- determine if user is validated for special requests.

   integer user(ARB)

   include RING_COMMON

   integer ptoc, equal

   character line(MAXLINE)

   integer i
   logical match

   string_table guru_index, guru_table, _
      /  "SYSTEM" _
      /  "TERREL" _
      /  "HUNT" _
      /  "JEFF" _
      /  "ROY" _
      /  "WAN"

   call ptoc(user, " "c, line, 2 * NAMESIZE + 1)

   i = 1
   repeat
   {
      i += 1

      match = equal(line, guru_table(guru_index(i))) == YES
   }
   until (i > guru_index(1) || match)

   return (match)
   end
