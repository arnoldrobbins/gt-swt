# rdjoin --- join and project two relations

   include "rdb_def.r.i"

   define (DB,#)

   relation_des rd1 (RDSIZE), rd2 (RDSIZE), rd3 (RDSIZE), rd4 (RDSIZE)
   integer errs, ap, lastap, i1, i2, i, j, pos2
   integer fx1 (MAXFIELDS), fx2 (MAXFIELDS)
   integer row3 (RDATASIZE), row4 (RDATASIZE), buf (RDATASIZE)
   integer rpn (RPNSIZE), cbuf (RDATASIZE)
   integer getarg, load_rd, get_row, isatty, eval, parse, add_field_to_rd
   integer get_name, find_field, find_qual_field
   character arg (MAXARG), oldname (MAXARG), newname (RFNAMESIZE)
   file_mark m
   file_mark markf

  ### Load the descriptors for the original relations
   if (load_rd (rd1, STDIN) ~= OK)
      call error ("Cannot load input relation 1"p)

   if (load_rd (rd2, STDIN2) ~= OK)
      call error ("Cannot load input relation 2"p)

  ### Build the temporary (big) relation descriptor in rd3
   call move$ (rd1, rd3, RDLEN (rd1))
   i = FIRSTRF (rd2)
   pos2 = add_field_to_rd (rd3, RFTYPE (rd2, i), RFLEN (rd2, i), RFNAME (rd2, i))
   if (pos2 == 0)
      call error ("Resulting relation has too many domains"p)
   for (i = NEXTRF (rd2, i); ISLASTRF (rd2, i); i = NEXTRF (rd2, i))
      if (add_field_to_rd (rd3, RFTYPE (rd2, i), RFLEN (rd2, i),
                                 RFNAME (rd2, i)) == 0)
         call error ("Resulting relation has too many domains"p)
   if (getarg (1, arg, MAXARG) == EOF)
      call error ("Usage: rdjoin <selection expr> { <domain> }"p)

   if (parse (rd3, pos2, arg, rpn, cbuf) ~= OK)
      stop

DB for (i = 1; rpn (i) ~= EOS; i += 1)
DB    call print (ERROUT, "*i (*,8i) "s, rpn (i), rpn (i))
DB call print (ERROUT, "*n"s)

  ### create the result relation descriptor in rd4
   errs = 0

   init_rd (rd4)
   for (ap = 1; getarg (ap + 1, arg, MAXARG) ~= EOF; ap += 1) {
      if (ap > MAXFIELDS)
         call error ("Too many fields in new relation"p)

      if (get_name (arg, oldname, newname) ~= OK) {
         call print (ERROUT, "*s: invalid name*n"s, arg)
         errs += 1
         next
         }

      i1 = find_qual_field (rd3, oldname, pos2)
      if (i1 == 0) {
         call print (ERROUT, "*s: domain not found*n"s, oldname)
         errs += 1
         next
         }

      if (find_field (rd4, newname) ~= 0) {
         call print (ERROUT, "*s: duplicate output domain*n"s, newname)
         errs += 1
         next
         }

      i2 = add_field_to_rd (rd4, RFTYPE (rd3, i1),
                  RFLEN (rd3, i1), newname)
      if (i2 == 0) {
         call print (ERROUT, "*s: cannot add new domain*n"s, newname)
         errs += 1
         next
         }

      fx1 (ap) = i1
      fx2 (ap) = i2
      }

   if (ap > 1)
      lastap = ap - 1
   else {
      for ({j = 1; i = FIRSTRF (rd3)}; ISLASTRF (rd3, i);
                    {j += 1; i = NEXTRF (rd3, i)}) {
         if (find_field (rd4, RFNAME (rd3, i)) ~= 0) {
            call print (ERROUT, "*s: duplicate output domain*n"s, RFNAME (rd3, i))
            errs += 1
            }
         if (add_field_to_rd (rd4, RFTYPE (rd3, i),
                        RFLEN (rd3, i), RFNAME (rd3, i)) == 0)
            call error ("can't add new domain!!"p)
         fx1 (j) = i
         fx2 (j) = i
         }
      lastap = j - 1
      }

   if (errs > 0)
      stop

  ### Do the join operation and put out the new relation
   call save_rd (rd4, STDOUT)

   if (isatty (STDOUT) == YES)
      call print_header (rd4, STDOUT)

   m = markf (STDIN)
   while (get_row (rd2, STDIN2, row3 (RDROWLEN (rd1) + 1)) ~= EOF) {

      call seekf (m, STDIN)
      while (get_row (rd1, STDIN, row3) ~= EOF) {

         if (eval (rd3, row3, rpn, cbuf) == YES) {

            for (ap = 1; ap <= lastap; ap += 1) {
               call get_data (rd3, fx1 (ap), row3, buf)
               call put_data (rd4, fx2 (ap), row4, buf)
               }

            call put_row (rd4, STDOUT, row4)
            }
         }
      }

   if (isatty (STDOUT) == YES)
      call print_trailer (rd4, STDOUT)

   stop
   end



# get_name --- parse a field name specification

   integer function get_name (arg, oldname, newname)
   character arg (ARB), oldname (MAXARG), newname (RFNAMESIZE)

   integer i, j

   newname (1) = EOS
   oldname (1) = EOS

   if (~ IS_LETTER (arg (1)))
      return (ERR)

   oldname (1) = arg (1)
   for (i = 2; arg (i) ~= EOS && arg (i) ~= '='c && i < MAXARG; i += 1) {
      if (~ IS_LETTER (arg (i)) && ~ IS_DIGIT (arg (i))
                     && arg (i) ~= '_'c && arg (i) ~= '.'c) {
         oldname (1) = EOS
         return (ERR)
         }
      oldname (i) = arg (i)
      }
   oldname (i) = EOS

   if (arg (i) == EOS) {
      for (i = 1; arg (i) ~= '.'c && arg (i) ~= EOS && i < RFNAMESIZE; i += 1)
         newname (i) = arg (i)
      newname (i) = EOS
      }
   else if (arg (i) == '='c) {
      i += 1
      if (~ IS_LETTER (arg (i)))
         return (ERR)
      newname (1) = arg (i)
      for ({j = 2; i += 1}; arg (i) ~= EOS && j < RFNAMESIZE;
                        {j += 1; i += 1}) {
         if (~ IS_LETTER (arg (i)) && ~ IS_DIGIT (arg (i))
                        && arg (i) ~= '_'c) {
            newname (1) = EOS
            return (ERR)
            }
         newname (j) = arg (i)
         }
      newname (j) = EOS
      if (arg (i) ~= EOS)
         return (ERR)
      }
   else
      return (ERR)

DB call print (ERROUT, "in get_name: *s *s *s*n"s, arg, oldname, newname)
   return (OK)
   end


include "rdb_parse.r.i"
include "rdb_sub.r.i"
