# vt$pos --- position the cursor to row and col

   integer function vt$pos (row, col, crow, ccol)
   integer row, col, crow, ccol

   include SWT_COMMON

   integer i
   bool missin

   procedure row_coord forward
   procedure col_coord forward
   procedure b200_coord (pos) forward
   procedure sbee_coord (pos) forward

   if (row < 1 || col < 1 || row > Maxrow || col > Maxcol)
      return (ERR)

#  see if we can position relatively for speed

   if (~missin(crow) && ~missin(ccol) && Tc_seq_type ~= 4)
      if (row == crow && iabs(ccol - col) < Tc_abs_len)

         if (ccol >= col && Tc_cursor_left (1) ~= EOS) {
            for (i = ccol - col; i > 0; i -= 1)
               send_str (Tc_cursor_left)
            return
            }

         elif (Tc_cursor_right (1) ~= EOS) {
            for (i = col - ccol; i > 0; i -= 1)
               send_str (Tc_cursor_right)
            return
            }

#  can't position relatively ... got to go absolute

   select (Tc_seq_type)
      when (1) {  # absolute, row first, column second
         send_str (Tc_abs_pos)
         row_coord
         col_coord
         }
      when (2) {  # absolute, column first, row second
         send_str (Tc_abs_pos)
         col_coord
         row_coord
         }
      when (3) {  # horizontal and vertical only
         send_str (Tc_vert_pos)
         row_coord
         call vt$del(Tc_pos_delay)
         send_str (Tc_hor_pos)
         col_coord
         }
      when (4)
         call vt$rel(row, col, crow, ccol)

   call vt$del(Tc_pos_delay)

   return (OK)


   # row_coord --- output the row coordinate for positioning

      procedure row_coord {

      local i, units, tens, hundreds
      integer i, units, tens, hundreds

      select (Tc_coord_type)
         when (1, 4) # simplest kind, most terms are here
            send_char (Tc_coord_char + row)
         when (2)    # B200, SOL
            b200_coord (row)
         when (3)    # superbee
            sbee_coord (row)
         when (5) {  # colorgraphics
            i = 511 - 10 * (row - 1)
            units = mod (i, 10)
            i /= 10
            tens = mod (i, 10)
            i /= 10
            hundreds = mod (i, 10)
            send_char (" "c + 16 + hundreds)
            send_char (" "c + 16 + tens)
            send_char (" "c + 16 + units)
            }
         when (6) {  # HP 9845 & HP 2621
            i = row - 1
            units = mod (i, 10)
            tens = i / 10
            if (tens ~= 0)
               send_char (tens + '0'c)
            send_char (units + '0'c)
            send_char ('y'c)
            }
         when (7) {  # ansi positioning (vt100, pst100)
            units = mod (row, 10)
            tens = row / 10
            if (tens ~= 0)
               send_char (tens + '0'c)
            send_char (units + '0'c)
            send_char (';'c)
            }
      }


   # col_coord --- output the column coordinate for positioning

      procedure col_coord {

      local tcol, tens, units, hundreds, i
      integer tcol, tens, units, hundreds, i

      select (Tc_coord_type)
         when (1)    # simplest kind, most terms are here
            send_char (Tc_coord_char + col)
         when (2)    # B200, SOL
            b200_coord (col)
         when (3)    # superbee
            sbee_coord (col)
         when (4) {  # adds consul 980
            send_char ('0'c + ((col - 1) / 10))
            send_char ('0'c + mod (col - 1, 10))
            }
         when (5) {  # colorgraphics
            i = 6 * (col - 1)
            units = mod (i, 10)
            i /= 10
            tens = mod (i, 10)
            i /= 10
            hundreds = mod (i, 10)
            send_char (" "c + 16 + hundreds)
            send_char (" "c + 16 + tens)
            send_char (" "c + 16 + units)
            }
         when (6) {  # HP 9845 & HP 2621
            i = col - 1
            units = mod (i, 10)
            tens = i / 10
            if (tens ~= 0)
               send_char (tens + '0'c)
            send_char (units + '0'c)
            send_char ('C'c)
            }
         when (7) {  # ansi positioning (vt100, pst100)
            units = mod (col, 10)
            tens = col / 10
            if (tens ~= 0)
               send_char (tens + '0'c)
            send_char (units + '0'c)
            send_char ('H'c)
            }
      }

   # b200_coord --- put out a b200-style coordinate

      procedure b200_coord (pos) {

      integer pos

      local acc, units, tens; integer acc, units, tens

      acc = pos - 1
      tens = acc / 10
      units = acc - 10 * tens
      acc = units + 16 * tens
      send_char (acc)
      }


   # sbee_coord --- output a coordinate for the Superbee

      procedure sbee_coord (pos) {

      integer pos

      local acc; integer acc
         send_char ('0'c)

      acc = pos - 1
      send_char ('0'c + (acc / 10))
      send_char ('0'c + mod (acc, 10))
      }

   end
