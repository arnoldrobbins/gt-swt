#  otg$ecb --- generate a group to generate an ecb

   subroutine otg$ecb (start, stack_size, arg_start, arg_count, lb_offset, keys)
   integer start, stack_size, arg_start, arg_count, lb_offset, keys

   include OTG_COMMON

   integer group_data (7)


DB call print (ERROUT, "otg$ecb: Start *,-8i Stack *,-8i Arg_start *,-8i*n"s,
DB                              start, stack_size, arg_start)
DB call print (ERROUT, "           Arg_count *,-8i Offset *,-8i Keys *,-8i*n"s,
DB                              arg_count, lb_offset, keys)

   if (Current_Base == PB_REG)
      PB_here += 16
   else
      LB_here += 16

   group_data (1) = ECB_GROUP * BIT8 + 6
   group_data (2) = start
   group_data (4) = arg_start
   group_data (5) = arg_count
   group_data (6) = lb_offset
   group_data (7) = keys

   if (stack_size ~= (stack_size / 2) * 2)
      group_data (3) = stack_size + 1
   else
      group_data (3) = stack_size

   call group (group_data)
   return
   end
