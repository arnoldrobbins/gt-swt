# first$ --- find out if this is the first call here since login

   integer function first$ (flag)
   integer flag

   include SWT_COMMON

   if (First_use == 8r52525)
      flag = NO

   else {
      flag = YES
      First_use = 8r52525
      }

   return (flag)
   end
