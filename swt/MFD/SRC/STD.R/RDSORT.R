# rdsort --- sort a relation on specified domains

   include "rdb_def.r.i"

   define (DB,#)

   define (MAXKEYS, 50)

   relation_des rd (RDSIZE)
   integer ap, i, test
   integer keys (MAXKEYS), orders (MAXKEYS)
   integer getarg, load_rd, find_field, isatty
   character arg (MAXARG), ord (MAXARG)

   if (load_rd (rd, STDIN) ~= OK)
      call error ("Can't access input relation"p)

   for (ap = 1; getarg (2*ap-1, arg, MAXARG) ~= EOF & test ~= EOF; ap += 1) {
      if (ap >= MAXKEYS)
         call error ("Too many sort keys"p)

      keys (ap) = find_field (rd, arg)
      if (keys (ap) == 0) {
         call print (ERROUT, "*s"s, arg)
         call error (": field not defined"p)
         }

      test = getarg(2*ap, ord, MAXARG)
      if (test ~= EOF)
         if (ord(1) == "a"c) {
            call print (STDOUT, "*s ascending*n"s, arg)
            orders (ap) = 1
         }
         else if (ord(1) == "d"c) {
            call print (STDOUT, "*s descending*n"s, arg)
            orders (ap) = -1
         }
         else  {
            call print (STDOUT, "*s undefined*n"s, arg)
            orders(ap) = 1
         }

      }
   if (ap == 1)
      for ({ap = 1; i = FIRSTRF (rd)}; ISLASTRF (rd, i);
                       {ap += 1; i = NEXTRF (rd, i)}) {
         keys (ap) = i
         orders (ap) = 1
      }
   keys (ap) = 0

DB for (ap = 1; keys (ap) ~= 0; ap += 1)
DB    call print (ERROUT, "*i "s, keys (ap))
DB call print (ERROUT, "*n"s)

   call save_rd (rd, STDOUT)

   if (isatty (STDOUT) == YES)
      call print_header (rd, STDOUT)

   call sort (rd, keys, orders, STDIN, STDOUT)

   if (isatty (STDOUT) == YES)
      call print_trailer (rd, STDOUT)

   stop
   end


include "rdb_sort.r.i"
include "rdb_sub.r.i"
