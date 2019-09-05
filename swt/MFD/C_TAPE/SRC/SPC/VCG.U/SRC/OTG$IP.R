# otg$ip --- generate an indirect pointer to an address
#
#            'ip_group' tells whether the reference is
#            proc frame or link frame relative

   subroutine otg$ip (offset, ip_group)
   integer offset
   integer ip_group

   include OTG_COMMON

   character ch

   integer group_data (2)

   group_data (1) = ip_group * BIT8 + 1

   group_data (2) = offset

   if (ip_group == IPPROC_GROUP)
      {
      PB_here += 2
      ch = 'P'c
      }
   else
      {
      LB_here += 2
      ch = 'L'c
      }

DB call print (ERROUT, "otg$ip: IP to *cB + '*,-8i*n"s, ch, offset)

   call group (group_data)
   return
   end
