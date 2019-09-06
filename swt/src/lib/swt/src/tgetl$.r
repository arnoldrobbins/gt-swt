# tgetl$ --- return cooked data from the terminal

   integer function tgetl$ (buf, size, f)
   character buf (ARB)
   integer size, f

   include SWT_COMMON

   integer tcook$

   return (tcook$ (buf, size, Termbuf, Termcp))
   end
