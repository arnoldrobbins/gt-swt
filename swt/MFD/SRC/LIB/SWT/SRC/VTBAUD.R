#  vtbaud --- set the terminal baud rate

   subroutine vtbaud (rate)
   integer rate

   include SWT_COMMON

   if (rate > 19200)
      Tc_speed = 19200
   elif (rate < 50)
      Tc_speed = 50
   else
      Tc_speed = rate

   return
   end
