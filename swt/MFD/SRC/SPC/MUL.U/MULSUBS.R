# add_to_research --- transfer from reserve to research

   subroutine add_to_research

   include "mul_com.r.i"

   integer addition
   integer ctoi

   addition = ctoi (command, cursor)
   if (addition == 0)
      addition = MY_RESERVE
   addition = min (addition, MAX_RESEARCH - MY_RESEARCH)

   if (addition <= 0 )
      return
   elif (addition > MY_RESERVE )
      call comment ("Not enough reserve"s)
   else {
      MY_RESEARCH = MY_RESEARCH + addition
      MY_RESERVE = MY_RESERVE - addition
      }

   return
   end


# add_to_shields --- transfer from reserve to shields

   subroutine add_to_shields

   include "mul_com.r.i"

   integer addition
   integer ctoi

   addition = ctoi (command, cursor)
   if (addition == 0)
      addition = MY_RESERVE
   addition = min (addition, MAX_SHIELDS - MY_SHIELDS)

   if (addition <= 0 )
      return
   elif (addition > MY_RESERVE )
      call comment ("Not enough reserve"s)
   else {
      MY_SHIELDS = MY_SHIELDS + addition
      MY_RESERVE = MY_RESERVE - addition
      }

   return
   end


# angle_diff --- return positive difference of two angles
   integer function angle_diff (a1, a2)
   integer a1, a2

   integer b

   b = abs (a1 - a2)
   if (b > 180)
      angle_diff = 360 - b
   else
      angle_diff = b

   return
   end


# broadcast_message --- send a message to all players

   pointer function broadcast_message (msg)
   character msg (ARB)

   include "mul_com.r.i"

   integer i
   integer length
   pointer p
   pointer dsget

   p = dsget (length (msg) + 2)
   broadcast_message = p
   if (p == LAMBDA)
      return

   Ref_count (p) = 0
   call scopy (msg, 1, Msg_text (p), 1)
   for (i = 1; i <= MAX_PLAYERS; i = i + 1)
      if (Shields (i) >= 0)
         call send_msg (p, i)

   return
   end


# buy_phasers --- convert reserve into phasers

   subroutine buy_phasers

   include "mul_com.r.i"

   integer addition
   integer ctoi

   addition = ctoi (command, cursor)
   if (addition == 0)
      addition = MY_RESERVE
   addition = min (addition, MAX_PHASERS - MY_PHASERS)

   if (addition <= 0 )
      return
   elif (addition > MY_RESERVE )
      call comment ("Not enough reserve"s)
   else {
      MY_PHASERS = MY_PHASERS + addition
      MY_RESERVE = MY_RESERVE - addition
      }

   return
   end


# buy_torpedos --- convert reserve into torpedos

   subroutine buy_torpedos

   include "mul_com.r.i"

   integer addition, cost
   integer ctoi

   addition = ctoi (command, cursor)
   if (addition == 0)
      addition = MY_RESERVE / 10
   addition = min (addition, MAX_TORPEDOS - MY_TORPEDOS)
   cost = addition * 10    # each torp costs 10 units of energy

   if (addition <= 0 )
      return
   elif (cost > MY_RESERVE)
      call comment ("Not enough reserve"s)
   else {
      MY_TORPEDOS = MY_TORPEDOS + addition
      MY_RESERVE = MY_RESERVE - cost
      }

   return
   end


# change_warp --- change warp factor

   subroutine change_warp

   include "mul_com.r.i"

   integer wp
   integer ctoi

   wp = ctoi (command, cursor)

   if (wp < 0)
      return
   elif (wp > MAX_WARP)
      call comment ("Illegal warp"s)
   else
      MY_WARP = wp

   return
   end


# cosine --- take the cosine of an angle expressed in degrees

   floating function cosine (angle)
   integer angle

   floating f_angle

   f_angle = angle * RADIANS_PER_DEGREE
   cosine = dcos (f_angle)

   return
   end


# cycle --- move player, check for a command, update screen

   integer function cycle (command_ready)
   integer command_ready

   include "mul_com.r.i"

   integer energy_spent, energy_earned, distance, delta_x, delta_y
   integer process_command
   floating delta_time
   floating sine, cosine


   delta_time = CYCLE_PERIOD / 1000

   energy_spent = MY_WARP ** WARP_POWER * delta_time _
                     * ENERGY_PER_WARP_POWER_SECOND
   energy_earned = MY_RESEARCH * delta_time _
                     * ENERGY_PER_RESEARCH_SECOND
   if (energy_spent <= MY_RESERVE + energy_earned) {
      distance = MY_WARP ** WARP_POWER * delta_time _
                     * DISTANCE_PER_WARP_POWER_SECOND
      delta_x = distance * cosine (MY_BEARING)
      delta_y = distance * sine (MY_BEARING)
      MY_XPOS = MY_XPOS + delta_x
      MY_YPOS = MY_YPOS + delta_y
      if ((MY_XPOS < 0 | MY_XPOS > GALAXY_SIZE)
      && (MY_YPOS < 0 | MY_YPOS > GALAXY_SIZE)) {
         call comment ("**** Hyper-hyper warp ****"s)
         energy_spent = energy_spent + ENERGY_PER_HYPER_WARP * 2
         }
      elif ((MY_XPOS < 0 | MY_XPOS > GALAXY_SIZE)
      || (MY_YPOS < 0 | MY_YPOS > GALAXY_SIZE)) {
         call comment ("**** Hyper warp ****"s)
         energy_spent = energy_spent + ENERGY_PER_HYPER_WARP
         }
      MY_XPOS = mod (MY_XPOS + GALAXY_SIZE, GALAXY_SIZE)
      MY_YPOS = mod (MY_YPOS + GALAXY_SIZE, GALAXY_SIZE)
      MY_RESERVE = MY_RESERVE - energy_spent
      }

   MY_RESERVE = min (MY_RESERVE + energy_earned, MAX_RESERVE)
   if (MY_RESERVE < 0) {   # make up for difference out of shields
      MY_SHIELDS = max (MY_SHIELDS + MY_RESERVE, 0)
      MY_RESERVE = 0
      }

   if (MY_SHIELDS >= 0)
      cycle = process_command (command_ready)
   else {
      cycle = EOF
      call comment ("Sorry, but you have been destroyed!"s)
      }

   call update_screen

   return
   end


# decode_command --- decode the player's command

   integer function decode_command (command, cursor)
   character command (ARB)
   integer cursor

   integer equal
   character cmd (3)
   character mapdn, type


   SKIPBL(command, cursor)

   cmd (1) = command(cursor)
   if (command(cursor) ~= EOS)
      cmd (2) = command(cursor + 1)

   cmd (3) = EOS

   while (type (command (cursor)) == LETTER)
      cursor = cursor + 1

   if (equal (cmd, EOS) == YES)          # null command
      decode_command = NL_CMD
   elif (equal (cmd, "rs"s) == YES)      # rs
      decode_command = RS_CMD
   elif (equal (cmd, "sh"s) == YES)      # sh
      decode_command = SH_CMD
   elif (equal (cmd, "ph"s) == YES)      # ph
      decode_command = PH_CMD
   elif (equal (cmd, "pt"s) == YES)      # pt
      decode_command = PT_CMD
   elif (equal (cmd, "wp"s) == YES)      # wp
      decode_command = WP_CMD
   elif (equal (cmd, "cl"s) == YES)      # cl
      decode_command = CL_CMD
   elif (equal (cmd, "ex"s) == YES)      # ex
      decode_command = EX_CMD
   elif (equal (cmd, "fp"s) == YES)      # fp
      decode_command = FP_CMD
   elif (equal (cmd, "ft"s) == YES)      # ft
      decode_command = FT_CMD
   elif (equal (cmd, "ms"s) == YES)      # ms
      decode_command = MS_CMD
   elif (equal (cmd, "pn"s) == YES)      # pn
      decode_command = PN_CMD
   elif (equal (cmd, "tu"s) == YES)      # tu
      decode_command = TU_CMD
   elif (equal (cmd, "lk"s) == YES)      # lk
      decode_command = LK_CMD
   else
      decode_command = NO_CMD

   return
   end


# dequeue --- remove an entry from head of queue

   pointer function dequeue (queue)
   pointer queue

   include "mul_com.r.i"

   dequeue = Head_ptr (queue)
   if (dequeue ~= LAMBDA)
      Head_ptr (queue) = Link (dequeue)
   if (Head_ptr (queue) == LAMBDA)
      Tail_ptr (queue) = LAMBDA

   return
   end


# do_args --- process arguments for MulTrek

   subroutine do_args (phantom_flag)
   integer phantom_flag

   character arg (MAXARG), term(MAXTERMTYPE)
   integer i
   integer getarg, equal
   integer vtinit

   phantom_flag = NO
   for (i = 1; getarg (i, arg, MAXARG) ~= EOF; i = i + 1) {
      call mapstr (arg, LOWER)
      if (arg (1) == '-'c & arg (2) == EOS)
         phantom_flag = YES
      }

   if (vtinit(term) == ERR) {
      call print(ERROUT, "term type '*s' not supported*n"s, term)
      call seterr(1000)
      stop
      }

   return
   end


# done --- see if we are finished with the game

   integer function done(command_ready)
   integer command_ready

   bool flag
   integer code

   include "mul_com.r.i"

   call tquit$(flag)
   if (flag && phantom_flag == YES)
      return(YES)

   if (flag) {
      call clear_input_buffer
      command_ready = NO
      cursor = 0
      }

   return(NO)
   end


# dsfree --- return a block of storage to the available space list

   subroutine dsfree (block)
   pointer block

   include "mul_com.r.i"

   pointer p0, p, q
   integer n
   character con (10)

   p0 = block - DS_OHEAD
   n = Mem (p0 + DS_SIZE)
   q = DS_AVAIL

   repeat {
      p = Mem (q + DS_LINK)
      if (p == LAMBDA || p > p0)
         break
      q = p
      }

   if (q + Mem (q + DS_SIZE) > p0)     # block is unallocated
      return                           # do not attempt to free the block

   if (p0 + n == p & p ~= LAMBDA) {
      n = n + Mem (p + DS_SIZE)
      Mem (p0 + DS_LINK) = Mem (p + DS_LINK)
      }
   else
      Mem (p0 + DS_LINK) = p

   if (q + Mem (q + DS_SIZE) == p0) {
      Mem (q + DS_SIZE) = Mem (q + DS_SIZE) + n
      Mem (q + DS_LINK) = Mem (p0 + DS_LINK)
      }
   else {
      Mem (q + DS_LINK) = p0
      Mem (p0 + DS_SIZE) = n
      }

   return
   end


# dsget --- get pointer to block of at least w available words

   pointer function dsget (w)
   integer w

   include "mul_com.r.i"

   pointer p, q, l
   integer n, k
   character c (10)

   n = w + DS_OHEAD
   q = DS_AVAIL

   repeat {
      p = Mem (q + DS_LINK)
      if (p == LAMBDA)
         return(LAMBDA)
      if (Mem (p + DS_SIZE) >= n)
         break
      q = p
      }

   k = Mem (p + DS_SIZE) - n
   if (k >= DS_CLOSE) {
      Mem (p + DS_SIZE) = k
      l = p + k
      Mem (l + DS_SIZE) = n
      }
   else {
      Mem (q + DS_LINK) = Mem (p + DS_LINK)
      l = p
      }

   return (l + DS_OHEAD)

   end


# enqueue --- add entry to queue

   subroutine enqueue (entry, queue)
   pointer entry, queue

   include "mul_com.r.i"

   pointer p

   if (Tail_ptr (queue) == LAMBDA) {
      if (Head_ptr (queue) ~= LAMBDA)
         call error ("Inconsistency in message queue header"s)
      Tail_ptr (queue) = entry
      Head_ptr (queue) = entry
      }
   else {
      p = Tail_ptr (queue)
      if (Link (p) ~= LAMBDA)
         call error ("Inconsistency in message queue links"s)
      Link (p) = entry
      Tail_ptr (queue) = entry
      Link (entry) = LAMBDA
      }

   return
   end


# fire --- handle the firing of weapons

   subroutine fire (target, damage)
   integer target, damage

   include "mul_com.r.i"

   Shields (target) -= damage
   if (Shields (target) < 0) {
      call comment ("#### You got 'em with that shot! ####"s)
      MY_KILLS = MY_KILLS + 1
      call hit_msg (player, target, damage, DESTROYED)
      }
   else
      call hit_msg (player, target, damage, DAMAGED)

   return
   end


# fire_phasers --- fire some phasers

   subroutine fire_phasers

   include "mul_com.r.i"

   integer nph, target, range, angle, damage
   integer ctoi, get_range, get_angle, get_player, angle_diff

   nph = ctoi (command, cursor)
   target = get_player (command, cursor)
   range = get_range (player, target)
   angle = angle_diff (MY_BEARING, get_angle (player, target))

   if (nph < 1)
      return
   elif (nph > MAX_PHASER_DOSAGE)
      call comment ("can't fire that many at one time"s)
   elif (nph > MY_PHASERS)
      call comment ("you don't have that many"s)
   elif (target == player)
      call comment ("you can't shoot yourself"s)
   elif ((target < 1 | target > MAX_PLAYERS)
      || (Shields (target) < 0))
         call comment ("player not in galaxy"s)
   elif (range > MAX_PHASER_RANGE)
      call comment ("player is out of range"s)
   elif (angle > MAX_PHASER_ANGLE)
      call comment ("you're not facing him"s)
   else {
      damage = float (nph) * float (MAX_PHASER_RANGE - range) * _
                     float (MAX_PHASER_ANGLE - angle) * _
                     STROMS_PER_PHASER_DISTANCE_DEGREE + 0.5
      call fire (target, damage)
      MY_PHASERS = MY_PHASERS - nph
      }

   return
   end


# fire_torps --- fire some torpedos

   subroutine fire_torps

   include "mul_com.r.i"

   integer npt, target, range, damage
   integer ctoi, get_range, get_player

   npt = ctoi (command, cursor)
   target = get_player (command, cursor)
   range = get_range (player, target)

   if (npt < 1)
      return
   elif (npt > MAX_TORP_DOSAGE)
      call comment ("can't fire that many at one time"s)
   elif (npt > MY_TORPEDOS)
      call comment ("you don't have that many"s)
   elif (target == player)
      call comment ("you can't shoot yourself!"s)
   elif ((target < 1 | target > MAX_PLAYERS)
      || (Shields (target) < 0))
         call comment ("player not in galaxy"s)
   elif (range > MAX_TORP_RANGE)
      call comment ("player is out of range"s)
   else {
      damage = float (npt) * float (MAX_TORP_RANGE - range) * _
                              STROMS_PER_TORP_DISTANCE + 0.5
      call fire (target, damage)
      MY_TORPEDOS = MY_TORPEDOS - npt
      }

   return
   end


# get_angle --- compute b's angle with respect to a

   integer function get_angle (a, b)
   integer a, b

   include "mul_com.r.i"

   floating p1, p2

   p1 = Ypos (b) - Ypos (a)
   p2 = Xpos (b) - Xpos (a)
   if (p1 == 0 & p2 == 0) {   # on top of each other
      get_angle = 0
      return
      }

   get_angle = datan2 (p1, p2) / RADIANS_PER_DEGREE + 0.5

   if (get_angle < 0)
      get_angle = get_angle + 360

   return
   end


# get_player --- grab the player number from the command line

   integer function get_player (cmd, i)
   character cmd (ARB)
   integer i

   include "mul_com.r.i"

   SKIPBL (cmd, i)

   if (cmd (i) >= 'a'c && cmd (i) <= 'a'c + MAX_PLAYERS - 1) {
      get_player = cmd (i) - 'a'c + 1
      i += 1
      }
   elif (cmd (i) == EOS)
      get_player = MY_LOCK
   else
      get_player = 0

   return
   end


# get_range --- compute the distance between two players

   integer function get_range (a, b)
   integer a, b

   real x

   include "mul_com.r.i"

   x = intl (Xpos (b) - Xpos (a)) ** 2 + _
            intl (Ypos (b) - Ypos (a)) ** 2
   get_range = sqrt (x)

   return
   end


# get_string --- grab a string off the command line

   integer function get_string (str, command, cursor)
   character str (ARB), command (ARB)
   integer cursor

   integer i

   SKIPBL (command, cursor)

   for (i = 1; command (cursor) ~= EOS; i = i + 1) {
      str (i) = command (cursor)
      cursor = cursor + 1
      }

   str (i) = EOS
   get_string = i - 1

   return
   end


# hit_msg --- let everyone know that someone has been hit

   subroutine hit_msg (aggressor, victim, damage, victims_state)
   integer aggressor, victim, damage, victims_state

   integer l
   integer ctoc, itoc
   pointer msgp
   pointer broadcast_message
   character msg (50)

   include "mul_com.r.i"

   if (victims_state == DAMAGED) {  # victim is only damaged
      l = ctoc(")))) x hit y with "s, msg, 50) + 1
      msg (12) = victim + 'a'c - 1
      }
   else {                           # victim is destroyed!
      l = ctoc("#### x DESTROYED y with "s, msg, 50) + 1
      msg (18) = victim + 'a'c - 1
      }

   msg (6) = aggressor + 'a'c - 1
   l = l + itoc (damage, msg (l), 5)

   if (victims_state == DAMAGED)
      call ctoc(" stroms (((("s, msg(l), 50 - l)
   else
      call ctoc(" stroms ####"s, msg(l), 50 - l)

   msgp = broadcast_message (msg)

   if (victims_state == DESTROYED)  # make sure the stiff gets the msg
      call send_msg (msgp, victim)

   return
   end


# input_command --- check for a command from the user

   subroutine input_command (command_ready)
   integer command_ready

   character c

   include "mul_com.r.i"

   logical flag
   logical chkinp

   if (phantom_flag == YES) {    # we're a phantom
      call input_ph_command
      command_ready = YES
      return
      }

   while (chkinp (flag) & command_ready == NO) {
      call c1in (c)
      if (c == echar) {
         if (cursor > 0)
            cursor = cursor - 1
         }
      elif (c == kchar)
         cursor = 0
      elif (c == NEWLINE)
         command_ready = YES
      elif (c == ETX & cursor == 0) {
         command (1) = 'e'c
         command (2) = 'x'c
         command_ready = YES
         cursor = 2
         }
      elif (c < ' 'c | c > DEL)
         ;
      elif (cursor < MAXLINE - 1) {
         cursor = cursor + 1
         command (cursor) = c
         }
      }

   command (cursor + 1) = EOS

   return
   end


# lock_db --- lock the common data area using system semaphores

   subroutine lock_db

   include "mul_com.r.i"
   
   integer code
   
   call sem$wt (dblock, code)
   
   if (code ~= 0) 
      call comment ("semaphore wait request not honored"s)
   
   return
   end


# lock_player --- lock onto a given player

   subroutine lock_player

   include "mul_com.r.i"

   character get_player

   MY_LOCK = 0
   SKIPBL(command, cursor)

   if (command(cursor) ~= EOS)
      MY_LOCK = get_player(command, cursor)

   return
   end


# logout --- process a logout signal and prepare to shutdown

   subroutine logout(cp)
   longint cp

   include "mul_com.r.i"

   character msg(MAXLINE)

   call ctoc("lm (x) ** force logged out **"s, msg, MAXLINE)
   msg(5) = player + 'a'c - 1
   call broadcast_message(msg)

   cursor = 0
   command(1) = EOS           # no more commands
   call clear_input_buffer    # and make sure of it

   MY_SHIELDS = -1            # suicide

   return
   end


# personal_message --- send a message to a single player

   pointer function personal_message (msg, i)
   character msg (ARB)
   integer i

   integer length
   pointer p
   pointer dsget

   include "mul_com.r.i"

   p = dsget (length (msg) + 2)
   personal_message = p
   if (p == LAMBDA)
      return

   Ref_count (p) = 0
   call ctoc(msg, Msg_text (p), MAXLINE)
   call send_msg (p, i)

   return
   end


# play_multrek --- main processing loop for multrek

   subroutine play_multrek

   integer command_ready
   integer cycle, done

   command_ready = NO
   repeat {
      call input_command (command_ready)
      call lock_db
      if (done(command_ready) == YES || cycle(command_ready) == EOF) {
         call exit_game    # clean up database
         call unlock_db
         break
         }
      call unlock_db
      call sleep$ (CYCLE_PERIOD)
      }

   return
   end


# process_command --- interpret a command, if one is present

   integer function process_command (command_ready)
   integer command_ready

   integer cmd
   integer decode_command

   include "mul_com.r.i"

   process_command = OK

   if (command_ready ~= YES)  # player hasn't finished his command yet
      return

   call comment(EOS)          # clear the remark line

   cursor = 1
   cmd = decode_command (command, cursor)
   case cmd {
      call add_to_research                      # rs
      call add_to_shields                       # sh
      call buy_phasers                          # ph
      call buy_torpedos                         # pt
      call change_warp                          # wp
      call vtupd(YES)                           # cl
      process_command = EOF                     # ex
      call fire_phasers                         # fp
      call fire_torps                           # ft
      call send_general_message                 # ms
      call send_personal_note                   # pn
      call turn                                 # tu
      call lock_player                          # lk
      call comment("Illegal command"s)          # oops
      }

   cursor = 0              # required by co-routine input_command
   command_ready = NO

   return
   end


# recv_msg --- remove message node from player's message queue

   pointer function recv_msg (msgp)
   pointer msgp

   include "mul_com.r.i"

   pointer p
   pointer dequeue

   recv_msg = LAMBDA
   p = dequeue (Msg_queue (player))
   if (p == LAMBDA)
      return

   msgp = Msg_ptr (p)
   Ref_count (msgp) = Ref_count (msgp) - 1
   call dsfree (p)

   recv_msg = msgp

   return
   end


# send_general_message --- broadcast a message to all players

   subroutine send_general_message

   character msg (MAXLINE)

   include "mul_com.r.i"

   call ctoc("ms (x) "s, msg, MAXLINE)
   call get_string (msg (8), command, cursor)
   if (msg (8) == EOS)  # message omitted
      call comment ("I see no message here"s)
   else {
      msg (5) = player + 'a'c - 1     # fill in senders letter
      call broadcast_message (msg)
      }

   return
   end


# send_msg --- add a message to a player's message queue

   integer function send_msg (msgp, i)
   pointer msgp
   integer i

   include "mul_com.r.i"

   pointer p
   pointer dsget

   send_msg = ERR
   p = dsget (NODE_SIZE)
   if (p == LAMBDA)
      return

   Msg_ptr (p) = msgp
   Link (p) = LAMBDA
   Ref_count (msgp) = Ref_count (msgp) + 1
   call enqueue (p, Msg_queue (i))

   send_msg = OK

   return
   end


# send_personal_note --- send a message to a specific player

   subroutine send_personal_note

   integer addressee

   integer get_player
   character msg (MAXLINE)

   include "mul_com.r.i"

   addressee = get_player (command, cursor)

   if ((addressee < 1 | addressee > MAX_PLAYERS)
   || (Shields (addressee) < 0))
      call comment ("Player not in galaxy"s)
   else {
      call ctoc("pn (x) "s, msg, MAXLINE)
      call get_string (msg (8), command, cursor)
      if (msg (8) == EOS)
         call comment ("I see no message here"s)
      else {
         msg (5) = player + 'a'c - 1     # fill in senders letter
         call personal_message (msg, addressee)
         }
      }

   return
   end


# sine --- take the sine of an angle expressed in degrees

   floating function sine (angle)
   integer angle

   floating f_angle

   f_angle = angle * RADIANS_PER_DEGREE
   sine = dsin (f_angle)

   return
   end


# turn --- turn to a new bearing

   subroutine turn

   include "mul_com.r.i"

   integer ang, delta_angle, cost, target
   integer ctoi, angle_diff

   integer get_player, get_angle

   target = get_player(command, cursor)
   if (target ~= 0 && Shields(target) > 0)
      ang = get_angle(player, target)
   else
      ang = ctoi (command, cursor)

   if (ang < 0 | ang > 359)
      call comment ("Illegal bearing"s)
   else {
      delta_angle = angle_diff (MY_BEARING, ang)
      cost = MY_WARP * delta_angle * ENERGY_PER_WARP_ANGLE_TURNED
      if (cost > MY_RESERVE)
         call comment ("Not enough reserve"s)
      else {
         MY_BEARING = ang
         MY_RESERVE = MY_RESERVE - cost
         }
      }

   return
   end


# unlock_db --- unlock the common data area using system semaphores

   subroutine unlock_db

   include "mul_com.r.i"
   
   integer code
   
   call sem$nf (dblock, code)
   
   if (code ~= 0)
      call comment ("semaphore notify request not honored"s)
   
   return
   end


# read_clock --- return time since midnite in seconds

   longint function read_clock (current_time)
   longint current_time
   
   integer ar (15)
   
   call timdat (ar, 9) 
   current_time = 60 * ar (4) + ar (5)
   read_clock = current_time
   
   return
   end


# uniform --- generate uniform variate

   integer function uniform (lwb, upb)
   integer lwb, upb

   uniform = lwb + (upb - lwb) * rnd (0)

   return
   end
