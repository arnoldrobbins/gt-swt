# slice --- slice out a section of a file

#  Usage:  slice (-i|-x) <start_pattern> [(-i|-x) <end_pattern>]

   character arg (MAXARG), start_pat (MAXPAT), end_pat (MAXPAT),
      line (MAXLINE)

   integer include_start, include_end, printing, end_given
   integer match, makpat, getarg, getlin, equal

   if (getarg (1, arg, MAXARG) == EOF)
      call usage
   call mapstr (arg, LOWER)
   if (equal (arg, "-i"s) == YES)
      include_start = YES
   elif (equal (arg, "-x"s) == YES)
      include_start = NO
   else
      call usage

   if (getarg (2, arg, MAXARG) == EOF)
      call usage
   if (makpat (arg, 1, EOS, start_pat) == ERR)
      call error ("start pattern is ill-formed.")

   if (getarg (3, arg, MAXARG) == EOF)
      end_given = NO
   else {
      call mapstr (arg, LOWER)
      if (equal (arg, "-i"s) == YES)
         include_end = YES
      elif (equal (arg, "-x"s) == YES)
         include_end = NO
      else
         call usage

      if (getarg (4, arg, MAXARG) == EOF)
         call usage
      if (makpat (arg, 1, EOS, end_pat) == ERR)
         call error ("end pattern is ill-formed.")

      end_given = YES
      }

   printing = NO
   while (getlin (line, STDIN) ~= EOF)
      if (printing == YES) {
         if (end_given == YES && match (line, end_pat) == YES) {
            if (include_end == YES)
               call putlin (line, STDOUT)
            break
            }
         call putlin (line, STDOUT)
         }
      elif (match (line, start_pat) == YES) {
         printing = YES
         if (include_start == YES)
            call putlin (line, STDOUT)
         }

   stop
   end



# usage --- print usage message, then die

   subroutine usage

   call error ("Usage:  slice (-i|-x) <start_pat> (-i|-x) <end_pat>.")

   end
