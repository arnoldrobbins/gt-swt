# ctime --- print accumulated cpu time

   integer td (11)
   real ctime


   call timdat (td, 11)
   ctime = td (8)
   ctime = ctime / td (11)
   ctime = ctime + td (7)
   call print (STDOUT, "*,3r*n"p, ctime)

   stop
   end
