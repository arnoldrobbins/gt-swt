# abs_end --- generate an absolute end group

   subroutine abs_end (addr)
   integer addr

   integer group_data (2)


DB call print (TTY, "Absolute end address is *,-8i*n"s, addr)
   group_data (1) = ABSEND_GROUP * BIT8 + 1
   group_data (2) = addr
   call group (group_data)
   return
   end
