# otg$entlb --- enter an absolute entry definition group
#
#               address is LB% + offset

   subroutine otg$entlb (name, offset)
   character name (ARB)
   integer offset

   integer group_data (18), len, i
   integer ctoc, ctop, mod
   character temp (PMA_NAME_LEN)


   group_data (1) = ABSENTLB_GROUP * BIT8 + 1
   group_data (2) = offset

   len = ctoc (name, temp, PMA_NAME_LEN)
   if (mod (len, 2) ~= 0) {         # See if length is odd
      temp (len + 1) = ' 'c         # Blank fill if so
      temp (len + 2) = EOS
      }

   i = 1
   len = ctop (temp, i, group_data (3), 16)
DB call print (ERROUT, "   len = *i*n"s, len)
   group_data (1) += len / 2
DB call print (ERROUT, "otg$entlb: ENT *,#p LB%+'*,-8i*n"s,
DB                      len, group_data (3), offset)

   call group (group_data)
   return
   end
