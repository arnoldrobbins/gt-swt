# vtinit --- initialize screen buffers, cursor position and
#            terminal characteristics

   integer function vtinit (term_type)
   integer term_type (MAXTERMTYPE)

   include SWT_COMMON

   integer vtterm, i, j
   integer duplx$

   if (vtterm (term_type) == ERR)   # get term characteristics
      return (ERR)

DEBUG call print (ERROUT, "After call to vtterm*n"s)

   Currow = 0
   Curcol = 0

   do i = 1, MAXROWS; {
      Col_chg_start (i) = MAXCOLS
      Col_chg_stop (i) = 0
      Last_char (i) = 0
      }
   Row_chg_start = MAXROWS
   Row_chg_stop = 0

   Msg_row = 0
   do i = 1, MAX_COLS
      Msg_owner (i) = NOMSG

   Pad_row = 1
   Pad_col = 1
   Pad_len = 80
   Display_time = NO

   for (i = 1; i <= MAX_ROWS; i += 1)
      for (j = 1; j <= MAX_COLS; j += 1) {
         Newscr (j, i) = ' 'c
         Curscr (j, i) = ' 'c
         }

   Unprintable_char = '?'c

   Last_char_scanned = EOS
   Insert_mode = NO
   Invert_case = NO

   Duplex = duplx$ (-1)
   call duplx$ (:140000)

   Input_wait = 0       # default: no timeout on input

   Pb_ptr = 0
   Nesting_count = 0

DEBUG call vt$db  # debug: call terminal char dumper

   return (OK)
   end
