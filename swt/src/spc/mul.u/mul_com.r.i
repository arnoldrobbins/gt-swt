# Shared database definitions:

   integer Xpos (MAX_PLAYERS)             # current X-position
   integer Ypos (MAX_PLAYERS)             # current Y-position
   integer Bearing (MAX_PLAYERS)          # current bearing
   integer Warp (MAX_PLAYERS)             # current warp factor
   integer Phasers (MAX_PLAYERS)          # current number of phasers
   integer Torpedos (MAX_PLAYERS)         # current number of torps
   integer Reserve (MAX_PLAYERS)          # current energy in reserve
   integer Research (MAX_PLAYERS)         # current research budget
   integer Shields (MAX_PLAYERS)          # current energy in shields
   integer Kills (MAX_PLAYERS)            # current number of kills
   integer Locked (MAX_PLAYERS)           # current locked status
   integer Msg_queue (MAX_PLAYERS)        # pointer to message queue
   integer Name (MAX_NAME, MAX_PLAYERS)   # player's names

   pointer Head_ptr (1)                   # pointer to first message node
   pointer Tail_ptr (1)                   # pointer to last message node

   pointer Link (1)                       # link to next message node
   pointer Msg_ptr (1)                    # pointer to message text

   pointer Ref_count (1)                  # number of links to this msg
   pointer Msg_text (1)                   # text of message

   integer Mem (MEMSIZE)                  # dynamic storage space

   common /mulcom/ Xpos, Ypos, Bearing, Warp, Phasers, Torpedos,
      Reserve, Research, Shields, Kills, Locked, Msg_queue, Name, Mem

   equivalence (Head_ptr, Mem (1))
   equivalence (Tail_ptr, Mem (2))
   equivalence (Link, Mem (1))
   equivalence (Msg_ptr, Mem (2))
   equivalence (Ref_count, Mem (1))
   equivalence (Msg_text, Mem (2))


# Per-user private common definitions:

   integer phantom_state                  # phantom's current state
   integer phantom_flag                   # YES if we're a phantom
   integer player                         # our player number
   character echar                        # our erase character
   character kchar                        # our kill character
   integer cursor                         # command line cursor position
   character command (MAXLINE)            # command line
   integer ph_controlled                  # phantom has a "friend"
   integer ph_ally                        # phantom's "friend"
   integer ph_turns_left                  # turns left as a friend
   integer ph_victim                      # phantom's worst enemy
   integer ph_check                       # waiting for a crypt response
   integer ph_task                        # recognition task value
   integer dblock                         # database lock

   common /private/ phantom_state, phantom_flag, player, echar, kchar,
      cursor, command, ph_controlled, ph_ally, ph_turns_left, ph_victim,
      ph_check, ph_task, dblock
