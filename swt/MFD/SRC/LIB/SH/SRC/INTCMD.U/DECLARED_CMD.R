# declared_cmd --- check variable's existence

   subroutine declared_cmd

   include SV_COMMON

   integer i, level, decl_level
   integer ctoi, getarg, svfind
   character name (MAXARG), count (MAXARG)

   if (getarg (1, name, MAXARG) == EOF)
      call error ("Usage: declared <variable> [ <level offset> ]"p)

   if (getarg (2, count, MAXARG) == EOF)
      level = 0
   else {
      i = 1
      level = Sv_ll - ctoi (count, i)
      if (level <= 0)
         level = ERR
      }

   decl_level = svfind (name, i)
   if (decl_level == level || (level == 0 && decl_level ~= EOF))
      call putch ('1'c, STDOUT)
   else
      call putch ('0'c, STDOUT)
   call putch (NEWLINE, STDOUT)

   stop
   end
