#  otg$rorglb --- generate a relative origin in the link frame

   subroutine otg$rorglb (address)
   integer address

   integer group_data (2)


DB call print (TTY, "Relative org in LB% to *,-8i*n"s, address)
   group_data (1) = RELORGLB_GROUP * BIT8 + 1
   group_data (2) = address

   call group (group_data)
   return
   end
