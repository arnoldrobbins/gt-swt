# rdsel --- select designated rows of a relation

   include "rdb_def.r.i"

   define (DB,#)

   relation_des rd (RDSIZE)
   integer row (RDATASIZE), rpn (RPNSIZE), cbuf (RDATASIZE)
   integer getarg, load_rd, get_row, isatty, eval, parse
   character arg (MAXARG)

DB integer i

   if (load_rd (rd, STDIN) ~= OK)
      call error ("Cannot load input relation"p)

   if (getarg (2, arg, MAXARG) ~= EOF || getarg (1, arg, MAXARG) == EOF)
      call error ("Usage: rdsel <selection expr>"p)

   if (parse (rd, 0, arg, rpn, cbuf) ~= OK)
      stop

DB for (i = 1; rpn (i) ~= EOS; i += 1)
DB    call print (ERROUT, "*i (*,8i) "s, rpn (i), rpn (i))
DB call print (ERROUT, "*n"s)

   call save_rd (rd, STDOUT)

   if (isatty (STDOUT) == YES)
      call print_header (rd, STDOUT)

   while (get_row (rd, STDIN, row) ~= EOF)
      if (eval (rd, row, rpn, cbuf) == YES)
         call put_row (rd, STDOUT, row)

   if (isatty (STDOUT) == YES)
      call print_trailer (rd, STDOUT)

   stop
   end


include "rdb_parse.r.i"
include "rdb_sub.r.i"
