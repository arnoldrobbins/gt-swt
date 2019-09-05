#  otg$rorg --- generate a relative origin in the procedure frame

   subroutine otg$rorg (offset)
   integer offset

   integer group_data (2)


DB call print (ERROUT, "otg$rorg: relative org in PB% to *,-8i*n"s, offset)
   group_data (1) = RELORG_GROUP * BIT8 + 1
   group_data (2) = offset

   call group (group_data)
   return
   end
