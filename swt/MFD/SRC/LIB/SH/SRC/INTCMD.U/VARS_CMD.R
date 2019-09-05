# vars_cmd --- print shell variables

   subroutine vars_cmd

   include SV_COMMON
   include CI_COMMON

   ARG_DECL
   integer i, j, nl, col, ll, llend
   integer ctoc, svsave, svrest
   character name (MAXLINE), value (MAXLINE)
   bool trace

   PARSE_COMMAND_LINE ("acglvr<os>s<os>"s, _
         "Usage: vars { -{a|c|g|l|v|r[<file>]|s[<file>]} }"p)

   if (ARG_PRESENT (r) && ARG_PRESENT (s))
      call error ("can't save and restore simultaneously"p)
   select
      when (ARG_PRESENT (s)) {
         ARG_DEFAULT_STR (s, "=varsfile="s)
         trace = (and (Ci_trace, SV_TRACE) ~= 0)
         if (svsave (ARG_TEXT (s), trace) == ERR)
            call error ("can't save variables"s)
         }
      when (ARG_PRESENT (r)) {
         ARG_DEFAULT_STR (r, "=varsfile="s)
         trace = (and (Ci_trace, SR_TRACE) ~= 0)
         if (svrest (ARG_TEXT (r), trace) == ERR)
            call error ("can't restore variables"s)
         }
   ifany
      stop

   if (ARG_PRESENT (g) || ARG_PRESENT (l))
      llend = 1
   else
      llend = Sv_ll
   for (ll = Sv_ll; ll >= llend; ll -= 1) {
      col = 0
      for (i = 1; i <= SV_MAXHASH; i += 1) {
         for (j = Sv_tbl (ll, i); j ~= LAMBDA;
               j = Sv_mem (j + SV_HLINK)) {
            nl = ctoc (Sv_mem (Sv_mem (j + SV_NAME)), name, MAXLINE)
            if (~ARG_PRESENT (a) && ~ARG_PRESENT (l) && name (1) == '_'c)
               next
            if (ARG_PRESENT (v) || ARG_PRESENT (l))
               nl += 5 _
                  + ctoc (Sv_mem (Sv_mem (j + SV_VALUE)), value, MAXLINE)
            if (col > 0 && col + nl + (13 - mod (col, 13)) >= 80) {
               call putch (NEWLINE, STDOUT)
               col = nl
               }
            else {
               if (col > 0) {
                  repeat {
                     col += 1
                     call putch (' 'c, STDOUT)
                     } until (mod (col, 13) == 0)
                  }
               col += nl
               }
            call putlin (name, STDOUT)
            if (ARG_PRESENT (v) || ARG_PRESENT (l))
               call print (STDOUT, " = '*s'"s, value)
            if (ARG_PRESENT (c)) {
               call putch (NEWLINE, STDOUT)
               col = 0
               }
            }
         }
      if (col > 0)
         call putch (NEWLINE, STDOUT)

      if ((ARG_PRESENT (g) || ARG_PRESENT (l)) && ll > 1)
         call putch (NEWLINE, STDOUT)
      }

   stop
   end
