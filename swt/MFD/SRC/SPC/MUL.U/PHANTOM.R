# input_ph_command --- get a command for a phantom

   subroutine input_ph_command

   include "mul_com.r.i"

   if (ph_controlled == YES) {
      ph_turns_left = ph_turns_left - 1
      if (ph_turns_left <= 0)
         ph_controlled = NO
      }

   if (ph_controlled == NO & ph_check == MAYBE) {
      ph_check = YES
      call send_alliance_task
      return
      }

   call determine_state
   case phantom_state {
      call run_state
      call wait_state
      call attack_state
      }

   return
   end


# determine_state --- decide whether to run, wait, or attack

   subroutine determine_state

   include "mul_com.r.i"

   integer close2, close1, i, dist, close2_range, close1_range
   integer ph_getrange, uniform

   if (ph_controlled == YES & ph_victim == -1) {
      phantom_state = WAIT
      return
      }

   close1 = 0
   close2 = 0
   close1_range = uniform (800, 1300)
   close2_range = uniform (1000, 2000)

   do i = 1, MAX_PLAYERS; {
      if (Shields (i) > 0 & player ~= i) {
         dist = ph_getrange (player, i)
         if (dist < close2_range)
            close2 = close2 + 1
         if (dist < close1_range)
            close1 = close1 + 1
         }
      }

   if (phantom_state == ATTACK &  MY_SHIELDS > 175 &
         (MY_PHASERS > 0 | MY_TORPEDOS > 0) & close2 < 3 & close2 > 0)
      phantom_state = ATTACK
   else if (close2 > 0 & (close1 > 1 |  MY_SHIELDS + MY_RESERVE < 250 |
        (MY_PHASERS < 50 &  MY_TORPEDOS < 5)))
      phantom_state = RUN
   else if (MY_PHASERS < 300  & close1 == 0 | MY_TORPEDOS < 10  |
         MY_SHIELDS + MY_RESERVE < 250)
      phantom_state = WAIT
   else
      phantom_state = ATTACK

   return
   end


# run_state --- implement strategy when "running"

   subroutine run_state

   integer i, minplayer, angle, dist, mindist, realdist
   integer itoc, ph_getangle, ph_getrange, uniform, compare_angle, get_range

   include "mul_com.r.i"

   mindist = 20000

   if (MY_SHIELDS < 150 & MY_RESERVE > 50) {
      call make_command ("sh"s,  MY_RESERVE - 25, 0)
      return
      }

   minplayer = 0
   do i = 1, MAX_PLAYERS; {
      if (Shields (i) > 0 & i ~= player) {
         dist = ph_getrange (player, i)
         if (dist < mindist) {
            mindist = dist
            minplayer = i
            }
         }
      }
   if (minplayer == 0) {
      call convert_reserve
      return
      }

   realdist = get_range (player, minplayer)  # get real distance
   angle = ph_getangle (player, minplayer)

   if (compare_angle (MY_BEARING, angle + 180, 30) == NO)
      call make_command ("tu"s,
                           mod (150 + angle + uniform (0, 60), 360), 0)
   else if (MY_WARP ~= 8)
      call make_command ("wp"s, 8, 0)
   else if (realdist < 350 & MY_TORPEDOS > 0)
      call make_command ("ft"s, min (10, MY_TORPEDOS), minplayer)
   else
      call make_command (EOS, 0, 0)    # no command

   return
   end



# wait_state --- implement strategy when the phantom is "waiting"

   subroutine wait_state

   include "mul_com.r.i"

   if (MY_WARP ~= 0)
      call make_command ("wp"s, 0, 0)
   else
      call convert_reserve

   return
   end



# attack_state --- implement strategy to KILL!!!!!

   subroutine attack_state

   include "mul_com.r.i"

   integer i, minangle, dist, mindist, minplayer, realdist
   integer ph_getangle, ph_getrange, get_range

   mindist = GALAXY_SIZE * 2
   minplayer = 0
   do i = 1, MAX_PLAYERS
      if (Shields (i) > 0 & player ~= i) {
         dist = ph_getrange (player, i)
         if (dist < mindist) {
            mindist = dist
            minplayer = i
            }
         }
   if (minplayer == 0) {  # nobody to play with
      call convert_reserve
      return
      }

   if (ph_controlled == YES && ph_victim > 0 && Shields (ph_victim) >= 0
         && ph_victim ~= player) {
      minplayer = ph_victim
      mindist = ph_getrange (player, minplayer)
      }

   realdist = get_range (player, minplayer)
   minangle = iabs (ph_getangle (player, minplayer) - MY_BEARING)

   if (realdist < 350 & MY_TORPEDOS > 0 )
      call make_command ("ft"s, min (10, MY_TORPEDOS), minplayer)
    # addition to make the phantom stick and fire torps at close
    # range, if his shields are high enough
   else if (realdist < 350 & MY_TORPEDOS == 0 & MY_SHIELDS > 175 &
      MY_RESERVE > 50)
      call make_command ("pt"s, max (1, (MY_RESERVE - 50) / 10), 0)
   else if (realdist < 1500 & MY_PHASERS > 30) {
      if (MY_WARP > 6)
         call make_command ("wp"s, 6, 0)
      else if (minangle <= 5)
         call make_command ("fp"s, min (100, MY_PHASERS), minplayer)
      else
         call make_command ("tu"s, ph_getangle (player, minplayer), 0)
      }
   else if (minangle > 5)
      call make_command ("tu"s,  ph_getangle (player, minplayer), 0)
   else if (MY_WARP ~= 7)
      call make_command ("wp"s, 7, 0)
   else
      call convert_reserve

   return
   end



# convert_reserve --- decide where to put surplus energy

   subroutine convert_reserve

   include "mul_com.r.i"

   if (MY_RESEARCH < 300)
      call make_command ("rs"s, 0, 0)
   else if (MY_SHIELDS < 250)
      call make_command ("sh"s, 0, 0)
   else if (MY_TORPEDOS < 10)
      call make_command ("pt"s, 0, 0)
   else if (MY_PHASERS < 100)
      call make_command ("ph"s, 0, 0)
   else if (MY_RESERVE < 101)
      call make_command (EOS, 0, 0)
   else if (MY_SHIELDS < 375)
      call make_command ("sh"s, MY_RESERVE - 100, 0)
   else if (MY_TORPEDOS < MAX_TORPEDOS)
      call make_command ("pt"s, (MY_RESERVE - 90) / 10, 0)
   else if (MY_PHASERS < MAX_PHASERS)
      call make_command ("ph"s, MY_RESERVE - 100, 0)
   else if (MY_SHIELDS < MAX_SHIELDS)
      call make_command ("sh"s, MY_RESERVE - 100, 0)
   else
      call make_command (EOS, 0, 0)

   return
   end



# make_command --- produce a real "mul" command

   subroutine make_command (kind, amt, pl)
   integer kind (ARB), amt, pl

   include "mul_com.r.i"

   integer itoc, ctoc

   cursor = ctoc(kind, command, MAXLINE)
   if (cursor == 0 | amt == 0) {
      command (cursor + 1) = EOS
      return
      }
   cursor = cursor + 1
   command (cursor) = ' 'c
   cursor = cursor + itoc (amt, command (cursor + 1), 10)
   if (pl ~= 0) {
      cursor = cursor + 2
      command (cursor - 1) = ' 'c
      command (cursor) = pl + 'a'c - 1
      }

   command (cursor + 1) = EOS

   return
   end



# compare_angle --- compare two angles within a tolerance

   integer function compare_angle (a1, a2, tol)
   integer a1, a2, tol

   integer dif

   if (a1 - a2 > 180)
      dif = iabs (a1 - a2 - 360)
   else if (a2 - a1 > 180)
      dif = iabs (a2 - a1 - 360)
   else
      dif = iabs (a1 - a2)

   if (dif <= tol)
      compare_angle = YES
   else
      compare_angle = NO

   return

   end

# ph_get_range --- adjusted range finder for phantom players

   integer function ph_get_range (p1, p2)
   integer p1, p2

   integer x1, x2, y1, y2, range, range2
   integer get_range
   real sqrt, float

   include "mul_com.r.i"

   x1 = Xpos (p1)
   x2 = Xpos (p2)
   y1 = Ypos (p1)
   y2 = Ypos (p2)

   call find_closest_wrap (x1, y1, x2, y2)

   range = sqrt (float (x1 - x2) ** 2 + float (y1 - y2) ** 2)

   range2 = get_range (p1, p2)

   if (range < range2)
      ph_get_range = range
   else
      ph_get_range = range2

   return

   end

# ph_get_angle --- adjusted angle finder for phantom players

   integer function ph_get_angle (p1, p2)
   integer p1, p2

   integer x1, x2, y1, y2, ang
   integer get_angle, get_range, ph_get_range
   real atan2

   include "mul_com.r.i"

   if (ph_get_range (p1, p2) == get_range (p1, p2)) {
      ph_get_angle = get_angle (p1, p2)
      return
      }

   x1 = Xpos (p1)
   x2 = Xpos (p2)
   y1 = Ypos (p1)
   y2 = Ypos (p2)

   call find_closest_wrap (x1, y1, x2, y2)

   if (x1 == x2) {
      if (y1 == y2)
         ang = 0
      else if (y1 < y2)
         ang = 90
      else if (y1 > y2)
         ang = 270
      }
   else
      ang = atan2 (float (y2 - y1), float (x2 - x1)) * 180.0 / 3.14159

   if (ang < 0)
      ang = ang + 360

   ph_get_angle = ang

   return

   end

# find_closest_wrap --- modify coordinates to provide closes "wrap around"

   subroutine find_closest_wrap (x1, y1, x2, y2)
   integer x1, y1, x2, y2

   integer q1, q2
   integer get_quadrant

   q1 = get_quadrant (x1, y1)
   q2 = get_quadrant (x2, y2)

   if (q1 == q2)
      ;
   else if (q1 == 2 & q2 == 1 | q1 == 3 & q2 == 4)
      x1 = x1 + GALAXY_SIZE
   else if (q2 == 2 & q1 == 1 | q2 == 3 & q1 == 4)
      x2 = x2 + GALAXY_SIZE
   else if (q1 == 3 & q2 == 2 | q1 == 4 & q2 == 1)
      y1 = y1 + GALAXY_SIZE
   else if (q2 == 3 & q1 == 2 | q2 == 4 & q1 == 1)
      y2 = y2 + GALAXY_SIZE
   else if (q1 == 3 & q2 == 1) {
      x1 = x1 + GALAXY_SIZE
      y1 = y1 + GALAXY_SIZE
      }
   else if (q2 == 3 & q1 == 1) {
      x2 = x2 + GALAXY_SIZE
      y2 = y2 + GALAXY_SIZE
      }
   else if (q1 == 2 & q2 == 4) {
      x1 = x1 + GALAXY_SIZE
      y2 = y2 + GALAXY_SIZE
      }
   else if (q2 == 2 & q1 == 4) {
      x2 = x2 + GALAXY_SIZE
      y1 = y1 + GALAXY_SIZE
      }
   else
      call print (ERROUT, "(in ph_get_angle) can't happen: *i *i *i *i*n"s,
         x1, y1, x2, y2)

   return
   end

# get_quadrant --- get quadrant of player at x, y
   integer function get_quadrant (x, y)
   integer x, y

   include "mul_com.r.i"

   if (x > GALAXY_SIZE / 2)
      if (y > GALAXY_SIZE / 2)
         get_quadrant = 1
      else
         get_quadrant = 4
   else
      if (y > GALAXY_SIZE / 2)
         get_quadrant = 2
      else
         get_quadrant = 3

   return
   end



# ph_check_message --- check messages for "alliance requests"
   subroutine ph_check_message (buf)
   character buf (ARB)

   integer i
   integer ctoi

   include "mul_com.r.i"

   if (buf (1) ~= 'p'c || buf (2) ~= 'n'c)
      ;
   else if (ph_controlled == NO) {
      if (ph_check == NO & 
          buf (8) == 'i'c &
          buf (9) == buf (5) &
          buf (10) == 't'c &
          buf (11) == player + 'a'c - 1 &
          buf (12) == 'a'c &
          buf (13) == EOS) {
         ph_check = MAYBE
         ph_ally = buf (5) - 'a'c + 1
         }
      else if (ph_check == YES & 
          buf (5) == ph_ally + 'a'c - 1) {
         i = 8
         if (ph_task == ctoi (buf, i)) {
            ph_controlled = YES
            ph_victim = NO_ONE
            ph_check = NO
            ph_turns_left = PHANTOM_ALLY_PERIOD
            }
         else {
            ph_check = NO
            }
         }
      }
   else if (ph_controlled == YES & ph_ally + 'a'c - 1 == buf (5)) {
      if (buf (8) == 'A'c) {
         ph_victim = buf (9) - 'a'c + 1
         }
      else if (buf (8) == 'W'c) {
         ph_victim = -1
         }
      }

   return
   end



# send_alliance_task --- send a personal note with a "password" task
   subroutine send_alliance_task

   integer i, j, k
   integer uniform

   include "mul_com.r.i"

   character msg(MAXLINE)

   i = uniform (0, 9)
   j = uniform (0, 9)
   k = uniform (0, 9)

   call ctoc("pn X ....."s, msg, MAXLINE)
   msg (4) = ph_ally + 'a'c - 1
   msg (6) = '0'c + i
   msg (7) = '0'c + uniform (0, 9)
   msg (8) = '0'c + j
   msg (9) = '0'c + uniform (0, 9)
   msg (10)= '0'c + k
   cursor = 10

   ph_task = i + j + k - 1

   call scopy (msg, 1, command, 1)

   return
   end
