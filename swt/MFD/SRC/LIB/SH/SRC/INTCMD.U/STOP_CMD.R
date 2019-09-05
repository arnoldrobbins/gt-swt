# stop_cmd --- exit from the Subsystem (and possibly log out)

   subroutine stop_cmd

   include CI_COMMON
   include SWT_COMMON
   include HIST_COMMON

   character arg (MAXARG)
   integer rc, savestatus, logout
   integer getarg
   bool trace

   savestatus = YES

   if (getarg (1, arg, MAXARG) ~= EOF) {
      logout = YES   # any argument causes logout
      if (arg (1) ~= '-'c || arg (2) ~= EOS) {  # if arg is not "-"
         savestatus = NO
         call remove (arg)
         }
      }
   else
      logout = NO

   if (savestatus ~= NO) {
      trace = (and (Ci_trace, SV_TRACE) ~= 0)
      call svsave ("=varsfile="s, trace)

      if (H_on == YES && Isphantom == NO)
         call histsave ("=histfile="s)
      }

   if (logout ~= NO)
      call logo$$ (0, 0, 0, 0, intl (0), rc)

   stop
   end
