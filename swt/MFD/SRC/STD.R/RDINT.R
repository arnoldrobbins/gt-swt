# rdint --- intersect two identical relations

   include "rdb_def.r.i"

   define (DB,#)

   relation_des rd1 (RDSIZE), rd2 (RDSIZE)
   integer i, j, lasti, copyit, s
   integer row (RDATASIZE), row1(RDATASIZE), row2(RDATASIZE)
   integer buf1 (RDATASIZE), buf2 (RDATASIZE)
   integer load_rd, equal, isatty, get_row, compare_field
   character arg (MAXARG)
   file_mark m
   file_mark markf

   if (load_rd (rd1, STDIN) ~= OK)
      call error ("Can't access input relation 1"p)

   if (load_rd (rd2, STDIN2) ~= OK)
      call error ("Can't access input relation 2"p)

   for ({i = FIRSTRF (rd1); j = FIRSTRF (rd2)};
         ISLASTRF (rd1, i) && ISLASTRF (rd2, j);
         {i = NEXTRF (rd1, i); j = NEXTRF (rd2, j)}) {

      if (i ~= j || RFTYPE (rd1, i) ~= RFTYPE (rd2, j)
         || RFLEN (rd1, i) ~= RFLEN (rd2, j)
         || equal (RFNAME (rd1, i), RFNAME (rd2, j)) == NO)
         call error ("Relations must have identical descriptions"p)
      }

   if (ISLASTRF (rd1, i) || ISLASTRF (rd2, j))
      call error ("Relations must have identical descriptions"p)

   call save_rd (rd1, STDOUT)


   if (isatty (STDOUT) == YES)
      call print_header (rd1, STDOUT)

   m = markf (STDIN)
   while (get_row (rd2, STDIN2, row2 ) ~= EOF) {

      call seekf (m, STDIN)
      while (get_row (rd1, STDIN, row1 ) ~= EOF) {

            copyit = 1
            for ({i = FIRSTRF (rd1); j = FIRSTRF (rd2)};
                  ISLASTRF (rd1, i) && ISLASTRF (rd2, j);
                  {i = NEXTRF (rd1, i); j = NEXTRF (rd2, j)}) {
               call get_data (rd1, i, row1, buf1)
               call get_data (rd2, j, row2, buf2)
               if (compare_field(RFTYPE(rd1, i), buf1, buf2) ~= 2)
                  copyit = 0
               }
            if (copyit == 1)
               call put_row (rd2,STDOUT,row2)
         }
      }

   if (isatty (STDOUT) == YES)
      call print_trailer (rd1, STDOUT)

   stop
   end


include "rdb_sub.r.i"
