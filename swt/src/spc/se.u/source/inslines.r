# inslines --- insert n blank lines starting at row on the screen

   subroutine inslines (row, n)
   integer row, n

   include SE_COMMON

   integer i, delay
   character blanks (MAXCOLS)
   data blanks / MAXCOLS * ' 'c /

   call position_cursor (row, 1)
   for (i = 1; i <= n; i += 1) {
      select (Term_type)
         when (VI200, HP2621, HP2626, HP2648, HP9845, PT45) {
            delay = 0
            call t1ou (ESC)
            call t1ou ('L'c)
            }
         when (TS1) {
            delay = 0
            call t1ou (ESC)
            call t1ou ('E'c)
            }
         when (H19, Z19, SBEE) {
            delay = 16
            call t1ou (ESC)
            call t1ou ('L'c)
            }
         when (ADDS100, VIEWPT90) {
            delay = 64
            call t1ou (ESC)
            call t1ou ('M'c)
            }
         when (ADDS980) {
            delay = 32
            call t1ou (ESC)
            call t1ou (SO)
            }
         when (TVI, ADM42) {
            delay = 32
            call t1ou (ESC)
            call t1ou ('E'c)
            }
        when (PST100) {
           delay = 0
           call t1ou (ESC)
           call t1ou ('['c)
           call t1ou ('1'c)
           call t1ou ('L'c)
           }
        when (ADM31) {
           delay = 180
           call t1ou (ESC)
           call t1ou ('E'c)
           }
      else
         call error ("in inslines: shouldn't happen"p)

      if (delay ~= 0)
         call senddelay (delay)
      }

   for (i = Nrows; i - n >= Currow; i -= 1)
      call move$ (Screen_image (1, i - n), Screen_image (1, i), Ncols)

   for (; i >= Currow; i -= 1)
      call move$ (blanks, Screen_image (1, i), Ncols)

   return
   end
