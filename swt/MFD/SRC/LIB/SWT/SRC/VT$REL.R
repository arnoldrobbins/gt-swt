#  vt$rel --- apply relative positioning to move the cursor

   subroutine vt$rel (row, col, crow, ccol)
   integer row, col, crow, ccol

   include SWT_COMMON

   integer r, c

   r = crow
   c = ccol

#  try to be intelligent in what little we have
#  home the cursor and move from there if that is faster

   if (iabs(row - r) + iabs(col - c) > Tc_home_len + row + col - 2)
      if (Tc_cursor_home (1) ~= EOS) {
         send_str (Tc_cursor_home)
         r = 1
         c = 1
         }

   if (Tc_cursor_up (1) ~= EOS)     # get cursor up to, or above
      for (; r > row; r -= 1)
         send_str (Tc_cursor_up)
   elif (r > row) {
      send_str (Tc_cursor_home)
      r = 1
      c = 1
      }

   if (Tc_cursor_down (1) ~= EOS)   # now drop it down
      for (; r < row; r += 1)
         send_str (Tc_cursor_down)
   elif (r < row)
      for (; r < row; r += 1)
         send_char (LF)             # fairly universal

#  if a CR and move right is faster, then try that

   if (iabs(col - c) > col - 1) {
      send_char (CR)
      c = 1
      }

   if (Tc_cursor_right (1) ~= EOS)  # to the right, the far..... right
      for (; c < col; c += 1)
         send_str (Tc_cursor_right)
   elif (c < col)
      call error ("can't position cursor"p)

   if (Tc_cursor_left (1) ~= EOS)   # finish up to the left
      for (; c > col; c -= 1)
         send_str (Tc_cursor_left)
   elif (c > col) {
      send_char (CR)
      for (c = 1; c < col; c += 1)
         send_str (Tc_cursor_right)
      }

   return
   end
