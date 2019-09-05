# isph --- return 1 if the current run is a phantom

   integer dummy
   integer isph$

   if (isph$(dummy) == YES)
      call print(STDOUT, "1*n"s)
   else
      call print(STDOUT, "0*n"s)

   stop
   end
