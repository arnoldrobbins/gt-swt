# copy --- copy characters from STDIN to STDOUT

   character c
   character getch

   while (getch(c, STDIN) ~= EOF)
      call putch(c, STDOUT)

   stop
   end
