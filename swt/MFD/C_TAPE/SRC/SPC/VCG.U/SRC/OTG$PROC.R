#  otg$proc --- procedure definition group

   subroutine otg$proc (pb_size, lb_size, lb_offset, sb_offset, flag)
   integer pb_size, lb_size, lb_offset, sb_offset, flag

   include OTG_COMMON

   bool missin

   integer group_data (5)

   file_mark markf

DB call print (ERROUT, "otg$proc:*n"s)

#     set the group control word to a procedure definition

   group_data (1) = PROCDEF_GROUP * BIT8


#     check for a missing link size. if missing, then the
#     group is a pre-42V mode procedure definition, else
#     everything should be there.

   if (missin (lb_size)) {
DB    call print (ERROUT, "   Procedure group is 1 word *n"s)
      group_data (1) = group_data (1) + 1
      group_data (2) = pb_size
      }

   else {
DB    call print (ERROUT, "   Procedure group is 4 words*n"s)
      group_data (1) = group_data (1) + 4
      group_data (2) = pb_size
      group_data (3) = lb_size
      group_data (4) = lb_offset
      group_data (5) = sb_offset
      }

   if (flag == INIT_PROC)
      # Write a dummy proc definition block the first time around.
      # We'll fill this in when we find out how much space we need.
      {
      Proc_start = markf (Fd)
DB    call print (ERROUT, "   proc start mark at *l*n"p, Proc_start)
      }

   else if (flag == FIXUP_PROC)
      # Back up to procedure definition block for the
      # current proc and fill the actual values... (the
      # second call to otg$proc should have good values)
      # Called after an end block is output and we know
      # the size of the proc and link frames
      # Hope that someone called otg$blk (PREFIX_BLK).
      {
      End_mark = markf (Fd)
DB    call print (ERROUT, "   proc end mark at *l*n"s, End_mark)
      call seekf (Proc_start, Fd)
      }

   else if (flag == RESET_PROC)
      {
      call flush
      call seekf (End_mark, Fd)
DB    call print (ERROUT, "   reset proc to end mark*n"s)
      return
      }

   else
      call print (ERROUT, "otg$proc: illegal flag arg*n"p)

   call group (group_data)
   return
   end
