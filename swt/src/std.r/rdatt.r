# rdatt --- output list of attributes of relation

   include "rdb_def.r.i"
   include ARGUMENT_DEFS

   define (DB,#)

   relation_des rd (RDSIZE)
   integer i
   integer load_rd
   integer row (RDATASIZE)
   integer get_row
   character type (MAXLINE)
   ARG_DECL

   PARSE_COMMAND_LINE ("tln"s, "Usage:  rdatt (-t | -l | -n)"s)

   if (load_rd (rd, STDIN) ~= OK)
      call error ("Can't access input relation"p)

   for (i = FIRSTRF (rd); ISLASTRF (rd, i); i = NEXTRF (rd, i)) {

      if (ARG_PRESENT(t)) {
         select (RFTYPE (rd, i))
            when (INTEGER_TYPE)
               call ctoc ("integer"s, type, MAXLINE)
            when (REAL_TYPE)
               call ctoc ("real"s, type, MAXLINE)
            when (STRING_TYPE)
               call ctoc ("string"s, type, MAXLINE)
         if (ARG_PRESENT(n)) {
            if (ARG_PRESENT(l)) {
               call print (STDOUT, "  *7s   *5i    *16s  *n"s,
                        type, RFLEN (rd, i), RFNAME (rd, i))
            }
            else if (~ARG_PRESENT(l)) {
               call print (STDOUT, "  *7s    *16s  *n"s,
                        type, RFNAME (rd, i))
            }
         }
         else if (~ARG_PRESENT(n)) {
            if (ARG_PRESENT(l)) {
               call print (STDOUT, "  *7s   *5i    *n"s,
                        type, RFLEN (rd, i))
            }
            else if (~ARG_PRESENT(l)) {
               call print (STDOUT, "  *7s    *n"s, type)
            }
         }
      }
      else if (~ARG_PRESENT(t)) {
         if (ARG_PRESENT(n)) {
            if (ARG_PRESENT(l)) {
               call print (STDOUT, "  *5i    *16s  *n"s,
                        RFLEN (rd, i), RFNAME (rd, i))
            }
               else if (~ARG_PRESENT(l)) {
               call print (STDOUT, "  *16s  *n"s, RFNAME (rd, i))
            }
         }
         else if (~ARG_PRESENT(n)) {
            if (ARG_PRESENT(l)) {
               call print (STDOUT, "  *5i    *n"s, RFLEN (rd, i))
            }
            else if (~ARG_PRESENT(l)) {
               select (RFTYPE (rd, i))
                  when (INTEGER_TYPE)
                     call ctoc ("integer"s, type, MAXLINE)
                  when (REAL_TYPE)
                     call ctoc ("real"s, type, MAXLINE)
                  when (STRING_TYPE)
                     call ctoc ("string"s, type, MAXLINE)
               call print (STDOUT, "  *7s   *5i    *16s  *n"s,
                        type, RFLEN (rd, i), RFNAME (rd, i))
            }
         }
      }
   }

   stop
   end

include "rdb_sub.r.i"
