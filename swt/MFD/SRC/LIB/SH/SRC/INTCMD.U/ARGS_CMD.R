# args_cmd --- output range of arguments

   subroutine args_cmd

   character arg (10)
   integer first_arg, last_arg, back_no, i
   integer getarg, ctoi
   pointer ptr
   pointer access_arg

   if (getarg (1, arg, 10) == EOF)
      first_arg = 1
   else {
      i = 1
      first_arg = ctoi (arg, i)
      }

   if (getarg (2, arg, 10) == EOF)
      last_arg = MAXARGS
   else {
      i = 1
      last_arg = ctoi (arg, i)
      }

   if (getarg (3, arg, 10) == EOF)
      back_no = 1
   else {
      i = 1
      back_no = ctoi (arg, i)
      }

   for (i = first_arg; i <= last_arg; i += 1) {
      ptr = access_arg (back_no, i)
      if (ptr == EOF)
         break
      call lsputf (ptr, STDOUT)
      call putch (NEWLINE, STDOUT)
      }

   stop
   end
