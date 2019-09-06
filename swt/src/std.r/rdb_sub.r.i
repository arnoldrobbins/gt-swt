# load_rd --- load relation descriptor from file

   integer function load_rd (rd, fd)
   relation_des rd (RDSIZE)
   file_des fd

   integer isatty, readf

   if (isatty (fd) == YES) {
      call remark ("Sorry, a relation can't be read from the terminal"p)
      return (ERR)
      }

   if (readf (RDLEN (rd), 1, fd) == EOF)
      return (ERR)

   if (readf (RDLASTFLD (rd), RDLEN (rd) - 1, fd) == EOF) {
      call remark ("relation is corrupted!!"p)
      return (ERR)
      }

   return (OK)
   end



# save_rd --- save a relation description on a file

   subroutine save_rd (rd, fd)
   relation_des rd (RDSIZE)
   file_des fd

   integer isatty

   if (isatty (fd) == YES)
      call print_rd (rd, fd)
   else
      call writef (rd, RDLEN (rd), fd)

   return
   end



# print_rd --- display a relation descriptor in readable form

   subroutine print_rd (rd, fd)
   relation_des rd (RDSIZE)
   file_des fd

   integer i
   character type (MAXLINE)

   call print (fd, "*39,,-x*n"s)
   call print (fd, "| type    | length | name*13x|*n"s)
   call print (fd, "*39,,-x*n"s)

   for (i = FIRSTRF (rd); ISLASTRF (rd, i); i = NEXTRF (rd, i)) {

      select (RFTYPE (rd, i))
         when (INTEGER_TYPE)
            call ctoc ("integer"s, type, MAXLINE)
         when (REAL_TYPE)
            call ctoc ("real"s, type, MAXLINE)
         when (STRING_TYPE)
            call ctoc ("string"s, type, MAXLINE)

      call print (fd, "| *7s | *5i  | *16s |*n"s,
                      type, RFLEN (rd, i), RFNAME (rd, i))
#     call print (fd, "t=*i  l=*i  s=*i  e=*i  p=*i  n=*s*n"s,
#        RFTYPE (rd, i), RFLEN (rd, i), RFSPOS (rd, i),
#        RFEPOS (rd, i), RFPLEN (rd, i), RFNAME (rd, i))
      }

   call print (fd, "*39,,-x*n"s)

#  call print (fd, "rdl=*i  rdf=*i rdr=*i*n"s, RDLEN (rd),
#       RDLASTFLD (rd), RDROWLEN (rd))
   return
   end



# add_field_to_rd --- add a field to an existing relation descriptor

   integer function add_field_to_rd (rd, type, len, name)
   relation_des rd (RDSIZE)
   integer type, len
   character name (ARB)

   integer i

   i = RDLASTFLD (rd) + RDENTRYSIZE
   if (i + RDENTRYSIZE - 1 > RDSIZE)
      return (0)

   RFTYPE (rd, i) = type
   RFPLEN (rd, i) = length (name)

   select (type)
      when (INTEGER_TYPE) {
         RFLEN (rd, i) = 2
         RFPLEN (rd, i) = max0 (RFPLEN (rd, i), 10)
         }
      when (REAL_TYPE) {
         RFLEN (rd, i) = 4
         RFPLEN (rd, i) = max0 (RFPLEN (rd, i), 15)
         }
      when (STRING_TYPE) {
         RFLEN (rd, i) = len
         RFPLEN (rd, i) = max0 (RFPLEN (rd, i), len)
         }
   else
      call error ("in add_field_to_rd: bogus type passed"p)

   RFSPOS (rd, i) = RDROWLEN (rd) + 1
   RFEPOS (rd, i) = RDROWLEN (rd) + RFLEN (rd, i)

   call ctoc (name, RFNAME (rd, i), RFNAMESIZE)

   RDLEN (rd) += RDENTRYSIZE
   RDLASTFLD (rd) += RDENTRYSIZE
   RDROWLEN (rd) += RFLEN (rd, i)

   if (RDROWLEN (rd) > RDATASIZE)
      return (0)

   return (i)
   end



# find_field --- given a field name, return its index

   integer function find_field (rd, name)
   relation_des rd (RDSIZE)
   character name (ARB)

   integer i
   integer equal

   for (i = FIRSTRF (rd); ISLASTRF (rd, i); i = NEXTRF (rd, i))
      if (equal (RFNAME (rd, i), name) == YES)
         return (i)

   return (0)
   end



# compare_field --- compare two same-type fields of a relation

   integer function compare_field (type, buf1, buf2)
   integer type
   integer buf1 (RDATASIZE), buf2 (RDATASIZE)


   integer r
   integer compare_integer, compare_real, compare_string


   select (type)
      when (INTEGER_TYPE)
         r = compare_integer (buf1, buf2)
      when (REAL_TYPE)
         r = compare_real (buf1, buf2)
      when (STRING_TYPE)
         r = compare_string (buf1, buf2)
   else {
      call print (ERROUT, "in compare_field: bogus type *i*n"s, type)
      r = 2
      }

DB call print (ERROUT, "in compare_field: *i*n"s, r)
   return (r)
   end



# compare_integer --- compare two long integers

   integer function compare_integer (i1, i2)
   longint i1, i2

DB call print (ERROUT, "in compare_integer: *l *l*n"s, i1, i2)

   if (i1 < i2)
      return (1)
   if (i1 > i2)
      return (3)
   return (2)
   end



# compare_real --- compare two double precision numbers

   integer function compare_real (d1, d2)
   longreal d1, d2

DB call print (ERROUT, "in compare_real: *d *d*n"s, d1, d2)

   if (d1 < d2)
      return (1)
   if (d1 > d2)
      return (3)
   return (2)
   end



# compare_string --- compare two character strings

   integer function compare_string (s1, s2)
   character s1 (ARB), s2 (ARB)

   integer i

DB call print (ERROUT, "in compare_string: '*s' '*s'*n"s, s1, s2)

   for (i = 1; s1 (i) == s2 (i) && s1 (i) ~= EOS; i += 1)
      ;

   if (s1 (i) == s2 (i))
      return (2)
   if (s1 (i) == EOS || s1 (i) < s2 (i))
      return (1)
   return (3)
   end



# print_header --- print a header for a relation

   subroutine print_header (rd, fd)
   relation_des rd (RDSIZE)
   file_des fd

   integer i

   call print (fd, "-"s)
   for (i = FIRSTRF (rd); ISLASTRF (rd, i); i = NEXTRF (rd, i))
      call print (fd, "*#,,-x"s, RFPLEN (rd, i) + 3)
   call print (fd, "*n"s)

   call print (fd, "|"s)
   for (i = FIRSTRF (rd); ISLASTRF (rd, i); i = NEXTRF (rd, i))
      call print (fd, " *#s |"s, RFPLEN (rd, i), RFNAME (rd, i))
   call print (fd, "*n"s)

   call print (fd, "-"s)
   for (i = FIRSTRF (rd); ISLASTRF (rd, i); i = NEXTRF (rd, i))
      call print (fd, "*#,,-x"s, RFPLEN (rd, i) + 3)
   call print (fd, "*n"s)

   return
   end



# print_trailer --- print trailer for a relation

   subroutine print_trailer (rd, fd)
   relation_des rd (RDSIZE)
   file_des fd

   integer i

   call print (fd, "-"s)
   for (i = FIRSTRF (rd); ISLASTRF (rd, i); i = NEXTRF (rd, i))
      call print (fd, "*#,,-x"s, RFPLEN (rd, i) + 3)
   call print (fd, "*n"s)

   return
   end



# print_row --- print a row of a relation

   subroutine print_row (rd, fd, buf)
   relation_des rd (RDSIZE)
   file_des fd
   integer buf (RDATASIZE)

   integer i

   call print (fd, "|"s)
   for (i = FIRSTRF (rd); ISLASTRF (rd, i); i = NEXTRF (rd, i))
      select (RFTYPE (rd, i))
         when (INTEGER_TYPE)
            call print (fd, " *#l |"s, RFPLEN (rd, i), buf (RFSPOS (rd, i)))
         when (REAL_TYPE)
            call print (fd, " *#d |"s, RFPLEN (rd, i), buf (RFSPOS (rd, i)))
         when (STRING_TYPE)
            call print (fd, " *#,#s |"s, RFPLEN (rd, i),
               RFLEN (rd, i), buf (RFSPOS (rd, i)))
   call print (fd, "*n"s)

   return
   end



# get_row --- read a row of a relation from a file

   integer function get_row (rd, fd, buf)
   relation_des rd (RDSIZE)
   file_des fd
   integer buf (RDATASIZE), i

   integer readf

   i = readf (buf, RDROWLEN (rd), fd)
   return (i)

   end



# put_row --- write a row of a relation to a file

   subroutine put_row (rd, fd, buf)
   relation_des rd (RDSIZE)
   file_des fd
   integer buf (RDATASIZE)

   integer isatty

   if (isatty (fd) == YES)
      call print_row (rd, fd, buf)
   else
      call writef (buf, RDROWLEN (rd), fd)

   return
   end



# get_data --- obtain a field of a relation

   subroutine get_data (rd, i, buf, dest)
   relation_des rd (RDSIZE)
   integer i, buf (ARB), dest (MAXLINE)

   integer j, k

   select (RFTYPE (rd, i))
      when (INTEGER_TYPE) {
         j = RFSPOS (rd, i)
         dest (1) = buf (j)
         dest (2) = buf (j + 1)
         }
      when (REAL_TYPE) {
         j = RFSPOS (rd, i)
         dest (1) = buf (j)
         dest (2) = buf (j + 1)
         dest (3) = buf (j + 2)
         dest (4) = buf (j + 3)
         }
      when (STRING_TYPE) {
         for ({j = RFEPOS (rd, i); k = RFLEN (rd, i)};
               k > 0 && buf (j) == ' 'c; {j -= 1; k -= 1})
            ;
         dest (k + 1) = EOS
         for (; k > 0; {j -= 1; k -= 1})
            dest (k) = buf (j)
         }

   return
   end



# put_data --- put data into a field in a row of a relation

   subroutine put_data (rd, i, buf, src)
   relation_des rd (RDSIZE)
   integer i, buf (ARB), src (MAXLINE)

   integer j, k

   select (RFTYPE (rd, i))
      when (INTEGER_TYPE) {
         j = RFSPOS (rd, i)
         buf (j) = src (1)
         buf (j + 1) = src (2)
         }
      when (REAL_TYPE) {
         j = RFSPOS (rd, i)
         buf (j) = src (1)
         buf (j + 1) = src (2)
         buf (j + 2) = src (3)
         buf (j + 3) = src (4)
         }
      when (STRING_TYPE) {
         for ({j = RFSPOS (rd, i); k = 1};
               src (k) ~= EOS && k <= RFLEN (rd, i); {j += 1; k += 1})
            buf (j) = src (k)
         for (; k <= RFLEN (rd, i); {k += 1; j += 1})
            buf (j) = ' 'c
         }

   return
   end



# compare_row --- compare two same-type rows of a relation

   integer function compare_row (rd, row1, row2)
   integer rd(RDSIZE)
   integer row1 (RDATASIZE), row2 (RDATASIZE)
   integer buf1 (RDATASIZE), buf2 (RDATASIZE)

   integer r, i
   integer compare_field

   for ( i = FIRSTRF (rd); ISLASTRF (rd, i); i = NEXTRF (rd, i)) {
      call get_data (rd, i, row1, buf1)
      call get_data (rd, i, row2, buf2)
      r = compare_field ( RFTYPE (rd, i), buf1, buf2)
      if (r ~= 2)
         return (r)
   }

   return (2)
   end
