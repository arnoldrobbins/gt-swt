# minit --- initialize mul's shared data area

   include "mul_com.r.i"

   integer code
   integer i,j
   
   # initialize common areas
   
      do i = 1, MAX_PLAYERS; {
         Shields (i) = -1         # set all users to gone
         Phasers (i) = 0
         Torpedos (i) = 0
         Reserve (i) = 0
         Research (i) = 0
         Warp (i) = 0
         Bearing (i) = 0
         Xpos (i) = 0
         Ypos (i) = 0
         Kills (i) = 0
         Locked (i) = 0
         Msg_queue (i) = 0
         Name (1, i) = EOS
         }

#  initialize the dynamic storage
   call dsinit(MEMSIZE)
   
   stop
   end


# dsinit --- initialize dynamic storage space to w words

   subroutine dsinit (w)
   integer w

   include "mul_com.r.i"

   pointer t

   if (w < 2 * DS_OHEAD + 2)
      call error ("in dsinit: unreasonably small memory size.")

   # set up avail list:
   t = DS_AVAIL
   Mem (t + DS_SIZE) = 0
   Mem (t + DS_LINK) = DS_AVAIL + DS_OHEAD

   # set up first block of space:
   t = DS_AVAIL + DS_OHEAD
   Mem (t + DS_SIZE) = w - DS_OHEAD - 1     # -1 for MEMEND
   Mem (t + DS_LINK) = LAMBDA

   # record end of memory:
   Mem (DS_MEMEND) = w

   return
   end
