# st_profile --- display statement count statistics attractively

#     usage:  st_profile [<count_file>] <source_file>


   character arg1 (MAXLINE), arg2 (MAXLINE), line (MAXLINE)
   string default_count_file "_st_count"

   integer count, source
   long_int number
   integer open, input, getarg, getlin


   if (getarg (1, arg1, MAXLINE) == EOF)
      call error ("Usage:  st_profile [<count_file>] <source_file>"p)
   if (getarg (2, arg2, MAXLINE) == EOF) {
      call scopy (arg1, 1, arg2, 1)
      call scopy (default_count_file, 1, arg1, 1)
      }

   count = open (arg1, READ)
   if (count == ERR)
      call cant (arg1)

   source = open (arg2, READ)
   if (source == ERR) {
      call close (count)
      call cant (arg2)
      }

   while (input (count, "*l"p, number) ~= EOF) {
      if (number == 0)
         call print (STDOUT, "          "p)
      else
         call print (STDOUT, "*10l"p, number)
      call putch (' 'c, STDOUT)
      call putch ('|'c, STDOUT)
      if (getlin (line, source) == EOF) {
         call remark ("premature end of source file"p)
         break
         }
      call putlin (line, STDOUT)
      }

   call close (source)
   call close (count)

   stop
   end
