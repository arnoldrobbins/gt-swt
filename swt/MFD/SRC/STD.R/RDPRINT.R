# rdprint --- print a relation or relation descriptor

   include "rdb_def.r.i"
   include ARGUMENT_DEFS

   define (DB,#)

   relation_des rd (RDSIZE)
   integer load_rd
   integer row (RDATASIZE)
   integer get_row
   ARG_DECL

   PARSE_COMMAND_LINE ("dr"s, "Usage:  rdprint (-d | -r)"s)

   if (load_rd (rd, STDIN) ~= OK)
      call error ("Can't access input relation"p)

   if (~ ARG_PRESENT (r) || ARG_PRESENT (d))
      call print_rd (rd, STDOUT)

   if (~ ARG_PRESENT (d) || ARG_PRESENT (r)) {
      call print_header (rd, STDOUT)
      while (get_row (rd, STDIN, row) ~= EOF)
         call print_row (rd, STDOUT, row)
      call print_trailer (rd, STDOUT)
      }

   stop
   end



include "rdb_sub.r.i"
