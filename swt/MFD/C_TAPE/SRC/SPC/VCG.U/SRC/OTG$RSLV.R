# otg$rslv --- generate a resolve-forward-reference group
#
#              This group is be generated when a forward-referenced
#              label is declared.  The referencing instruction(s)
#              must have their F bits (BIT14) set; the address
#              in each instruction group is either 0 or points to
#              a previous instruction referencing the same label.
#              'offset' is the 'base'-relative address of the last
#              instruction referencing the current target address.
#              The loader fills in the correct addresses for us.
#
#              In all cases, we expect that a LINK or PROC pseudo-
#              op has been processed to throw us into the correct
#              frame.

   subroutine otg$rslv (base, offset)
   integer base, offset

   integer group_data (2)
DB character ch
DB
DB if (base == PB_REG)
DB    ch = 'P'c
DB else
DB    ch = 'L'c
DB
DB call print (ERROUT, "otg$rslv: reference to *cB%+*,-8i*n"s, ch, offset)
   group_data (1) = RESOLVFR_GROUP * BIT8 + 1
   group_data (2) = offset
   call group (group_data)
   return
   end
