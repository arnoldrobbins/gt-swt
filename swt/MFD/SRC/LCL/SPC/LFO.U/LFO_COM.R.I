#  lfo_com.r.i --- common blocks for the lfo program

   bool space
   integer sys_info (13), user_info (43)
   common /lfo$cm/ sys_info, user_info, space

   integer nusr, cptick, clrate

   equivalence (nusr, sys_info (11)),
               (cptick, sys_info (12)),
               (clrate, sys_info (13))

   integer utype, lidate, litime
   character name (16), project (16)
   long_int cptime, iotime

   equivalence (utype, user_info (2)),
               (lidate, user_info (3)),
               (litime, user_info (4)),
               (name, user_info (5)),
               (project, user_info (21)),
               (cptime, user_info (37)),
               (iotime, user_info (39))
