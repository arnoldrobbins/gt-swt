# nargs_cmd --- output number of arguments

   subroutine nargs_cmd

   include SAVE_COMMON
   include CI_COMMON

   character arg (10)
   integer level_no, back_no, i, j, cn, arg_table (2, MAXARGS, ARB)
   integer getarg, ctoi
   equivalence (arg_table (1, 1, 1), Save_arg_table (1, 1))

   if (getarg (1, arg, 10) == EOF)   # default:  back 1 level
      back_no = 1
   else {
      i = 1
      back_no = ctoi (arg, i)
      }

   level_no = Ci_file - back_no
   if (level_no < 1 || level_no > Ci_file)   # can't allow this
      j = 1
   else {
      cn = Save_curnode (level_no)
      for (i = 1; i < Save_next_arg (level_no); i += 1)
         if (arg_table (2, i, level_no) >= cn)
            break

      for (j = 0; i < Save_next_arg (level_no); i += 1)
         if (arg_table (2, i, level_no) ~= cn)  # no such argument
            break
         else
            j += 1
      }

   call print (STDOUT, "*i*n"s, j - 1)

   stop
   end
