#  otg$data --- generate data blocks

   subroutine otg$data (value, repeat)
   integer value, repeat

   include OTG_COMMON

   integer group_data (3), words
   bool missin, valid


   if (missin (repeat) || repeat == 1) {
DB    call print (ERROUT, "Single data value *,-8i*n"s, value)
      group_data (1) = DATA_GROUP * BIT8 + 1
      group_data (2) = value
      valid = TRUE
      words = 1
      }
   else if (repeat > 1) {
DB    call print (ERROUT, "*i data items of value *,-8i*n"s, repeat, value)
      group_data (1) = REPEATDATA_GROUP * BIT8 + 2
      group_data (2) = value
      group_data (3) = repeat
      valid = TRUE
      words = repeat
      }
   else {
      call print (ERROUT, "Illegal repeat count (*i) specified*n"s, repeat)
      valid = FALSE
      }

   if (valid)
      {
      if (Current_Base == PB_REG)
         PB_here += words
      else
         LB_here += words
      call group (group_data)
      }

   return
   end
