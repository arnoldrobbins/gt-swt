#  mstat --- mul galaxy status reporting system

define (SR,3)           # starting display row

   include "mul_com.r.i"

   integer i, flag
   character term(MAXTERMTYPE)

   bool tquit$
   integer vtinit

   if (vtinit(term) == ERR) {
      call print(ERROUT, "terminal type '*s' is not supported*n"s, term)
      call seterr(1000)
      stop
      }

   call vtputl("-- Prime Multrek Galaxy Status Report --"s, SR, 17)
   call vtputl("Rsc  Res   Sh   Ph   Tp   Wp   Br"s, SR + 2, 1)
   call vtputl("(X,Y)    Msg Q  P:Kl:  Player Name"s, SR + 2, 38)
   call vtputl("===  ===  ===  ===  ===  ===  ==="s, SR + 3, 1)
   call vtputl("=========  =====  =:==: ===================="s, SR + 3, 36)
   call vtupd(YES)

   call break$(DISABLE)
   while (~ tquit$(flag)) {
      do i = 1, MAX_PLAYERS; {
         call vtprt(SR + 3 + i, 1, "*3i*5i*5i*5i*5i*5i*5i*6i,*4i"s,
            Research(i), Reserve(i), Shields(i), Phasers(i), Torpedos(i),
            Warp(i), Bearing(i), Xpos(i), Ypos(i))
         call vtprt(SR + 3 + i, 47, "*5i  *c:*2i"s, Msg_queue(i),
            i + 'a'c - 1, Kills(i))
         if (Shields(i) >= 0)
            call vtprt(SR + 3 + i, 58, ": *s"s, Name(1, i))
         else
            call vtprt(SR + 3 + i, 58, ""s)
         call vtpad(80)
      }

      call vtupd(NO)
      call vtmove(1, 1)
      call sleep$(CYCLE_PERIOD)
      }

   call break$(ENABLE)
   call vtstop

   stop
   end
