#  vt$cel --- send a clear to end-of-line sequence

   integer function vt$cel (dummy)
   integer dummy

   include SWT_COMMON

   if (Tc_clear_to_eol (1) == EOS)
      return (ERR)

   send_str (Tc_clear_to_eol)

   return (OK)
   end
