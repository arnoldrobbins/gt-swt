#  otg$endpb --- generate a relative end group
#
#                start address is PB% + offset

   subroutine otg$endpb (offset)
   integer offset

   integer group_data (2)


DB call print (ERROUT, "otg$endpb: end offset *,-8i*n"s, offset)
   group_data (1) = RELEND_GROUP * BIT8 + 1
   group_data (2) = offset
   call group (group_data)
   return
   end
