# shortlb.r.i --- declarations for shortcallable shortlb routines
#   EHS   02/27/82

   shortcall get$xs (4), put$xs (4), pek$xs (4), pok$xs (4), rdy$xs (4)
   shortcall s1c$xs (4), s2x$xs (4), gky$xs (2), sky$xs (2), stk$xs (4)
   shortcall atq$xs (4), abq$xs (4), rtq$xs (4), rbq$xs (4), tsq$xs (4)
   shortcall mkq$xs (4)

   character get$xs
   logical s1c$xs, s2c$xs, atq$xs, abq$xs, rtq$xs, rbq$xs, tsq$xs
   logical rdy$xs
   integer mkq$xs

   define (queue_control_block, real*8)
