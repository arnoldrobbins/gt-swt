# dellines --- delete n lines starting at row on the screen

   subroutine dellines (row, n)
   integer row, n

   include SE_COMMON

   integer i, delay
   character blanks (MAXCOLS)
   data blanks / MAXCOLS * ' 'c /

   call position_cursor (row, 1)
   for (i = 1; i <= n; i += 1) {
      select (Term_type)
         when (VI200, HP2621, HP2626, HP2648, HP9845, PT45) {
            call t1ou (ESC)
            call t1ou ('M'c)
            delay = 0
            }
         when (TS1) {
            call t1ou (ESC)
            call t1ou ('R'c)
            delay = 0
            }
         when (H19, Z19, SBEE) {
            call t1ou (ESC)
            call t1ou ('M'c)
            delay = 16
            }
         when (VIEWPT90, ADDS100) {
            call t1ou (ESC)
            call t1ou ('l'c)
            delay = 64
            }
         when (ADDS980) {
            call t1ou (ESC)
            call t1ou (SI)
            delay = 32
            }
         when (TVI, ADM42) {
            call t1ou (ESC)
            call t1ou ('R'c)
            delay = 32
            }
        when (ADM31) {
            call t1ou (ESC)
            call t1ou ('R'c)
            delay = 180
            }
        when (PST100) {
           call t1ou (ESC)
           call t1ou ('['c)
           call t1ou ('1'c)
           call t1ou ('M'c)
           delay = 0
           }
      else
         call error ("in dellines: shouldn't happen"p)

      if (delay ~= 0)
         call senddelay (delay)
      }

   for (i = Currow; i + n <= Nrows; i += 1)
      call move$ (Screen_image (1, i + n), Screen_image (1, i), Ncols)

   for (; i <= Nrows; i += 1)
      call move$ (blanks, Screen_image (1, i), Ncols)

   return
   end
