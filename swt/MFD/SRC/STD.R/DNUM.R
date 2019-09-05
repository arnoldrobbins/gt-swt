# dnum --- generate or interpret legal disk numbers

   character arg (MAXARG)
   integer getarg

   if (getarg (1, arg, MAXARG) == EOF)
      call generate_number
   else
      call interpret_number (arg)

   stop
   end



# generate_number --- generate a legal disk number

   subroutine generate_number

   integer dtype, controller, unit, headoff, nheads,
         dnum, pack_size, max_heads, i
   integer equal, input, strbsr
   bool is_cmd
   character str (MAXLINE)

   string_table pos, text _
      / 16r16, "cmd" / 4, "fhd"     / 1, "fhd4000" / 2, "floppy"  _
      / 5, "mhd32"   / 0, "mhd4000" / 3, "mhd8"    / 6, "smd"


   headoff = 0
   nheads = 0

   ### get type of disk drive:

   dtype = -1
   repeat {
      if (input (STDIN, "Disk type: *s.", str) == EOF)
         return
      call mapstr (str, LOWER)
      i = strbsr (pos, text, 1, str)
      if (i == EOF) {
         call print (ERROUT, "Types are:*n"s)
         for (i = 1; i <= pos (1); i += 1)
            call print (ERROUT, " *s"s, text (pos (i + 1) + 1))
         call putch (NEWLINE, ERROUT)
         }
      else
         dtype = text (pos (i))
      } until (dtype ~= -1)

   if (dtype == 16r16) {   # cartridge disk?
      is_cmd = TRUE
      repeat {
         if (input (STDIN, "Fixed or removable part? *s.", str) == EOF)
            return
         call mapstr (str, LOWER)
         select
            when (equal (str, "fixed"s) == YES)
               dtype = 6
            when (equal (str, "removable"s) == YES)
               nheads = 1
         ifany
            break
         }
      }
   else
      is_cmd = FALSE


   ### get head configuration:

   select (dtype)
      when (3, 4, 5) {  # mhd8, fhd, mhd32
         nheads = -1
         repeat {
            if (input (STDIN, "Top or bottom surface: *s.", str) == EOF)
               return
            call mapstr (str, LOWER)
            if (equal (str, "top"s) == YES)
               nheads = 0
            elif (equal (str, "bottom"s) == YES)
               nheads = 1
            } until (nheads ~= -1)
         }

      when (6) {  # SMD or fixed part of CMD
         if (is_cmd) {
            repeat
               if (input (STDIN, "32, 64 or 96 MB: *i.", pack_size) == EOF)
                  return
               until (pack_size == 32 || pack_size == 64
                        || pack_size == 96)
            pack_size -= 16   # adjust for removable pack
            }
         else {
            repeat
               if (input (STDIN, "80 or 300 MB: *i.", pack_size) == EOF)
                  return
               until (pack_size == 80 || pack_size == 300)
            }

         select (pack_size)
            when (16)
               max_heads = 1
            when (48)
               max_heads = 3
            when (80)
               max_heads = 5
            when (300)
               max_heads = 19

         repeat {
            if (input (STDIN, "First head (0- ): *i.", headoff) == EOF
                  || input (STDIN, "Number of heads: *i.", nheads) == EOF)
               return
            if (headoff < 0 || nheads < 0)
               call remark ("head numbers must be non-negative"s)
            elif (headoff + nheads > max_heads)
               call print (ERROUT, "can't have more than *i heads*n"s,
                     max_heads)
            elif (and (headoff, 1) ~= 0)
               call remark ("starting head must be even"s)
            elif (headoff + nheads < max_heads && and (nheads, 1) ~= 0)
               call remark ("odd head must be last"s)
            else
               break
            }
         if (is_cmd)
            headoff += 16  # this bit indicates fixed surfaces
         }


   ### get controller number:

   repeat
      if (input (STDIN, "Controller (0 or 1): *i.", controller) == EOF)
         return
      until (0 <= controller && controller <= 1)


   ### get unit number:

   repeat {
      if (input (STDOUT, "Unit (0-3): *i.", unit) == EOF)
         return
      } until (0 <= unit && unit <= 3)



   dnum = and (ls (headoff, 11), :170000) _
        + and (ls (nheads, 7),     :7400) _
        + and (ls (controller, 7),  :200) _
        + and (ls (dtype, 3),       :170) _
        + and (nheads,                :1)

   if (dtype == 2)   # floppy unit number
      dnum += unit
   else
      dnum += and (ls (unit, 1), 6)

   call print (STDOUT, "*,-8i*n"s, dnum)

   return
   end



# interpret_number --- interpret a disk number

   subroutine interpret_number (str)
   character str (ARB)

   integer dnum, headoff, nheads, controller, dtype, unit, i
   integer gctoi, getarg

   i = 1
   dnum = gctoi (str, i, 8)

   if (str (i) ~= EOS) {
      call print (ERROUT, "*s: can't recognize a disk number*n.", str)
      return
      }

   headoff = rs (and (dnum, :170000), 11)
   nheads = rs (and (dnum, :7400), 7) + and (dnum, 1)
   controller = rs (and (dnum, :200), 7)
   dtype = rs (and (dnum, :170), 3)

   if (dtype == 2)   # floppy
      unit = and (dnum, :7)
   else
      unit = rs (and (dnum, :6), 1)

   select (dtype)
      when (0)
         call print (STDOUT, "Controller 4000 moving head disk*n"s)
      when (1)
         call print (STDOUT, "Controller 4000 fixed head disk*n"s)
      when (2)
         call print (STDOUT, "Floppy disk*n"s)
      when (3)
         call print (STDOUT,
               "Controller 4003 moving head disk (8 sector/track)*n"s)
      when (4)
         call print (STDOUT, "Controller 4003 fixed head disk*n"s)
      when (5)
         call print (STDOUT,
               "Controller 4003 moving head disk (32 sector/track)*n"s)
      when (6) {
         call print (STDOUT, "Controller 4004 "s)
         if (getarg (2, i, 1) ~= EOF) {   # interpret as CMD
            call print (STDOUT, "cartridge module disk "s)
            if (and (dnum, :100000) ~= 0) {
               call print (STDOUT, "(fixed part)*n"s)
               headoff -= 16  # adjust head offset
               }
            else
               call print (STDOUT, "(removable part)*n"s)
            }
         else
            call print (STDOUT, "storage module disk*n"s)
         }

   else {
      call remark ("unrecognizable disk type"s)
      return
      }

   call print (STDOUT, "   controller *i, unit *i*n"s, controller, unit)

   if (dtype < 2 || dtype > 5)
      call print (STDOUT, "   first head: *i, number of heads: *i*n"s,
            headoff, nheads)

   return
   end
