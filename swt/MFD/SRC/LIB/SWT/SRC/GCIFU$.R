# gcifu$ --- return the current value of Comunit

   integer function gcifu$ (funit)
   integer funit

   include SWT_COMMON

   funit = Comunit

   return (funit)
   end
