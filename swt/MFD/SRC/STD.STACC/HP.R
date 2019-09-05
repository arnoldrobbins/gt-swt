# hp --- reverse Polish notation calculator program

include "hp.stacc.defs"

define(MAXSTACK,100)
define(NOMATCH,1)
define(FAILURE,2)
define(ACCEPT,3)

   include "hp_com.r.i"

   integer state, i, l
   integer getlin, getarg, length

   logical sound

   call initialize
   if (getarg (1, line, MAXLINE) ~= EOF) {
      l = 1
      for (i = 1; getarg (i, line (l), MAXLINE - l) ~= EOF; i += 1) {
         l = length (line) + 1
         line (l) = ' 'c
         l += 1
         }
      scanptr = 0
      call getchar
      call expression (state)
      if (sound (1))
         call print (STDOUT, "*f*n.", stack (sp))
      }
   else
      while (getlin (line, STDIN) ~= EOF) {
         scanptr = 0
         call getchar
         call expression (state)
         }

   stop
   end



include "hp.stacc.r"



# push --- push one item onto the stack

   subroutine push (stuff)
   longreal stuff

   include "hp_com.r.i"

   if (sp >= MAXSTACK) {
      call remark ("stack overflow.")
      state = FAILURE
      }
   else {
      sp += 1
      stack (sp) = stuff
      }

   return
   end



# sound --- sound out the depth of the stack

   logical function sound (depth)
   integer depth

   include "hp_com.r.i"

   if (sp < depth) {
      call remark ("stack underflow.")
      sound = .false.
      state = FAILURE      # to insure immediate exit from expression
      }
   else
      sound = .true.

   return
   end



# getchar --- get next character from input line

   subroutine getchar

   include "hp_com.r.i"

   scanptr += 1
   char = line (scanptr)

   return
   end



# initialize --- set things up for everone else

   subroutine initialize

   include "hp_com.r.i"

   sp = 0

   return
   end
