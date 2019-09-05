# otg$xtip --- generate an indirect pointer to external refernce
#

   subroutine otg$xtip (name)
   character name (ARB)

   integer group_data (17), len, i
   integer ctoc, ctop, mod
   character temp (PMA_NAME_LEN)

   include OTG_COMMON

   group_data (1) = IPEXTERN_GROUP * BIT8

   len = ctoc (name, temp, PMA_NAME_LEN)
   if (mod (len, 2) ~= 0) {        # See if length is odd
      temp (len + 1) = ' 'c         # Blank fill if so
      temp (len + 2) = EOS
      }

   i = 1
   len = ctop (temp, i, group_data (2), 16)
   group_data (1) += len / 2
DB call print (ERROUT, "otg$xtip: IP *,#s*n"s, len, temp)

   LB_here += 2

   call group (group_data)
   return
   end
