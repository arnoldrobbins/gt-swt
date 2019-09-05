# mapsu --- map standard unit to file descriptor

   file_des function mapsu (std_unit)
   file_des std_unit

   include SWT_COMMON

   integer i

   mapsu = std_unit
   if (mapsu > 0)             # this test added for execution speed
      return

   do i = 1, 10
      select (mapsu)
         when (STDIN1)
            mapsu = Std_port_tbl (1)
         when (STDIN2)
            mapsu = Std_port_tbl (3)
         when (STDIN3)
            mapsu = Std_port_tbl (5)
         when (STDOUT1)
            mapsu = Std_port_tbl (2)
         when (STDOUT2)
            mapsu = Std_port_tbl (4)
         when (STDOUT3)
            mapsu = Std_port_tbl (6)
      else
         return

   return (TTY)         # infinite definition -- send back TTY
   end
