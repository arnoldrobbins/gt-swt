# build --- build the SWT math library (vswtmath)
###         add in old math library (vswtml)
###         create one single library, called vswtmath

   declare _search_rule = "^int,^var,=bin=/&"

   ### clean out 'obj' just in case any old binaries are still around
   del -s obj

   ### Compile all the PMA routines:
   pmac ([files .s$ -f src]) -b obj/([files .s$ src | basename]).b

   ### Compile the old math routines:
   rp swtmlb.r -a
   fc swtmlb.f -h -b obj/swtmlb.b    # need the huge option because don't know big arrays are

   echo >vswtmath.b
   >> cto | x
   edb vswtmath.b _vswtmath
   BRIEF
   RFL
   INSERT *>obj>swtmlb.b
   INSERT *>obj>asin$m.b
   INSERT *>obj>atan$m.b
   INSERT *>obj>powr$m.b
   INSERT *>obj>rand$m.b
   INSERT *>obj>sin$m.b
   INSERT *>obj>sinh$m.b
   INSERT *>obj>tan$m.b
   INSERT *>obj>tanh$m.b
   INSERT *>obj>exp$m.b
   INSERT *>obj>ln$m.b
   INSERT *>obj>sqrt$m.b
   INSERT *>obj>err$m.b
   INSERT *>obj>dble$m.b
   INSERT *>obj>dint$m.b
   SFL
   QUIT
-EOF

   >> cto | x
   r lib>libedb
   _vswtmath vswtmath 0
-EOF
