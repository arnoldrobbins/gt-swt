# build_screen_template --- display empty screen

   subroutine build_screen_template

   integer i

   include "scr_com.r.i"
   include "mul_com.r.i"


   call vtclr(1, 1, MAX_DISPLAY_X, MAX_DISPLAY_Y)

   call vtputl("MulTrek"s, 1, 8)
   call vtputl("Range Angle Player Kills Name"s, 1, 33)
   call vtputl("--------------------------------"s, 2, 1)
   do i = 1, GALAXY_DISPLAY_LENGTH; {
      call vtputl("|"s, GALAXY_DISPLAY_X - i, GALAXY_DISPLAY_Y)
      call vtputl("|"s, GALAXY_DISPLAY_X - i, GALAXY_DISPLAY_Y + GALAXY_DISPLAY_WIDTH + 1)
      }
   call vtputl("--------------------------------"s,
               GALAXY_DISPLAY_X, GALAXY_DISPLAY_Y)
   call vtputl("Reserve         Phasers         Angle"s,
               GALAXY_DISPLAY_X + 1, GALAXY_DISPLAY_Y)
   call vtputl("Research        Torpedos        Warp"s,
               GALAXY_DISPLAY_X + 2, GALAXY_DISPLAY_Y)
   call vtputl("Shields                         Position"s,
               GALAXY_DISPLAY_X + 3, GALAXY_DISPLAY_Y)
   call vtputl("Command:"s, GALAXY_DISPLAY_X + 4, GALAXY_DISPLAY_Y)

   do i = 1, MAX_PLAYERS; {
      last_user_x (i) = 0
      last_user_y (i) = 0
      last_star (i) = NO
      last_displayed (i) = NO
      }

   last_time (1) = EOS

   last_reserve = -1
   last_research = -1
   last_phasers = -1
   last_torps = -1
   last_shields = -1
   last_bearing = -1
   last_warp = -1
   last_position_x = -1
   last_position_y = -1
   last_lock = 0

   last_message_used = FIRST_MESSAGE_X

   cursor_row = 0
   cursor_column = 0
   remark_changed = NO
   call vtupd(YES)

   return
   end


# comment --- change the contents of the remark line

   subroutine comment (msg)
   integer msg (ARB)

   include "scr_com.r.i"

   remark_changed = YES
   call ctoc(msg, remark_text, MAXLINE)

   return
   end


# display_message --- update a circular list of messages on the screen

   subroutine display_message (buf)
   character buf (ARB)

   include "scr_com.r.i"

   if (last_message_used >= LAST_MESSAGE_X)
      last_message_used = FIRST_MESSAGE_X
   else
      last_message_used = last_message_used + 1

   call vtputl(buf, last_message_used, MESSAGE_DISPLAY_Y)

   return
   end


# display_user --- display letter in place of user
   subroutine display_user (i)
   integer i

   integer j
   character c(2)

   include "scr_com.r.i"
   include "mul_com.r.i"

   last_star (i) = NO

   c(1) = i + 'a'c - 1
   do j = 1, MAX_PLAYERS
      if (i ~= j & user_x (i) == user_x (j) & user_y (i) == user_y (j)) {
         last_star (i) = YES
         last_star (j) = YES
         c(1) = '*'c
         }
   c(2) = EOS
   call vtputl(c, GALAXY_DISPLAY_X - user_y(i),
                  user_x(i) + GALAXY_DISPLAY_Y)

   return
   end


# erase_user --- erase letter of user
   subroutine erase_user (i)
   integer i

   integer j

   include "scr_com.r.i"

   call vtputl(" "s, GALAXY_DISPLAY_X - last_user_y(i),
                     last_user_x(i) + GALAXY_DISPLAY_Y)

   if (last_star (i) == YES)     # mark any other people displayed here
      do j = 1, MAX_PLAYERS
         if (i ~= j
           & last_user_x (j) == last_user_x (i)
           & last_user_y (j) == last_user_y (i)) {
            last_user_x (j) = 0
            last_user_y (j) = 0
            }

   return
   end


# get_message_text --- return message from queue

   integer function get_message_text (buf)
   character buf (ARB)

   pointer msgp
   pointer recv_msg
   integer scopy

   include "mul_com.r.i"

   if (recv_msg (msgp) == LAMBDA)
      get_message_text = EOF
   else {
      get_message_text = scopy (Msg_text (msgp), 1, buf, 1)
      if (Ref_count (msgp) == 0)
         call dsfree (msgp)
      }

   return
   end


# update_screen --- display current MulTrek environment

   subroutine update_screen

   include "scr_com.r.i"
   include "mul_com.r.i"

   integer user_range, user_angle, user_kills, i, j
   integer message_area_changed
   integer get_message_text, get_range, get_angle, equal
   character time_str (9), buf (MAXLINE), ch

  # update command line
   call vtputl(command, COMMAND_DISPLAY_X, COMMAND_DISPLAY_Y)

  # update remark field
   if (remark_changed == YES) {
      call vtputl(remark_text, REMARK_DISPLAY_X, REMARK_DISPLAY_Y)
      call vtpad(MAX_DISPLAY_Y)

      remark_changed = NO
      last_message_used = LAST_MESSAGE_X
      call vtclr(FIRST_MESSAGE_X, MESSAGE_DISPLAY_Y,
                  LAST_MESSAGE_X, MAX_DISPLAY_Y)
      }

  # update the time
   call date (TIME_OF_DAY, time_str)
   time_str (6) = EOS            # zap the minutes
   if (equal (time_str, last_time) == NO) {
      call vtputl(time_str, TIME_DISPLAY_X, TIME_DISPLAY_Y)
      call ctoc(time_str, last_time, 6)
      }

  # update the galaxy display
   do i = 1, MAX_PLAYERS; {
      if (Shields (i) >= 0) {
         user_x (i) = int (Xpos (i) * (float (GALAXY_DISPLAY_WIDTH) / _
                         float (GALAXY_SIZE))) + 1
         user_y (i) = int (Ypos (i) * (float (GALAXY_DISPLAY_LENGTH) / _
                         float (GALAXY_SIZE))) + 1
         }
      else {   # he's invisible or dead . . . .
         user_x (i) = 0
         user_y (i) = 0
         }
      }

   do i = 1, MAX_PLAYERS      # erase marks that are moving
      if (last_user_x (i) ~= user_x (i) | last_user_y (i) ~= user_y (i))
         if (last_user_x (i) ~= 0 & last_user_y (i) ~= 0)
            call erase_user (i)

   do i = 1, MAX_PLAYERS      # replace marks that are moving
      if (last_user_x (i) ~= user_x (i) | last_user_y (i) ~= user_y (i))
         if (user_x (i) ~= 0 & user_y (i) ~= 0)
            call display_user (i)

   do i = 1, MAX_PLAYERS; {   # replace marks that are moving
      last_user_x (i) = user_x (i)
      last_user_y (i) = user_y (i)
      }

  # update the range, angle & kills display
   do i = 1, MAX_PLAYERS; {

      if (Shields (i) >= 0) {
         user_range = get_range (player, i)
         user_angle = get_angle (player, i)
         user_kills = Kills (i)
         }
      else {
         user_range = -1
         user_angle = -1
         user_kills = -1
         }

      if (last_displayed (i) == NO) {  # he may be showing up or still dead
         if (user_range == -1)         # he's still not there
            ;
         else {                        # he's here for the first time
            call vtputl(Name(1, i), NAME_DISPLAY_X + i, NAME_DISPLAY_Y)
            call vtprt(RANGE_DISPLAY_X + i, RANGE_DISPLAY_Y,
                        "*#i"s, RANGE_DISPLAY_SIZE, user_range)
            call vtprt(ANGLE_DISPLAY_X + i, ANGLE_DISPLAY_Y,
                        "*#i"s, ANGLE_DISPLAY_SIZE, user_angle)
            call vtprt(KILLS_DISPLAY_X + i, KILLS_DISPLAY_Y,
                        "*#i"s, KILLS_DISPLAY_SIZE, Kills(i))
            call vtprt(PLAYER_DISPLAY_X + i, PLAYER_DISPLAY_Y,
                        "*c"s, i + 'a'c - 1)
            last_displayed (i) = YES
            }
         }
      else {                           # he wasn't dead last time
         if (Shields (i) >= 0) {        # he's still around
            if (user_range ~= last_range (i))
               call vtprt(RANGE_DISPLAY_X + i, RANGE_DISPLAY_Y,
                           "*#i"s, RANGE_DISPLAY_SIZE, user_range)

            if (user_angle ~= last_angle (i))
               call vtprt(ANGLE_DISPLAY_X + i, ANGLE_DISPLAY_Y,
                           "*#i"s, ANGLE_DISPLAY_SIZE, user_angle)

            if (user_kills ~= last_kills (i))
               call vtprt(KILLS_DISPLAY_X + i, KILLS_DISPLAY_Y,
                           "*#i"s, KILLS_DISPLAY_SIZE, user_kills)
            }
         else                          # he's dead now. . . .
            call vtclr(RANGE_DISPLAY_X + i, RANGE_DISPLAY_Y,
                       RANGE_DISPLAY_X + i, MAX_DISPLAY_Y)
         }

      last_range (i) = user_range
      last_angle (i) = user_angle
      last_kills (i) = user_kills
      }

   # update the locked display
   if (MY_LOCK ~= last_lock) {
      call vtputl(" "s, LOCKED_DISPLAY_X + last_lock, LOCKED_DISPLAY_Y)
      last_lock = MY_LOCK
      if (MY_LOCK > 0 && Shields(MY_LOCK) >= 0)
         call vtputl("*"s, LOCKED_DISPLAY_X + MY_LOCK, LOCKED_DISPLAY_Y)
      }
   elif (Shields(MY_LOCK) < 0) {
      call vtputl(" "s, LOCKED_DISPLAY_X + MY_LOCK, LOCKED_DISPLAY_Y)
      MY_LOCK = 0    # not there anymore
      }

  # update the player's ship display
   if (last_reserve ~= MY_RESERVE) {
      call vtprt(RESERVE_DISPLAY_X, RESERVE_DISPLAY_Y,
                  "*#i"s, RESERVE_DISPLAY_SIZE, MY_RESERVE)
      last_reserve = MY_RESERVE
      }

   if (last_research ~= MY_RESEARCH) {
      call vtprt(RESEARCH_DISPLAY_X, RESEARCH_DISPLAY_Y,
                  "*#i"s, RESEARCH_DISPLAY_SIZE, MY_RESEARCH)
      last_research = MY_RESEARCH
      }

   if (last_phasers ~= MY_PHASERS) {
      call vtprt(PHASERS_DISPLAY_X, PHASERS_DISPLAY_Y,
                  "*#i"s, PHASERS_DISPLAY_SIZE, MY_PHASERS)
      last_phasers = MY_PHASERS
      }

   if (last_torps ~= MY_TORPEDOS) {
      call vtprt(TORPEDOS_DISPLAY_X, TORPEDOS_DISPLAY_Y,
                  "*#i"s, TORPEDOS_DISPLAY_SIZE, MY_TORPEDOS)
      last_torps = MY_TORPEDOS
      }

   if (last_shields ~= MY_SHIELDS) {
      call vtprt(SHIELDS_DISPLAY_X, SHIELDS_DISPLAY_Y,
                  "*#i"s, SHIELDS_DISPLAY_SIZE, MY_SHIELDS)
      last_shields = MY_SHIELDS
      }

   if (last_bearing ~= MY_BEARING) {
      call vtprt(BEARING_DISPLAY_X, BEARING_DISPLAY_Y,
                  "*#i"s, BEARING_DISPLAY_SIZE, MY_BEARING)
      last_bearing = MY_BEARING
      }

   if (last_warp ~= MY_WARP) {
      call vtprt(WARP_DISPLAY_X, WARP_DISPLAY_Y,
                  "*#i"s, WARP_DISPLAY_SIZE, MY_WARP)
      last_warp = MY_WARP
      }

   if (last_position_x ~= MY_XPOS) {
      call vtprt(POSITION_X_DISPLAY_X, POSITION_X_DISPLAY_Y,
                  "*#i"s, POSITION_X_DISPLAY_SIZE, MY_XPOS)
      last_position_x = MY_XPOS
      }

   if (last_position_y ~= MY_YPOS) {
      call vtprt(POSITION_Y_DISPLAY_X, POSITION_Y_DISPLAY_Y,
                  "*#i"s, POSITION_Y_DISPLAY_SIZE, MY_YPOS)
      last_position_y = MY_YPOS
      }

  # update message areas
   for (i = 1; i <= NUMBER_OF_MESSAGE_LINES; i = i + 1) {
      if (get_message_text (buf) == EOF)
         break
      if (phantom_flag == YES)
         call ph_check_message (buf)
      call display_message (buf)
      }

   call vtupd(NO)
   call vtclr(COMMAND_DISPLAY_X, COMMAND_DISPLAY_Y + cursor,
              COMMAND_DISPLAY_X, MAX_DISPLAY_Y)

   return
   end
