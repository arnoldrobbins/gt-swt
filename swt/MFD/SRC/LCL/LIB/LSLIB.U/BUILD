# build --- rebuild linked string library (vlslb)

   declare _search_rule = "^int,^var,=bin=/&"

   rp -a lslib.r
   fc lslib.f

   >> cto | x
   edb lslib.b _vlslb
   BRIEF
   RFL
   COPY ALL
   SFL
   ET
   QUIT
-EOF

   >> cto | x
   r lib>libedb
   _vlslb vlslb 0
-EOF
