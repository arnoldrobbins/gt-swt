# user_types.r.i --- user type definitions (Primos Rev 19)

   define (LOGGED_OUT_USER,-1)   # logged out process
   define (USER_LOGGING_OUT,0)   # on the way out
   define (NORMAL_USER,1)        # normal terminal user
   define (LOW_TERMINAL_USER,NORMAL_USER) # lower end of terminal user range
   define (GONE_REMOTE,2)        # user has gone to remote system
   define (FROM_REMOTE,3)        # user logged in from remote system
   define (LOGGED_THRU,4)        # user has logged thru this system to remote
   define (SUPER_USER,5)         # supervisor user (console)
   define (TERMINAL_FAM,6)       # FAM I running on a terminal
   define (HIGH_TERMINAL_USER,TERMINAL_FAM)  # high end of terminal user range
   define (NORMAL_PHANTOM,65)    # plain phantom
   define (LOW_PHANTOM_USER,NORMAL_PHANTOM)  # low end of phantom range
   define (CPL_PHANTOM,66)       # CPL phantom
   define (NPX_SLAVE,67)         # remote file server slave process
   define (BATCH_PHANTOM,68)     # Batch process
   define (PHANTOM_FAM,69)       # FAM I phantom
   define (NETWORK_PHANTOM,70)   # Network server process
   define (HIGH_PHANTOM_USER,NETWORK_PHANTOM)   # high end of phantom range
