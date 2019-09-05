# otg$endlb --- generate an absolute end group in the link base

   subroutine otg$endlb (addr)
   integer addr

   integer group_data (2)


DB call print (TTY, "Absolute link end address is *,-8i*n"s, addr)
   group_data (1) = ABSENDLB_GROUP * BIT8 + 1
   group_data (2) = addr
   call group (group_data)
   return
   end
