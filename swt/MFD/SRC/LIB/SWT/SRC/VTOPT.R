# vtopt --- set options for the virtual terminal handler

   subroutine vtopt (opt, str)
   integer opt, str (ARB)

   include SWT_COMMON

   integer i, val
   character dots (MAXCOLS), blanks (MAXCOLS)

   data dots /MAXCOLS * '.'c/
   data blanks /MAXCOLS * ' 'c/

   val = str (1)

   select (opt)
      when (STATUS_ROW) {
         if (Msg_row > 0)
            call vt$put (blanks, Msg_row, 1, Maxcol)
         if (val < 1 || val > Maxrow)
            Msg_row = 0
         else
            Msg_row  = val
         if (Msg_row > 0)
            call vt$put (dots, Msg_row, 1, Maxcol)
         do i = 1, Maxcol
            Msg_owner (i) = NOMSG
         }

      when (INPUT_WAIT)
         if (val < 1)
            Input_wait = 0
         else
            Input_wait = val

      when (DISPLAY_TIME)
         if (val == YES)
            Display_time = YES
         else
            Display_time = NO

      when (UNPRINTABLE_CHAR)
         if (val >= ' 'c && val < DEL)
            Unprintable_char = val
         else
            Unprintable_char = '?'c

      when (SET_TABS) {
         for (i = 1; str (i) ~= EOS && i <= Maxcol; i += 1)
            if (str (i) == ' 'c)
               Tabs (i) = NO
            else
               Tabs (i) = YES
         while (i <= Maxcol) {
            Tabs (i) = YES
            i += 1
            }
         }

   return
   end
