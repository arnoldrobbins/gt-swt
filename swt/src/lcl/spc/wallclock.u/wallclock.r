# clock --- Keep time in a BIG way...

include "wallclock_def.r.i"

   character line (MAXLINE), outbuf (MAX_OUT), c, fill_char
   character term_type (MAX_TERM_TYPE)
   integer in, out, row, col, mask, out_width, next_in, output_row, i
   integer getlin, vtinit, getarg
   long_int delay
   long_int ctol
   external quit
   shortcall mkonu$

   include MASK_DECL

   if (getarg (1, line, MAXLINE) ~= EOF) {
      i = 1
      delay = ctol (line, i) * 1000
      if (delay < 1)
         delay = 1
      }
   else
      delay = 1

   if (getarg (2, line, MAXLINE) ~= EOF)
      fill_char = line (1)
   else
      fill_char = '*'c

   out_width = 75
   call vtinit (term_type)
   call date (SYS_TIME, line)
   call vtprt (1, 35, "*s"s, line)
   call vtupd (YES)

   call mkonu$ ("QUIT$"v, loc (quit))

   while (TRUE) {
      call date (SYS_TIME, line)
      next_in = 1
      output_row = START_ROW
      repeat {
         for (row = 0; row < ROWS_PER_CHAR; row += 1) {
            do col = 1, out_width
               outbuf (col) = ' 'c
            out = 1
            for (in = next_in; line (in) ~= EOS; in += 1) {
               c = line (in)
               mask = rs (masks (row / ROWS_PER_WORD + 1, c - ' 'c + 1),
                     mod (row, ROWS_PER_WORD) * COLS_PER_CHAR)
               if (0 < out && out <= out_width - COLS_PER_CHAR) {
                  do col = 1, COLS_PER_CHAR; {
                     if (and (mask, 1) ~= 0)
                        outbuf (out) = fill_char
                     out += 1
                     mask = rs (mask, 1)
                     }
                  out += COLS_BETWEEN_CHARS
                  }
               else
                  break
               }
            outbuf (out_width + 1) = EOS
            call vtprt (output_row, 15, "*s"s, outbuf)
            output_row += 1
            }
         next_in = in
         } until (line (next_in) == EOS)
      call vtupd (NO)
      call vtmove (1,1)
      call sleep$ (delay)
      }

   stop
   end



# quit --- clean up and exit big_clock

   subroutine quit (ptr)

   long_int ptr

   call vtstop
   stop
   end
