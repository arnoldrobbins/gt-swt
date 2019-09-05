# mul --- multi-user star trek for the Prime 400

   include "mul_com.r.i"

   character nm (MAXLINE)
   integer save_lword
   integer enter_player, duplx$
   integer dummy
   longint read_clock
   longint tm
   shortcall mkonu$
   external logout


   call rnd (ints (read_clock (tm)))   # initialize random numbers
   call get_ekchars (echar, kchar)           # get erase and kill chars
   call do_args (phantom_flag)

   if (phantom_flag == YES) {
      ph_controlled = NO
      ph_check = NO
      phantom_state = WAIT
      call get_phantom_name (nm)
      }
   else {
      call vtputl("Welcome to Prime Multrek"s, 3, 11)
      call get_playing_name (nm)
      }

   call break$ (DISABLE)                  # disable the break key
   call mkonu$("LOGOUT$"v, loc(logout))   # prevent bad things
   if (enter_player (nm) == ERR) {
      call break$(ENABLE)
      stop
      }

   save_lword = duplx$ (READ_LWORD)    # save terminal config word
   call duplx$ (HALF_NOLF)             # half duplex, no line-feed

   cursor = 0
   call build_screen_template
   call play_multrek

   call good_bye

   call clear_input_buffer
   call duplx$ (save_lword)
   call break$ (ENABLE)    # re-enable the break key

   stop
   end


# allocate_msg_queue --- allocate message queue header for new player

   integer function allocate_msg_queue (dummy)
   integer dummy

   include "mul_com.r.i"

   pointer p
   pointer dsget

   allocate_msg_queue = ERR

   p = dsget (NODE_SIZE)
   if (p == LAMBDA)
      return

   Head_ptr (p) = LAMBDA
   Tail_ptr (p) = LAMBDA
   Msg_queue (player) = p

   allocate_msg_queue = OK

   return
   end


# clear_input_buffer --- throw away typed-ahead characters

   subroutine clear_input_buffer

   integer code

   call tty$rs (CLEAR_INPUT, code)

   return
   end


# enter_player --- initialize a new entry into the galaxy

   integer function enter_player (nm)
   character nm (ARB)

   include "mul_com.r.i"

   file_des fd, pfd
   integer junk, code
   character msg (MAXLINE)
   string lockfile "=games=/mulnames"

   integer find_slot, uniform, allocate_msg_queue
   file_des open, mapfd

   fd = open(lockfile, READ)
   if (fd == ERR) {
      call remark("Can't open database lock file. Please notify a guru"p)
      call close (fd)
      return(ERR)
      }
   pfd = mapfd(fd)
   if (pfd == ERR) {
      call remark("Can't open database lock file. Please notify a guru"p)
      call close(fd)
      return(ERR)
      }

   call sem$ou(pfd, 1, dblock, -1, code)
   if (code ~= 0) {
      call remark("Can't allocate database lock. Please notify a guru"p)
      call close(fd)
      return(ERR)
      }

   call close(fd)

   call lock_db         # lock the data base
   if (find_slot (player) == EOF) {
      enter_player = ERR
      call remark ("The galaxy is full. Please try again later."p)
      }
   elif (allocate_msg_queue (junk) == ERR) {
      enter_player = ERR
      call remark ("Can't allocate msg queue. Please notify a guru."p)
      }
   else {
      enter_player = OK
      call comment(msg)
      MY_BEARING  = uniform (0, 359)
      MY_XPOS     = uniform (0, GALAXY_SIZE)
      MY_YPOS     = uniform (0, GALAXY_SIZE)
      MY_SHIELDS  = INITIAL_SHIELDS
      MY_RESERVE  = INITIAL_RESERVE
      MY_RESEARCH = INITIAL_RESEARCH
      MY_PHASERS  = INITIAL_PHASERS
      MY_TORPEDOS = INITIAL_TORPEDOS
      MY_WARP     = INITIAL_WARP
      MY_LOCK     = 0
      MY_KILLS    = 0
      call ctoc(nm, MY_NAME, MAX_NAME)
      }

   call unlock_db

   return
   end


# exit_game --- clean up data base for retiring player

   subroutine exit_game

   include "mul_com.r.i"

   integer i
   pointer msgp
   pointer recv_msg

   while (recv_msg (msgp) ~= LAMBDA)   # clean out message queue
      if (Ref_count (msgp) == 0)
         call dsfree (msgp)

   call dsfree (MY_MSG_QUEUE)

   MY_XPOS = 0
   MY_YPOS = 0
   MY_BEARING = 0
   MY_WARP = 0
   MY_PHASERS = 0
   MY_TORPEDOS = 0
   MY_RESERVE = 0
   MY_RESEARCH = 0
   MY_SHIELDS = -1
   MY_KILLS = 0
   MY_LOCK  = 0
   MY_MSG_QUEUE = 0

   do i = 1, MAX_NAME
      Name (i, player) = EOS

   return
   end


# find_slot --- look for a vacant slot in the player database

   integer function find_slot (slot)
   integer slot

   include "mul_com.r.i"

   integer fence, i
   integer uniform

   slot = EOF
   find_slot = slot

   fence = uniform (1, MAX_PLAYERS)

   for (i = fence; Shields (i) >= 0; ) {
      i = mod (i, MAX_PLAYERS) + 1
      if (i == fence)
         return
      }

   slot = i
   find_slot = slot

   return
   end


# get_ekchars --- get player's erase and kill characters from Primos

   subroutine get_ekchars (echar, kchar)
   character echar, kchar

   integer code

   call erkl$$ (READ_EK, echar, kchar, code)

   if (code ~= 0) {
      echar = BS
      kchar = DEL
      }

   return
   end


# get_phantom_name --- choose a name for a phantom

   subroutine get_phantom_name (name)
   character name (ARB)

   integer fd, i, line
   integer open, getlin, uniform
   character junk (MAXLINE)
   string name_list "=games=/mulnames"

   fd = open (name_list, READ)
   if (fd ~= ERR) {
      for (i = 0; getlin (junk, fd) ~= EOF; i = i + 1)   # size file
         ;
      if (i > 0) {
         line = uniform (1, i)   # pick a line number at random
         call rewind (fd)
         for (i = 1; i < line; i = i + 1)
            call getlin (junk, fd)
         i = getlin (name, fd)
         if (i ~= EOF & i > 0) {
            name (i) = EOS
            call close (fd)
            return
            }
         }
      call close (fd)
      }

   call ctoc("Bozo"s, name, MAXLINE)

   return
   end


# get_playing_name --- ask the player for his name

   subroutine get_playing_name (name)
   character name (ARB)

   integer i

   call vtupd(YES)
   call vtputl("Enter playing name: "s, 6, 1)
   call vtenb(6, 21, MAX_NAME)
   call vtread(6, 21, NO)
   call vtenb(6, 21, 0)

   call vtgetl(name, 6, 21, MAX_NAME)
   for (i = 1; name (i) ~= EOS; i = i + 1)
      if (name (i) < ' 'c)
         name (i) = ' 'c
   name (MAX_NAME) = EOS
   for (i = 1; name (i) ~= EOS; i = i + 1)
      if (name (i) > ' 'c)
         return
   call get_phantom_name (name)  # select a name for him
   call vtprt(7, 1, "You are hereby dubbed *s"s, name)
   call vtupd(NO)
   call sleep$(intl(2000))

   return
   end


# good_bye --- wait a moment, then clear screen and say goodbye

   subroutine good_bye
   integer code

   include "mul_com.r.i"

   call sem$cl(dblock, code)

   call sleep$(intl(5000))
   call vtclr(1, 1, 24, 80)
   call vtputl("Thanks for playing Multrek"s, 3, 11)
   call vtupd(YES)
   call vtstop

   return
   end
