# build --- rebuild SWT initialization program

   declare _search_rule = "^int,^var,&,=bin=/&"

   rp -ag swt.r
   fc swt.f -d0op
   init_s.s> include >_init_s.s
   pmac _init_s.s -b init_s.b
   del _init_s.s
   pmac fixlib.s

   link_swt
