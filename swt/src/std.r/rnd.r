# rnd --- generate random numbers

   integer lwb, upb, num, i, seed, td (10)
   integer gctoi

   character arg (MAXARG)

   string dash_l "-l"
   string dash_u "-u"
   string dash_n "-n"
   string s1 "1"
   string s100 "100"


   call getkwd (dash_l, arg, MAXARG, s1)     # get lower bound
   i = 1
   lwb = gctoi (arg, i, 10)

   call getkwd (dash_u, arg, MAXARG, s100)   # get upper bound
   i = 1
   upb = gctoi (arg, i, 10)

   call getkwd (dash_n, arg, MAXARG, s1)     # get number of values
   i = 1
   num = gctoi (arg, i, 10)

   call timdat (td, 10)
   seed = 0
   do i = 1, 10
      seed = seed + td (i)

   call rnd (iabs (seed))
   for (i = 1; i <= num; i = i + 1)
      call print (STDOUT, "*i*n"p, ints ((upb - lwb) * rnd (0) + lwb))

   stop
   end
