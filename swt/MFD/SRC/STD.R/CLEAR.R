# clear -- clear a users terminal screen

   integer vtterm, vt$clr
   integer i, term_type (MAXTERMTYPE)

   if (vtterm (term_type) == ERR || vt$clr (i) == ERR)
      for (i = 1; i <= 25; i += 1)
         call putch (NEWLINE, STDOUT)

   stop
   end
