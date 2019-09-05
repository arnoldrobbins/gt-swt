# vt$clr --- send clear screen sequence

   integer function vt$clr (dummy)
   integer dummy

   include SWT_COMMON

   if (Tc_clear_screen (1) == EOS)
      return (ERR)

   send_str (Tc_clear_screen)
   call vt$del(Tc_clear_delay)   # delay loop of characters

   return (OK)
   end

