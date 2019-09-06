#  vt$iln --- send an insert line sequence

   integer function vt$iln (dummy)
   integer dummy

   include SWT_COMMON

   integer i

   if (Tc_ins_line (1) == EOS)
      return (ERR)

   send_str (Tc_ins_line)
   call vt$del(Tc_line_delay)

   return (OK)
   end
