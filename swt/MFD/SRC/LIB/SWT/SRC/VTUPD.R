# vtupd --- update the screen with the new screen buffer

   subroutine vtupd (clr)
   integer clr

   include SWT_COMMON

   integer row, col, lim
   character nch, cch

   procedure watch forward


   if (Display_time == YES)
      watch

   if (clr == YES) { # update the whole screen (clear first)
      Currow = 1     # clearing moves the cursor
      Curcol = 1
      call vt$clr (clr)

      for (row = 1; row <= Maxrow; row += 1) {

         if (Last_char (row) < Maxcol)
            lim = Last_char (row)
         else
            lim = Maxcol

         for (col = 1; col <= lim; col += 1) {
            vt$upk (nch, Newscr, row, col)
            if (nch ~= ' 'c) {
               call vtmove (row, col)
               call vt$out (nch)
               }
            vt$pk (nch, Curscr, row, col)
            }
         Col_chg_start (row) = MAXCOLS
         Col_chg_stop (row) = 0
         }
      Row_chg_start = MAXROWS
      Row_chg_stop = 0
      }
   else { # only update the changed parts of the screen

      for (row = Row_chg_start; row <= Row_chg_stop; row += 1) {

         if (Last_char (row) < Col_chg_stop (row)     # can we clear
                  && Tc_clear_to_eol (1) ~= EOS)      #   to end of line??
            lim = Last_char (row)
         else
            lim = Col_chg_stop (row)

         for (col = Col_chg_start (row); col <= lim; col += 1) {
            vt$upk (nch, Newscr, row, col)
            vt$upk (cch, Curscr, row, col)
            if (nch ~= cch) {
               call vtmove (row, col)
               call vt$out (nch)
               vt$pk (nch, Curscr, row, col)
               }
            }
         for (; col <= Col_chg_stop (row); col += 1) {
            vt$upk (cch, Curscr, row, col)
            if (cch ~= ' 'c)
               break
            }

         if (col <= Col_chg_stop (row)) { # clear to end of line...
            call vtmove (row, col)
            send_str (Tc_clear_to_eol)
            Currow = Maxrow + 10; Curcol = Maxcol + 10
            for (; col <= Col_chg_stop (row); col += 1)
               vt$pk (' 'c, Curscr, row, col)
            }

         Col_chg_start (row) = MAXCOLS
         Col_chg_stop (row) = 0
         }
      Row_chg_start = MAXROWS
      Row_chg_stop = 0
      }



   # watch --- display the current time on the screen

      procedure watch {

      local face
      character face (10)

      call date (SYS_TIME, face)
      face (6) = EOS             # chop off seconds
      call vtmsg (face, TIME_MSG)
      }

   return
   end
