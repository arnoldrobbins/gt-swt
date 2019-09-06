# se --- screen editor

   subroutine main

   include SE_COMMON

   integer save_lword
   integer duplx$

   call initialize

   call break$ (DISABLE)      # disable break key

   save_lword = duplx$ (-1)   # save current terminal parameters
   call duplx$ (NOECHO)       # switch to half duplex
   Tty_state = save_lword     # make globally available

   call edit

   call duplx$ (save_lword)   # restore original terminal parameters

   call break$ (ENABLE)       # enable break key

   stop
   end
