# block --- convert characters on STDIN to block letters on STDOUT

   include "block_def.r.i"

   character line (MAXLINE), outbuf (MAX_OUT), c, fill_char
   integer in, out, row, col, mask, out_width, next_in
   integer getlin

   include MASK_DECL

   call get_options (fill_char, out_width)

   while (getlin (line, STDIN) ~= EOF) {
      next_in = 1
      repeat {
         for (row = 0; row < ROWS_PER_CHAR; row += 1) {
            do col = 1, out_width
               outbuf (col) = ' 'c
            out = 1
            for (in = next_in; line (in) ~= EOS; in += 1) {
               c = line (in)
               if (c == BS) {    # handle overstrikes
                  out -= COLS_PER_CHAR + COLS_BETWEEN_CHARS
                  next
                  }
               elif (c < ' 'c)   # ignore other control characters
                  next
               else
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
            call strim (outbuf)
            call print (STDOUT, "*s*n"s, outbuf)
            }
         next_in = in
         do row = 1, ROWS_BETWEEN_LINES
            call putch (NEWLINE, STDOUT)
         } until (line (next_in) == EOS)
      }

   stop
   end


# get_options --- parse command line arguments for block

   subroutine get_options (fill_char, out_width)
   character fill_char
   integer out_width

   ARG_DECL

   PARSE_COMMAND_LINE ("c<rs>w<ri>"s, _
      "Usage: block { -c <char> | -w <width> }"s)
   if (ARG_PRESENT (c))
      fill_char = ARG_TEXT (c)
   else
      fill_char = '*'c
   if (ARG_PRESENT (w))
      out_width = ARG_VALUE (w)
   else
      out_width = 75

   return
   end
