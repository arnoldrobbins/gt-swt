#  vt$dln --- send a delete line sequence

   integer function vt$dln (dummy)
   integer dummy

   include SWT_COMMON

   integer i

   if (Tc_del_line (1) == EOS)
      return (ERR)

   send_str (Tc_del_line)
   call vt$del(Tc_line_delay)

   return (OK)
   end
