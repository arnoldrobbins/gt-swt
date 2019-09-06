# delarg --- delete an argument from the command line

   integer function delarg (ap)
   integer ap

   include SWT_COMMON

   integer i

   if (ap < 0 || ap >= Arg_c)
      return (EOF)

   for (i = ap + 1; i < Arg_c; i += 1)
      Arg_v (i) = Arg_v (i + 1)

   Arg_c -= 1

   return (OK)
   end
