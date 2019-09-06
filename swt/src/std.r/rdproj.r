# rdproj --- project a relation over the specified domains

   include "rdb_def.r.i"

   define (DB,#)

   relation_des rd1 (RDSIZE), rd2 (RDSIZE)
   integer errs, ap, lastap, i1, i2, i, j
   integer fx1 (MAXFIELDS), fx2 (MAXFIELDS)
   integer row1 (RDATASIZE), row2 (RDATASIZE), buf (RDATASIZE)
   integer getarg, get_name, find_field, isatty
   integer add_field_to_rd, get_row, load_rd
   character arg (MAXARG), oldname (RFNAMESIZE), newname (RFNAMESIZE)

   if (load_rd (rd1, STDIN) ~= OK)
      call error ("Can't access input relation"p)

   init_rd (rd2)

   errs = 0

   for (ap = 1; getarg (ap, arg, MAXARG) ~= EOF; ap += 1) {
      if (ap > MAXFIELDS)
         call error ("Too many fields in new relation"p)

      if (get_name (arg, oldname, newname) ~= OK) {
         call print (ERROUT, "*s: invalid name*n"s, arg)
         errs += 1
         next
         }

      i1 = find_field (rd1, oldname)
      if (i1 == 0) {
         call print (ERROUT, "*s: field not found*n"s, oldname)
         errs += 1
         next
         }

      if (find_field (rd2, newname) ~= 0) {
         call print (ERROUT, "*s: duplicate field*n"s, newname)
         errs += 1
         next
         }

      i2 = add_field_to_rd (rd2, RFTYPE (rd1, i1),
                  RFLEN (rd1, i1), newname)
      if (i2 == 0) {
         call print (ERROUT, "*s: cannot add new field*n"s, newname)
         errs += 1
         next
         }

      fx1 (ap) = i1
      fx2 (ap) = i2
      }

   if (ap > 1)
      lastap = ap - 1
   else {
      call move$ (rd1, rd2, RFLEN (rd1))
      for ({j = 1; i = FIRSTRF (rd1)}; ISLASTRF (rd1, i);
                    {j += 1; i = NEXTRF (rd1, i)}) {
         fx1 (j) = i
         fx2 (j) = i
         }
      lastap = j - 1
      }

   if (errs > 0)
      stop

   call save_rd (rd2, STDOUT)

   if (isatty (STDOUT) == YES)
      call print_header (rd2, STDOUT)

   while (get_row (rd1, STDIN, row1) ~= EOF) {

      for (ap = 1; ap <= lastap; ap += 1) {
         call get_data (rd1, fx1 (ap), row1, buf)
         call put_data (rd2, fx2 (ap), row2, buf)
         }

      call put_row (rd2, STDOUT, row2)
      }

   if (isatty (STDOUT) == YES)
      call print_trailer (rd2, STDOUT)

   stop
   end



# get_name --- parse a field name specification

   integer function get_name (arg, oldname, newname)
   character arg (ARB), oldname (RFNAMESIZE), newname (RFNAMESIZE)

   integer i, j

   newname (1) = EOS
   oldname (1) = EOS

   if (~ IS_LETTER (arg (1)))
      return (ERR)

   oldname (1) = arg (1)
   for (i = 2; arg (i) ~= EOS && arg (i) ~= '='c && i < RFNAMESIZE; i += 1) {
      if (~ IS_LETTER (arg (i)) && ~ IS_DIGIT (arg (i))
                     && arg (i) ~= '_'c) {
         oldname (1) = EOS
         return (ERR)
         }
      oldname (i) = arg (i)
      }
   oldname (i) = EOS

   if (arg (i) == EOS)
      call ctoc (oldname, newname, RFNAMESIZE)
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


include "rdb_sub.r.i"
