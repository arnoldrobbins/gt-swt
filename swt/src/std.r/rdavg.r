# rdavg --- compute the average value in a given column
#           (over all rows satisfying a given condition)

   include "rdb_def.r.i"

   define (DB,#)

   relation_des rd (RDSIZE)
   integer i, l, flag, n, pos
   longint ival
   longreal sum, value
   integer row (RDATASIZE), rpn (RPNSIZE), cbuf (RDATASIZE)
   integer buf (MAXLINE)
   integer getarg, load_rd, get_row, isatty, eval, parse, find_field
   character arg (MAXARG), summand (MAXARG)

   if (load_rd (rd, STDIN) ~= OK)
      call error ("Cannot load input relation"p)

   if (getarg (3, arg, MAXARG) ~= EOF )
      call error ("Usage: rdavg [<selection expr>] <attr>"p)
   if (getarg (2, summand, MAXARG) ~= EOF ) {
      flag = 0
      i = getarg (1, arg, MAXARG)
   }
   else if (getarg(1, summand, MAXARG) ~= EOF) {
      flag = 1
   }
   else
      call error ("Usage: rdavg [<selection expr>] <attr>"p)

   pos = find_field (rd, summand)
   if (pos == 0)
      call error ("Domain not found"p)
   if (RFTYPE (rd, pos) == STRING_TYPE)
      call error ("Strings can't be averaged"p)

   if (flag == 0)
      if (parse (rd, 0, arg, rpn, cbuf) ~= OK)
         stop

DB for (i = 1; rpn (i) ~= EOS; i += 1)
DB    call print (ERROUT, "*i (*,8i) "s, rpn (i), rpn (i))
DB call print (ERROUT, "*n"s)

   sum = 0
   n = 0
   while (get_row (rd, STDIN, row) ~= EOF)
      if (flag == 0) {
         if (eval (rd, row, rpn, cbuf) == YES ) {
            n = n+1
            if (RFTYPE (rd,pos) == INTEGER_TYPE) {
               call get_data (rd, pos, row, ival)
               sum = sum + ival
            }
            if (RFTYPE (rd,pos) == REAL_TYPE) {
               call get_data (rd, pos, row, value)
               sum = sum + value
            }
         }
      }
      else {
         n = n+1
         if (RFTYPE (rd,pos) == INTEGER_TYPE) {
            call get_data (rd, pos, row, ival)
            sum = sum + ival
         }
         if (RFTYPE (rd,pos) == REAL_TYPE) {
            call get_data (rd, pos, row, value)
            sum = sum + value
         }
      }

   if (n ~= 0) {
      sum = sum / n
      call print (STDOUT,"*d over *i values*n"s,sum,n)
   }
   else
      call print (STDOUT, "Average is undefined for empty relation*n"s)

   stop
   end


include "rdb_parse.r.i"
include "rdb_sub.r.i"
