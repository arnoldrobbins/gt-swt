# fixp --- add parity bits and compress file, do other transforms

   include ARGUMENT_DEFS

   integer open, getarg, fixp, equal
   file_des in_fd, out_fd
   ARG_DECL
   integer case_map, control_map, cr_flag, null_flag
   integer fname (MAXPATH)
   string use "Usage: fixp [-mu | -ml] [-u] [-z] [-cl | -cd] [<in_path> [<out_path>]]"

   PARSE_COMMAND_LINE ("m<rs>u<f>z<f>c<rs>"s, use)
   if (ARG_PRESENT (u))
      control_map = 1
   else
      control_map = 0
   if (ARG_PRESENT (z))
      null_flag = 1
   else
      null_flag = 0
   if (ARG_PRESENT (m)) {
      call scopy (ARG_TEXT(m), 1, fname, 1)
      if (equal (fname, 'u's) == YES)
         case_map = 2
      elif (equal (fname, 'l's) == YES)
         case_map = 1
      else
         call error (use)
      }
   if (ARG_PRESENT (c)) {
      call scopy (ARG_TEXT(c), 1, fname, 1)
      if (equal (fname, 'd's) == YES)
         cr_flag = 2
      elif (equal (fname, 'l's) == YES)
         cr_flag = 1
      else
         call error (use)
      }

   if (getarg (1, fname, MAXPATH) ~= EOF) {
      in_fd = open (fname, READ)
      if (in_fd == ERR)
         call cant (fname)
      }
   else
      in_fd = STDIN

   if (getarg (2, fname, MAXPATH) ~= EOF) {
      out_fd = open (fname, WRITE)
      if (out_fd == ERR)
         call cant (fname)
      }
   else
      out_fd = STDOUT

   if (fixp (in_fd, out_fd, case_map, control_map, cr_flag, null_flag) ~= EOF)
      call error ("Problem in fixp.")

   stop
   end
