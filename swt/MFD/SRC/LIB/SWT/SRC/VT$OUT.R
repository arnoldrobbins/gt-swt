# vt$out --- output a character on the screen

   subroutine vt$out (chr)
   character chr

   include SWT_COMMON

   character tchr

   if (Currow == Maxrow && Curcol == Maxcol)
      return   # refuse to make terminal scroll

   tchr = or (chr, 16r80)  # ensure mark parity

   if (tchr >= ' 'c && tchr < DEL)    # Is it printable??
      send_char (tchr)                # output character
   else if (Tc_shift_out (1) == EOS || tchr == Tc_shift_in (1)
         || tchr < NUL || tchr >= DEL)
      send_char (Unprintable_char)
   else {
      send_str (Tc_shift_out)
      send_char (tchr + Tc_shift_char - NUL)
      send_str (Tc_shift_in)
      }

   if (Curcol == Maxcol && Tc_wrap_around == YES) {
      Curcol = 1
      Currow += 1
      }
   else
      Curcol += 1

   return
   end
