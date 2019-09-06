# scrcom --- common area for MulTrek display routines

   integer last_time (9)                 # last time displayed

   integer last_user_x (MAX_PLAYERS),    # last x position of letter display
           last_user_y (MAX_PLAYERS),    # last y position of letter display
           last_star (MAX_PLAYERS),      # was a star displayed last time
           user_x (MAX_PLAYERS),         # current x position of letter
           user_y (MAX_PLAYERS)          # current y position of letter

   integer last_range (MAX_PLAYERS),     # last range value for user
           last_angle (MAX_PLAYERS),     # last angle value for user
           last_kills (MAX_PLAYERS),     # last number of kills for user
           last_displayed (MAX_PLAYERS)  # was user displayed last time?

   integer last_reserve,                 # last reserve value
           last_research,                # last research value
           last_phasers,                 # last phaser value
           last_torps,                   # last torpedo value
           last_shields,                 # last shield value
           last_bearing,                 # last bearing value
           last_warp,                    # last warp value
           last_lock,                    # last lock value
           last_position_x,              # last x position value
           last_position_y               # last y position value

   integer last_message_used             # position of last message

   integer cursor_row,
           cursor_column

   integer remark_changed
   character remark_text (MAXLINE)

   common /mtdcom/ last_user_x, last_user_y, last_range, last_angle, last_kills,
      last_displayed, last_lock, last_reserve, last_research, last_phasers,
      last_torps, last_shields, last_bearing, last_warp, last_position_x,
      last_position_y, cursor_row, cursor_column, remark_changed,
      remark_text, last_message_used, last_star, user_x, user_y, last_time
