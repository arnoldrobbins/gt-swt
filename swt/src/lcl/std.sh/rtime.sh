# rtime --- print the runtime of a command line

   if [nargs]
      hp 0 [ctime; {[args 1 999 3]} >/dev/tty; ctime]--

   else
      error "Usage: "[arg 0]" <command>"
   fi
