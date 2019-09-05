# clear_to_eol --- clear screen to end of line

   subroutine clear_to_eol (row, col)
   integer row, col

   include SE_COMMON

   integer c, flag, hardware

   select (Term_type)
      when (B200, B150, FOX, SBEE, ADDS100, HP2621, IBM, ANP,
            H19, TRS80, ADM31, Z19, TVI, HZ1510, VC4404, VI200,
            TS1, HP9845, BANTAM, HP2626, MICROB, PT45, NBY,
            NETRON, ADM5, VIEWPT, INFO, HP2648, TERAK, HZ1420,
            BEE2, VIEWPT90, ADM42, PST100, VT100, FORSYS)
         hardware = YES
   else
      if (Term_type == ADDS980 && row < Nrows)
         hardware = YES
      else
         hardware = NO

   flag = NO

   do c = col, Ncols
      if (Screen_image (c, row) ~= " "c) {
         Screen_image (c, row) = " "c
         if (hardware == YES)
            flag = YES
         else {
            call position_cursor (row, c)
            call send (" "c)
            }
         }
   if (flag == YES) {
      call position_cursor (row, col)
      select (Term_type)
         when (B200, B150, SBEE, ADDS100, HP2621, HP2626, VIEWPT90,
               HP2648, INFO, HP9845, H19, Z19, VI200, MICROB, PT45) {
            call t1ou (ESC)
            call t1ou ('K'c)
            }
         when (FOX, IBM) {
            call t1ou (ESC)
            call t1ou ('I'c)
            }
         when (BANTAM) {
            call t1ou (ESC)
            call t1ou ('I'c)
            call senddelay (20)
            }
         when (ADDS980) {
            call t1ou (NEWLINE)
            Currow += 1
            Curcol = 1
            }
         when (HZ1510) {
            call t1ou (ESC)
            call t1ou (SI)
            }
         when (ANP) {
            call t1ou (ESC)
            call t1ou ('L'c)
            }
         when (NETRON) {
            call t1ou (ENQ)
            do c = 1, 51
               call t1ou (NUL)
            }
         when (TRS80)
            call t1ou (RS)
         when (ADM31, TVI, VC4404, TS1, ADM5, VIEWPT, ADM42) {
            call t1ou (ESC)
            call t1ou ('T'c)
            }
         when (BEE2)
            call t1ou (CTRL_L)
         when (HZ1420)
            call t1ou (SI)
         when (TERAK)
            call t1ou (GS)
         when (NBY)
            call t1ou (EM)
         when (PST100) {
           call t1ou (ESC)
           call t1ou ('['c)
           call t1ou ('0'c)
           call t1ou ('K'c)
           }
         when (VT100) {
           call t1ou (ESC)
           call t1ou ('['c)
           call t1ou ('K'c)
           }
         when (FORSYS) {
            call t1ou (FS)
            call t1ou ('Z'c)
            }
      }

   return
   end
