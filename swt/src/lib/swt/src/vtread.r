# vtread --- read characters from the user's terminal

   integer function vtread (crow, ccol, clr)
   integer crow, ccol, clr

   include SWT_COMMON

   integer row, col, i, j, t
   integer vt$get
   character fill (MAXCOLS)

   data fill /MAXCOLS * ' 'c/

   procedure search (way) forward

   if (clr == YES)      # clear the input areas if desired
      do i = 1, Maxrow
         if (Input_start (i) <= Input_stop (i))
            call vt$put (fill, i, Input_start (i),
               Input_stop (i) - Input_start (i) + 1)

   call vtupd (NO)

   row = crow - 1
   col = ccol

   search (+1)

   repeat {
DEBUG call vtprt (2, 1, "row=*i, col=*i"s, row, col)
DEBUG call vtupd (NO)

      for ({i = 1; j = Input_start (row)}; j <= Input_stop (row);
                                                 {i += 1; j += 1})
         vt$upk (Inbuf (i), Newscr, row, j)

      t = vt$get (row, col,
         Input_start (row), Input_stop (row) - Input_start (row) + 1)

      if (t == MOVE_UP)
         search (-1)
      else if (t == MOVE_DOWN)
         search (+1)
      else
         break
      }

   return (t)

   # search --- look for a line with an open input field

      procedure search (way) {

      integer way
      local lrow; integer lrow

DEBUG call print (ERROUT, "search: way=*i, row=*i*n"s, way, row)

      lrow = mod (row + Maxrow - 1, Maxrow) + 1
      row = mod (lrow + Maxrow + way - 1, Maxrow) + 1
      while (Input_start (row) > Input_stop (row)) {
DEBUG call print (ERROUT, "search: row=*i*n"s, row)
         if (row == lrow)
            return (0)
         row = mod (row + Maxrow + way - 1, Maxrow) + 1
         }
DEBUG call print (ERROUT, "search: found=*i*n"s, row)

      }

   end
