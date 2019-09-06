# otg$uii --- generate a uii request group

   subroutine otg$uii (def)
   integer def


   integer group_data (2)


DB call print (ERROUT, "otg$uii: hardware def = *,-8i*n"s, def)
   group_data (1) = UIIREQ_GROUP * BIT8 + 1
   group_data (2) = def
   call group (group_data)
   return
   end
