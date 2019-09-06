# clrscreen --- clear screen

   subroutine clrscreen

   include SE_COMMON

   Curcol = 1                 # clearing screen homes cursor
   Currow = 1                 #  to upper left corner on all terminals

   select (Term_type)
      when (ADDS980, ADDS100, GT40, CG, ISC8001, ANP, NETRON, FORSYS,
            INFO, TERAK, VIEWPT90)
         call t1ou (FF)
      when (BANTAM, FOX) {
         call t1ou (ESC)
         call t1ou ('K'c)        # clear display and all tabs
         }
      when (TS1, VIEWPT) {
         call t1ou (ESC)
         call t1ou ('*'c)
         }
      when (TVT) {
         call t1ou (FF)          # home
         call t1ou (SI)          # erase to end of screen
         }
      when (B150, B200, SBEE, SOL, H19, Z19, MICROB, PT45) {
         call t1ou (ESC)
         call t1ou ('E'c)
         }
      when (1420, HZ1421, HZ1510) {
         call t1ou (ESC)
         call t1ou (FS)
         }
      when (ADM3A, TVI, VC4404, ADM5)
         call t1ou (SUB)
      when (VI200) {
         call t1ou (ESC)
         call t1ou ('v'c)
         }
      when (ADM31, ADM42) {
         call t1ou (ESC)
         call t1ou ('+'c)
         }
      when (IBM) {
         call t1ou (ESC)
         call t1ou ('L'c)
         }
      when (HP2621, HP2626, HP2648, HP9845) {
         call t1ou (ESC)            # home cursor
         call t1ou ('H'c)
         call t1ou (ESC)            # erase to end of screen
         call t1ou ('J'c)
         }
      when (TRS80) {
         call t1ou (FS)
         call t1ou (US)
         }
      when (NBY)
         call t1ou (US)
      when (PST100) {
         call t1ou (ESC)
         call t1ou ('?'c)
         }
      when (VT100) {
         call t1ou (ESC)      # Home the cursor
         call t1ou ('['c)
         call t1ou (';'c)
         call t1ou ('H'c)
         call t1ou (ESC)      # now clear the screen
         call t1ou ('['c)
         call t1ou ('2'c)
         call t1ou ('J'c)
         }
      when (BEE2) {
         call t1ou (CTRL_E)
         call t1ou (CTRL_K)
         }

   if (Term_type ~= IBM && Term_type ~= ANP && Term_type ~= PST100)
      call senddelay (20)

   return
   end
