# rdmin -- find the minimum (first) value of a specified attribute
#        (possibly over those rows satisfying a selection expression)

   include "rdb_def.r.i"

   define (DB,#)

   relation_des rd (RDSIZE)
   integer i, l, flag, n, pos
   longint imin, ival
   longreal rmin, rval
   integer row (RDATASIZE), rpn (RPNSIZE), cbuf (RDATASIZE)
   integer buf (MAXLINE)
   integer getarg, load_rd, get_row, isatty, eval, parse, find_field
   integer compare_field
   character arg (MAXARG), summand (MAXARG), smin (MAXLINE), sval (MAXLINE)

   if (load_rd (rd, STDIN) ~= OK)
      call error ("Cannot load input relation"p)

   if (getarg (3, arg, MAXARG) ~= EOF )
      call error ("Usage: rdmin [<selection expr>] <attr>"p)
   if (getarg (2, summand, MAXARG) ~= EOF ) {
      flag = 0
      i = getarg (1, arg, MAXARG)
   }
   else if (getarg(1, summand, MAXARG) ~= EOF) {
      flag = 1
   }
   else
      call error ("Usage: rdmin [<selection expr>] <attr>"p)

   pos = find_field (rd, summand)
   if (pos == 0)
      call error ("Domain not found"p)

   if (flag == 0)
      if (parse (rd, 0, arg, rpn, cbuf) ~= OK)
         stop

DB for (i = 1; rpn (i) ~= EOS; i += 1)
DB    call print (ERROUT, "*i (*,8i) "s, rpn (i), rpn (i))
DB call print (ERROUT, "*n"s)

   n = 0
   while (get_row (rd, STDIN, row) ~= EOF)
      if (flag == 0) {
         if (eval (rd, row, rpn, cbuf) == YES ) {
            select
               when (RFTYPE (rd,pos) == INTEGER_TYPE) {
                  call get_data (rd, pos, row, ival)
                  if ( n == 0 || ival < imin )
                     imin = ival
               }
               when (RFTYPE (rd,pos) == REAL_TYPE) {
                  call get_data (rd, pos, row, rval)
                  if (n == 0 || rval < rmin )
                     rmin = rval
               }
               when (RFTYPE (rd,pos) == STRING_TYPE) {
                  call get_data (rd, pos, row, sval)
                  if (n == 0 || compare_field (STRING_TYPE, sval, smin) == 1)
                     call ctoc (sval, smin, MAXLINE)
               }
            n = n+1
         }
      }
      else {
         select
            when (RFTYPE (rd,pos) == INTEGER_TYPE) {
               call get_data (rd, pos, row, ival)
               if ( n == 0 || ival < imin )
                  imin = ival
            }
            when (RFTYPE (rd,pos) == REAL_TYPE) {
               call get_data (rd, pos, row, rval)
               if (n == 0 || rval < rmin )
                  rmin = rval
            }
            when (RFTYPE (rd,pos) == STRING_TYPE) {
               call get_data (rd, pos, row, sval)
               if (n == 0 || compare_field (STRING_TYPE, sval, smin) == 1)
                  call ctoc (sval, smin, MAXLINE)
            }
         n = n+1
      }

   if (n > 0 ) {
      select
         when (RFTYPE (rd, pos) == INTEGER_TYPE)
            call print (STDOUT, "*l over *i values*n"s, imin, n)
         when (RFTYPE (rd, pos) == REAL_TYPE)
            call print (STDOUT, "*d over *i values*n"s, rmin, n)
         when (RFTYPE (rd, pos) == STRING_TYPE)
            call print (STDOUT, "*s over *i values*n"s, smin, n)
   }
   else
      call print (STDOUT, "No rows satisfy selection expression*n"s)

   stop
   end


include "rdb_parse.r.i"
include "rdb_sub.r.i"
