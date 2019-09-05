# build --- rebuild 'basys'

   declare _search_rule = "^int,^var,=bin=/&"

   (rp fc) ds.(r f)     # redo dynamic storage routines
   rp basys.r
   fc basys.f
   ld -u basys.b ds.b   # link using our own dynamic storage routines
