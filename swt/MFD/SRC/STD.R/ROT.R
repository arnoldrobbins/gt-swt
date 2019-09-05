# rot.r --- rotate standard input arg 1 characters and output to stdout


   integer getarg, getlin, length, iabs, mod, isign, gctoi
   character input_line(MAXLINE), output_line(MAXLINE)

   integer i, rotate, rotate_count, in_len


   if (getarg (1, input_line, MAXARG) == EOF) {
      while (getlin (input_line, STDIN, MAXLINE) ~= EOF) {
         in_len = length (input_line) - 1
         for (i = 1; i <= in_len; i = i + 1)
            output_line (in_len - i + 1) = input_line (i)
         output_line(in_len + 1) = EOS
         call putlin (output_line, STDOUT)
         call putch (NEWLINE, STDOUT)
         }
      stop
      }

   i = 1
   rotate_count = gctoi (input_line, i, 10)

   while (getlin (input_line, STDIN, MAXLINE) ~= EOF) {
      in_len = length (input_line) - 1
      if (in_len < iabs (rotate_count))
         rotate = isign ( mod (iabs (rotate_count), in_len), rotate_count)
      else
         rotate = rotate_count
      if (rotate >= 0) {
         for (i=1; i <= in_len; i = i + 1)
            if (((in_len - rotate) + i) <= in_len)
               output_line (i) = input_line ((in_len - rotate) + i)
            else
               output_line (i) = input_line (i - rotate)
         output_line (in_len + 1) = EOS
         }
      else {
         for (i=1; i <= in_len; i = i + 1)
            if ((in_len - (in_len + rotate) + i) <= in_len)
               output_line (i) = input_line (in_len - (in_len + rotate) + i)
            else
               output_line (i) = input_line (i - (in_len + rotate))
         output_line (in_len + 1) = EOS
         }
      call putlin (output_line, STDOUT)
      call putch (NEWLINE, STDOUT)
      }

   stop
   end
