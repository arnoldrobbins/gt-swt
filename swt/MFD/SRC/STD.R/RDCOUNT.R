# rdcount --- count the number of rows in a relation satisfying
#               a given condition

   include "rdb_def.r.i"

   define (DB,#)

   relation_des rd (RDSIZE)
   integer i, l, flag
   integer row (RDATASIZE), rpn (RPNSIZE), cbuf (RDATASIZE)
   integer getarg, load_rd, get_row, isatty, eval, parse
   character arg (MAXARG)

   if (load_rd (rd, STDIN) ~= OK)
      call error ("Cannot load input relation"p)

   if (getarg (2, arg, MAXARG) ~= EOF )
      call error ("Usage: rdsel <selection expr>"p)
   if (get_arg(1, arg, MAXARG) == EOF)
      flag = 1
   else
      flag = 0

   if (flag == 0)
      if (parse (rd, 0, arg, rpn, cbuf) ~= OK)
         stop

DB for (i = 1; rpn (i) ~= EOS; i += 1)
DB    call print (ERROUT, "*i (*,8i) "s, rpn (i), rpn (i))
DB call print (ERROUT, "*n"s)

   i = 0
   while (get_row (rd, STDIN, row) ~= EOF)
      if (flag == 0) {
         if (eval (rd, row, rpn, cbuf) == YES )
            i = i+1
      }
      else
         i = i+1

   call print (STDOUT,"*i*n"s,i)

   stop
   end


include "rdb_parse.r.i"
include "rdb_sub.r.i"
