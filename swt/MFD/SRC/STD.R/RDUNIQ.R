# rduniq --- remove duplicate rows from a sorted relation

   include "rdb_def.r.i"

   define (DB,#)

   relation_des rd (RDSIZE)
   integer t
   integer row1 (RDATASIZE), row2 (RDATASIZE)
   integer getrow, cmprow, load_rd, isatty

   if (load_rd (rd, STDIN) ~= OK)
      call error ("Can't access input relation"p)

   call save_rd (rd, STDOUT)

   if (isatty (STDOUT) == YES)
      call print_header (rd, STDOUT)

   t = getrow (rd, STDIN, row1)
   while (t ~= EOF) {
      for (t = getrow (rd, STDIN, row2); t ~= EOF
          && cmprow (rd, row1, row2) == YES; t = getrow (rd, STDIN, row2))
         ;
      call putrow (rd, STDOUT, row1)
      if (t == EOF)
         break
      for (t = getrow (rd, STDIN, row1); t ~= EOF
            && cmprow (rd, row1, row2) == YES; t = getrow (rd, STDIN, row1))
         ;
      call putrow (rd, STDOUT, row2)
      }

   if (isatty (STDOUT) == YES)
      call print_trailer (rd, STDOUT)

   stop
   end



# cmprow --- compare two rows of a relation for equality

   integer function cmprow (rd, row1, row2)
   relation_des rd (RDSIZE)
   integer row1 (RDATASIZE), row2 (RDATASIZE)

   integer i

   for (i = RDROWLEN (rd); i > 0; i -= 1)
      if (row1 (i) ~= row2 (i))
         return (NO)

   return (YES)
   end


include "rdb_sub.r.i"
