# arg_cmd --- output argument to previous nesting level file

   subroutine arg_cmd

   character arg (10)
   integer arg_no, back_no, i
   integer getarg, ctoi
   pointer ptr
   pointer access_arg

   if (getarg (1, arg, 10) == EOF)   # nothing to do here
      return
   else {
      i = 1
      arg_no = ctoi (arg, i)
      }

   if (getarg (2, arg, 10) == EOF)   # default:  back 1 level
      back_no = 1
   else {
      i = 1
      back_no = ctoi (arg, i)
      }

   ptr = access_arg (back_no, arg_no)
   if (ptr == EOF)
      call putch (NEWLINE, STDOUT)
   else {
      call lsputf (ptr, STDOUT)
      call putch (NEWLINE, STDOUT)
      }

   stop
   end
