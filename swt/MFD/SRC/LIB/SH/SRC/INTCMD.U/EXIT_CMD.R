# exit_cmd --- terminate execution of a command file

   subroutine exit_cmd

   include CI_COMMON

   integer i, nlevels
   integer ctoi, getarg
   character arg (5)

   if (getarg (1, arg, 5) == EOF)
      nlevels = 1
   else {
      i = 1
      nlevels = ctoi (arg, i)
      }

   for (i = Ci_file; i > 0 && nlevels > 0; {i -= 1; nlevels -= 1}) {
      call wind (Ci_fd (i))
      call lsfree (Ci_buf (i), ALL)
      }

   stop
   end
