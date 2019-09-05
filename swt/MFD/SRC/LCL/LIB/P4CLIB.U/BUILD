# build --- build P4C Pascal run-time library 'p4clib'

   declare _search_rule = "^int,=bin=/&"

   rp -ag p4clib.r
   fc -d0o p4clib.f -b b1
   pmac p4clib.s -b b2

   >> cto | x
   edb b1 _p4clib
   brief
   rfl
   copy all
   newinf b2
   copy all
   sfl
   et
   quit
-EOF

   >> cto | x
   r lib>libedb
   _p4clib p4clib 0
-EOF
