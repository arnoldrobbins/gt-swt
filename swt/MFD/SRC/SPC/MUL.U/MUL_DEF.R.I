# muldefs --- MulTrek definitions


# Phantom states:

   define (RUN,1)                         # turn tail and run like hell
   define (WAIT,2)                        # sit around getting strong
   define (ATTACK,3)                      # attack the nearest player
   # Leave these values alone; they are used in 'case' statements


# Keys to the SWT 'date' routine:

   define (DAY_OF_WEEK,5)                 # get day of week as a string          
   define (LOGIN_NAME,3)                  # login name as string
   define (TIME_OF_DAY,2)                 # get time of day as a string
   define (PROCESS_ID,6)                  # get numeric process id


# Keys to the Primos break$ routine:

   define (DISABLE,1)                     # disable the break key
   define (ENABLE,0)                      # enable the break key


# Keys to the Primos 'duplx$' routine:

   define (HALF_NOLF,:140000)             # half duplex, no line-feed
   define (READ_LWORD,-1)                 # return current LWORD


# Miscellaneous MulTrek constants:

   define (DAMAGED,0)                     # player damaged but not killed
   define (DESTROYED,1)                   # player has been destroyed
   define (NODE_SIZE,2)                   # size of a message queue entry
   define (RADIANS_PER_DEGREE,0.01745329252)
   define (SECONDS_PER_DAY,86400)
   define (MEMSIZE,10000)                 # size of dynamic memory
   define (READ_EK,1)                     # ERKL$$ key to read ekchars
   define (CLEAR_INPUT,:40000)            # TTY$RS key to clear input buf
   define (NO_ONE, 0)
   define (MAYBE, 3)


# Other miscellaneous definitions:

   define (abs,iabs)
   define (max,max0)
   define (min,min0)
   define (pointer,integer)
   define (dcosh,e_to_the_x + e_to_the_minus_x div_two)
   define (DB,)


# Game-tailoring parameters:

   define (CYCLE_PERIOD,0 002 000)        # msec between basic cycles
   define (DISTANCE_PER_WARP_POWER_SECOND,2.60417)
   define (ENERGY_PER_WARP_ANGLE_TURNED,.01)
   define (ENERGY_PER_HYPER_WARP,10)      # cost per hyper warp
   define (ENERGY_PER_RESEARCH_SECOND,0.02)  # rate of reserve buildup
   define (ENERGY_PER_WARP_POWER_SECOND,0.1750)    # energy usage rate
   define (GALAXY_SIZE,10000)             # size of galaxy
   define (INITIAL_PHASERS,50)            # initial number of phasers
   define (INITIAL_RESEARCH,100)          # initial research budget
   define (INITIAL_RESERVE,50)            # initial energy in reserve
   define (INITIAL_SHIELDS,150)           # initial energy in shields
   define (INITIAL_TORPEDOS,7)            # initial number of torps
   define (INITIAL_WARP,0)                # initial warp factor
   define (MAX_NAME,21)                   # max length of playing name
   define (MAX_PHASER_ANGLE,15)           # angular phaser range
   define (MAX_PHASER_DOSAGE,100)         # maximum phasers in one firing
   define (MAX_PHASER_RANGE,5000)         # maximum phaser range
   define (MAX_PHASERS,350)               # mamimum number of phasers
   define (MAX_PLAYERS,10)                # max simultaneous players
   define (MAX_RESEARCH,300)              # maximum research budget
   define (MAX_RESERVE,250)               # maximum energy in reserve
   define (MAX_SHIELDS,400)               # maximum energy in shields
   define (MAX_TORP_DOSAGE,10)            # max torps in one firing
   define (MAX_TORP_RANGE,1000)           # maximum torpedo range
   define (MAX_TORPEDOS,15)               # maximum number of torps
   define (MAX_WARP,8)                    # maximum warp factor
   define (PHANTOM_ALLY_PERIOD, 300)
   define (STROMS_PER_PHASER_DISTANCE_DEGREE,1.333e-5)
   define (STROMS_PER_TORP_DISTANCE,0.015)
   define (WARP_POWER,1.66667)            # warp factor exponent


# Shorthand notations for database references:

   define (MY_BEARING,Bearing(player))
   define (MY_KILLS,Kills(player))
   define (MY_MSG_QUEUE,Msg_queue(player))
   define (MY_NAME,Name(1,player))
   define (MY_LOCK,Locked(player))
   define (MY_PHASERS,Phasers(player))
   define (MY_RESEARCH,Research(player))
   define (MY_RESERVE,Reserve(player))
   define (MY_SHIELDS,Shields(player))
   define (MY_TORPEDOS,Torpedos(player))
   define (MY_WARP,Warp(player))
   define (MY_XPOS,Xpos(player))
   define (MY_YPOS,Ypos(player))


# Command definitions:

   define (NL_CMD,0)                      # null command line
   define (RS_CMD,1)                      # add to research
   define (SH_CMD,2)                      # add to shields
   define (PH_CMD,3)                      # buy phasers
   define (PT_CMD,4)                      # buy photon torpedos
   define (WP_CMD,5)                      # change warp factor
   define (CL_CMD,6)                      # rebuild screen
   define (EX_CMD,7)                      # exit game
   define (FP_CMD,8)                      # fire phasers
   define (FT_CMD,9)                      # fire torpedos
   define (MS_CMD,10)                     # broadcast a message
   define (PN_CMD,11)                     # send a personal communique
   define (TU_CMD,12)                     # turn to a new bearing
   define (LK_CMD,13)                     # lock onto a player
   define (NO_CMD,14)                     # unrecognized command


# Dynamic memory definitions:

   define (e_to_the_minus_x,j)
   define (e_to_the_x,i)
   define (C,8)                           # close-fitting block threshold
   define (DS_LINK,0)                     # link field of storage block
   define (DS_OVERHEAD,2)                 # total overhead per block
   define (DS_SIZE,1)                     # size field of storage block
   define (LOC_AVAIL,2)                   # start of available space list
   define (LOC_MEMEND,1)                  # pointer to end of memory
   define (div_two,*k#)
