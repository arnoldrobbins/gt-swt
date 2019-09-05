# vt$del --- delay with characters

   subroutine vt$del(count)
   integer count

   include SWT_COMMON

   integer i

   if (count <= 0)
      return

   i = (intl (count) * Tc_speed) / 10000
   while (i > 0) {
      send_char (NUL)
      i -= 1
      }

   return
   end
