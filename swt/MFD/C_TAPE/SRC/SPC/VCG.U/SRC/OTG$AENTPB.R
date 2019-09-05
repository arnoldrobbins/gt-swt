# otg$aentpb --- enter an absolute entry definition group
#
#                offset is offset

   subroutine otg$aentpb (name, offset)
   character name (ARB)
   integer offset

   integer group_data (18), len, i
   integer ctoc, ctop, mod
   character temp (PMA_NAME_LEN)


   group_data (1) = ABSENT_GROUP * BIT8 + 1
   group_data (2) = offset

   len = ctoc (name, temp, PMA_NAME_LEN)
   if (mod (len, 2) ~= 0) {         # See if length is odd
      temp (len + 1) = ' 'c         # Blank fill if so
      temp (len + 2) = EOS
      }

   i = 1
   len = ctop (temp, i, group_data (3), 16)
   group_data (1) += len / 2
DB call print (ERROUT, "otg$aentpb: ENT *,#s '*,-8i*n"s,
DB                      len, name, offset)

   call group (group_data)
   return
   end
