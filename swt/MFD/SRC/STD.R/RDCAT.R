# rdcat --- concatenate two identical relations

   include "rdb_def.r.i"

   define (DB,#)

   relation_des rd1 (RDSIZE), rd2 (RDSIZE)
   integer i, j
   integer row (RDATASIZE)
   integer load_rd, equal, isatty, get_row

   if (load_rd (rd1, STDIN) ~= OK)
      call error ("Can't access input relation 1"p)

   if (load_rd (rd2, STDIN2) ~= OK)
      call error ("Can't access input relation 2"p)

   for ({i = FIRSTRF (rd1); j = FIRSTRF (rd2)};
         ISLASTRF (rd1, i) && ISLASTRF (rd2, j);
         {i = NEXTRF (rd1, i); j = NEXTRF (rd2, j)})

      if (i ~= j || RFTYPE (rd1, i) ~= RFTYPE (rd2, j)
         || RFLEN (rd1, i) ~= RFLEN (rd2, j)
         || equal (RFNAME (rd1, i), RFNAME (rd2, j)) == NO)
         call error ("Relations must have identical descriptions"p)

   if (ISLASTRF (rd1, i) || ISLASTRF (rd2, j))
      call error ("Relations must have identical descriptions"p)

   call save_rd (rd1, STDOUT)

   if (isatty (STDOUT) == YES)
      call print_header (rd1, STDOUT)

   while (get_row (rd1, STDIN, row) ~= EOF)
      call put_row (rd1, STDOUT, row)
   while (get_row (rd2, STDIN2, row) ~= EOF)
      call put_row (rd2, STDOUT, row)

   if (isatty (STDOUT) == YES)
      call print_trailer (rd1, STDOUT)

   stop
   end


include "rdb_sub.r.i"
