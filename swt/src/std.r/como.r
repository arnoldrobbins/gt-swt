# como --- divert command output

   include PRIMOS_KEYS

   integer key, append, pause, ap, i, file (16), code, pwd (3)
   integer getarg, getto

   character arg (MAXARG)

   key = 8r152
   append = NO
   pause  = NO

   for (ap = 1; getarg (ap, arg, MAXARG) ~= EOF; ap = ap + 1) {
      if (arg (1) == '-'c) {
         for (i = 2; arg (i) ~= EOS; i = i + 1) {
            if (arg (i) == 't'c | arg (i) == 'T'c)       # turn on tty output
               key = xor (and (key, :177774), 2)
            else if (arg (i) == 'n'c | arg (i) == 'N'c)  # turn off tty output
               key = xor (and (key, :177774), 1)
            else if (arg (i) == 'c'c | arg (i) == 'C'c) {   # append or continue
               append = YES
               pause = NO
               }
            else if (arg (i) == 'p'c | arg (i) == 'P'c) {   # pause
               append = NO
               pause = YES
               }
            else
               call error ("Usage: como {-{c|n|p|t}} [<pathname>].")
            }  # for (...)
         }  # if (...)
      else {
         ap = 0
         key = xor (and (key, :177707), :20)
         pause = NO
         break
         }
      }  # for (...)

   if (pause == YES)
      key = xor (and (key, :177707), :10)
   else if (append == YES)
      key = xor (and (key, :177607), :60)

   if (ap == 0) {
      if (getto (arg, file, pwd, 0) == ERR)
         call error ("bad pathname.")
      }
   else
      file (1) = "  "

   call como$$ (key, file, 32, 0, code)
   call errpr$ (KIRTN, code, 0, 0, 0, 0)

   stop
   end
