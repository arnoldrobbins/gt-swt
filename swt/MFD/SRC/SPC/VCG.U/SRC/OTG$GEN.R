# otg$gen --- create a generic instruction group

   subroutine otg$gen (opcode)
   integer opcode

   include OTG_COMMON

   integer group_data (2)


DB call print (ERROUT, "otg$gen: opcode is *,-8i*n"s, opcode)

   PB_here += 1

   group_data (1) = GENERIC_GROUP * BIT8 + 1
   group_data (2) = opcode

   call group (group_data)
   return
   end
