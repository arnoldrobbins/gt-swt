# setbuf --- create scratch file, initialize line 0

   subroutine setbuf

   include SE_COMMON

   pointer p

   call makscr (Scr, Scrname)    # create a scratch file
   Scrend = 0                    # initially empty

   Curln = 0
   Lastln = 0

   Lastbf = 1                    # next word available for allocation
   Free = NOMORE                 # free list is initially empty
   Limbo = NOMORE                # no lines in limbo
   Limcnt = 0
   Lost_lines = 0                # no garbage in scratch file yet

   call maklin (EOS, 1, p)      # create an empty line
   call relink (p, p, p, p)      # establish initial linked list
   Markname (p) = EOS            # give it an illegal mark name
   Line0 = p                     # henceforth and forevermore

   return
   end
