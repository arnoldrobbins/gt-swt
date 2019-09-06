# setscreen --- initialize screen and associated variables

   subroutine setscreen

   include SE_COMMON

   integer row, col

   select (Term_type)
      when (ADDS980, FOX, HZ1510, ADDS100, B150, ADM3A, IBM,
               HP2621, H19, Z19, TVI, BANTAM, ADM31, VC4404,
               VI200, TS1, HZ1421, HP2626, MICROB, PT45, NBY,
               ADM5, VIEWPT, INFO, HP2648, TERAK, HZ1420, VIEWPT90,
               ADM42, PST100, VT100) {
         Nrows = 24
         Ncols = 80
         }
      when (ANP) {
         Nrows = 24
         Ncols = 96
         }
      when (SOL, NETRON, TRS80) {
         Nrows = 16
         Ncols = 64
         }
      when (TVT) {
         Nrows = 16
         Ncols = 63
         }
      when (GT40) {
         Nrows = 32
         Ncols = 73
         }
      when (CG) {
         Nrows = 51
         Ncols = 85
         }
      when (ISC8001) {
         Nrows = 48
         Ncols = 80
         }
      when (B200, SBEE, FORSYS) {
         Nrows = 25
         Ncols = 80
         }
      when (HP9845, BEE2) {
         Nrows = 20
         Ncols = 80
         }

   call clrscreen    # clear physical screen, set cursor position

   Toprow = 1
   Botrow = Nrows - 2
   Cmdrow = Botrow + 1
   Topln = 1
   Sclen = -1

   do row = 1, Nrows             # now clear virtual screen
      do col = 1, Ncols
         Screen_image (col, row) = ' 'c

   do col = 1, Ncols             # and clear out the status line
      Msgalloc (col) = NOMSG

   Insert_mode = NO
   Invert_case = NO
   Rel_a = 'A'c
   Rel_z = 'Z'c

   return
   end
