# argsto_cmd --- print arguments up to a delimiter

   subroutine argsto_cmd

   integer i, count, back_no, nd, st
   integer getarg, ctoi
   pointer ptr
   pointer access_arg
   character delim (MAXARG), arg (10)
   character lscmpk

   if (getarg (1, delim, MAXARG) == EOF)
      call error ("Usage: argsto <delim> [<count> [<start> [<levels>]]]"p)

   if (getarg (2, arg, 10) == EOF)
      count = 0
   else {
      i = 1
      count = ctoi (arg, i)
      }

   if (getarg (3, arg, 10) == EOF)
      st = 1
   else {
      i = 1
      st = ctoi (arg, i)
      }

   if (getarg (4, arg, 10) == EOF)
      back_no = 1
   else {
      i = 1
      back_no = ctoi (arg, i)
      }

   nd = 0
   ptr = access_arg (back_no, st)
   while (ptr ~= EOF && nd <= count) {
      if (lscmpk (ptr, delim) == '='c)
         nd += 1
      else if (nd == count) {
         call lsputf (ptr, STDOUT)
         call putch (NEWLINE, STDOUT)
         }
      st += 1
      ptr = access_arg (back_no, st)
      }

   stop
   end
