# rdnat --- perform the natural join of two relations

   include "rdb_def.r.i"

   define (DB,#)

   relation_des rd1 (RDSIZE), rd2 (RDSIZE), rd3 (RDSIZE), rd4 (RDSIZE)
   integer errs, ap, lastap, i1, i2, i, j, k, l, pos2, put
   integer match1 (MAXFIELDS), match2 (MAXFIELDS)
   integer out1 (MAXFIELDS), out2 (MAXFIELDS)
   integer row1 (RDATASIZE), row2 (RDATASIZE)
   integer row3 (RDATASIZE), row4 (RDATASIZE), buf (RDATASIZE)
   integer buf1 (RDATASIZE), buf2 (RDATASIZE)
   integer rpn (RPNSIZE), cbuf (RDATASIZE)
   integer getarg, load_rd, get_row, isatty, eval, parse, add_field_to_rd
   integer get_name, find_field, find_qual_field, compare_field
   character arg (MAXARG), oldname (MAXARG), newname (RFNAMESIZE)
   file_mark m
   file_mark markf

  ### Load the descriptors for the original relations

   if (load_rd (rd1, STDIN) ~= OK)
      call error ("Cannot load input relation 1"p)

   if (load_rd (rd2, STDIN2) ~= OK)
      call error ("Cannot load input relation 2"p)


  ### create the result relation descriptor in rd3

   call move$ (rd1, rd3, RDLEN (rd1))

#   determine join fields and build output relation descriptor

   ap = 0
   for (i = FIRSTRF (rd2) ; ISLASTRF (rd2, i) ; i = NEXTRF(rd2, i)) {
      j = find_field (rd3, RFNAME (rd2,i) )
      if (j == 0) {
         pos2 = add_field_to_rd (rd3, RFTYPE (rd2, i), RFLEN (rd2, i),
                                 RFNAME (rd2, i))
         if (pos2 == 0)
            call error ("Resulting relation has too many domains"p)
         }
      else {
         ap = ap + 1
         match1 (ap) = j
         match2 (ap) = i
      }
   }
   lastap = ap

  ### Do the join operation and put out the new relation

   call save_rd (rd3, STDOUT)

   if (isatty (STDOUT) == YES)
      call print_header (rd3, STDOUT)

   m = markf (STDIN2)
   while (get_row (rd1, STDIN, row1 ) ~= EOF) {
      j = FIRSTRF (rd3)
      for (i = FIRSTRF(rd1); ISLASTRF(rd1, i); i = NEXTRF(rd1,i)) {
         call get_data (rd1, i, row1, buf1)
         call put_data (rd3, j, row3, buf1)
         j = NEXTRF(rd3, j)
      }

      call seekf (m, STDIN2)
      while (get_row (rd2, STDIN2, row2) ~= EOF) {

         put = 1
         for (ap = 1; ap <= lastap; ap += 1) {
            call get_data (rd1, match1 (ap), row1, buf1)
            call get_data (rd2, match2 (ap), row2, buf2)
            if (compare_field (RFTYPE (rd1, match1(ap)), buf1, buf2) ~= 2) {
               put = 0
            }
         }
         if (put == 1) {
            for (i = j; ISLASTRF(rd3, i); i = NEXTRF(rd3, i)) {
               k = find_field (rd2, RFNAME (rd3, i))
               if (k == 0)
                  call print (STDOUT, "field not found*n"s)
               else {
                  call get_data (rd2, k, row2, buf2)
                  call put_data (rd3, i, row3, buf2)
               }
            }
            call put_row (rd3, STDOUT, row3)
         }
      }
   }

   if (isatty (STDOUT) == YES)
      call print_trailer (rd3, STDOUT)

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


include "rdb_sub.r.i"
