# rel_ent --- enter a relative entry definition group

   subroutine rel_ent (name, address)
   character name (ARB)
   integer address

   integer group_data (6), len, i
   integer ctoc, ctop
   character temp (9)


   group_data (1) = RELENT_GROUP * BIT8
   group_data (2) = address

   len = ctoc (name, temp, 9)
   if (len ~= (len / 2) * 2) {      # See if length is odd
      temp (len + 1) = ' 'c         # Blank fill if so
      temp (len + 2) = EOS
      }

   i = 1
   len = ctop (temp, i, group_data (3), 4)
   group_data (1) += ((len + 1) / 2) + 1
DB call print (TTY, "Relative entry name *,#s  Address *,-8i*n"s,
DB                      len, name, address)

   call group (group_data)
   return
   end
