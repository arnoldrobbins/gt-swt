#  otg$orglb --- generate an absolute origin in the link frame
#
#                address is LB% + offset

   subroutine otg$orglb (offset)
   integer offset

   integer group_data (2)


DB call print (ERROUT, "otg$orglb: LB%+'*,-8i*n"s, offset)
   group_data (1) = ABSORGLB_GROUP * BIT8 + 1
   group_data (2) = offset

   call group (group_data)
   return
   end
