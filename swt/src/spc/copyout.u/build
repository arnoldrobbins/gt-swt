# build -- build 'copyout'

   declare _search_rule = "^int,^var,=bin=/&"

   rp copyout.r
   spool$.f> include >>copyout.f
   fc copyout.f
   ld -u copyout.b
