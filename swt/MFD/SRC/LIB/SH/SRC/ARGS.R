# clr_args --- initialize argument storage table

   subroutine clr_args

   include ARGS_COMMON

   for (Next_arg -= 1; Next_arg > 0; Next_arg -= 1)
      call lsfree (Arg_table (ARG_TEXTPTR, Next_arg), ALL)
   Next_arg = 1

   return
   end



# putarg --- place argument in storage area, record it in arg_table

   integer function putarg (arg, node)
   pointer arg
   integer node

   include ARGS_COMMON

   if (Next_arg > MAXARGS) {
      call errmsg (arg, 1, "too many arguments"p)
      putarg = ERR
      }
   else {
      Arg_table (ARG_TEXTPTR, Next_arg) = arg
      Arg_table (ARG_NODE, Next_arg) = node
      Next_arg += 1
      putarg = OK
      }

   return
   end



# init_args --- initialize argument storage areas

   subroutine init_args

   include ARGS_COMMON

   Next_arg = 1

   return
   end



# setup_args --- copy argument pointers to SWT$CM.Arg_v for execution

   integer function setup_args (n)
   integer n

   include SWT_COMMON
   include ARGS_COMMON

   integer first, last

   setup_args = OK
   Arg_c = 0

   for (last = Next_arg - 1; last > 0; last -= 1)  # find last arg
      select
         when (Arg_table (ARG_NODE, last) == n)
            break
         when (Arg_table (ARG_NODE, last) < n)
            return

   if (last <= 0)    # no arguments belonging to this node
      return

   for (first = last - 1; first > 0; first -= 1)   # find first arg
      if (Arg_table (ARG_NODE, first) ~= n)
         break

   for (first += 1; first <= last; first += 1) {   # copy arg pointers
      Arg_c += 1
      Arg_v (Arg_c) = Arg_table (ARG_TEXTPTR, first)
      }

   return
   end



# access_arg --- access saved argument pointer

   pointer function access_arg (back_no, arg_no)
   integer back_no, arg_no

   include SAVE_COMMON
   include CI_COMMON

   integer level_no, cn, i, j, arg_table (2, MAXARGS, ARB)
   equivalence (arg_table (1, 1, 1), Save_arg_table (1, 1))

   access_arg = EOF

   level_no = Ci_file - back_no
   if (level_no < 1 || level_no > Ci_file)   # can't allow this
      return

   cn = Save_curnode (level_no)
   for (i = 1; i < Save_next_arg (level_no); i += 1)
      if (arg_table (2, i, level_no) >= cn)
         break

   for (j = 0; i < Save_next_arg (level_no); i += 1)
      if (arg_table (2, i, level_no) ~= cn)  # no such argument
         return
      elif (j == arg_no)
         return (arg_table (1, i, level_no))
      else
         j += 1

   return
   end
