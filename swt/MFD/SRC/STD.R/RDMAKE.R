# rdmake --- create a relation from a description file and a data file

   include "rdb_def.r.i"

   define (DB,#)

   relation_des rd (RDSIZE)

   integer i, j, type, len, errs
   integer fp, flen (MAXFIELDS), fdelim (MAXFIELDS), findex (MAXFIELDS), lastfp
   integer row (RDATASIZE)
   integer getlin, add_field_to_rd, ctoi, find_field, ctoc, isatty

   character str (MAXLINE), word (MAXLINE), name (MAXLINE)
   character buf (MAXDATASIZE)

   longint l
   longint gctol

   longreal d
   longreal ctod

   define (SYNERR (m), {errs += 1; call print (ERROUT,m ": *s"s, str)})

   errs = 0

   init_rd (rd)

  ### Read in and build the relation descriptor
   for (fp = 1; getlin (str, STDIN2) ~= EOF; fp += 1) {

      i = 1
      call getword (str, i, word)
      select (word (1))
         when ('i'c, 'I'c)
            type = INTEGER_TYPE
         when ('r'c, 'R'c)
            type = REAL_TYPE
         when ('s'c, 'S'c) {
            type = STRING_TYPE
            j = 2
            len = ctoi (word, j)
            if (len == 0 || word (j) ~= EOS)
               SYNERR ("Illegal length")
            }
      else
         SYNERR ("Illegal data type")

      call getword (str, i, name)

      if (~ IS_LETTER (name (1)))
         SYNERR ("Illegal field name")
      else
         for (j = 1; name (j) ~= EOS; j += 1)
            if (~ IS_LETTER (name (j)) && ~ IS_DIGIT (name (j))
                              && name (j) ~= '_'c) {
               SYNERR ("Illegal field name")
               break
               }

      if (find_field (rd, name) ~= 0)
         SYNERR ("Duplicate name")

      findex (fp) = add_field_to_rd (rd, type, len, name)
      if (findex (fp) == 0)
         SYNERR ("Can't add field")

      flen (fp) = MAXDATASIZE
      fdelim (fp) = ' 'c

      repeat {
         call getword (str, i, word)
         select (word (1))
            when ('d'c, 'D'c)
               fdelim (fp) = word (2)        # May be an EOS
            when ('l'c, 'L'c) {
               j = 2
               flen (fp) = ctoi (word, j)
               if (flen (fp) < 1 || word (j) ~= EOS)
                  SYNERR ("Illegal input length")
               }
            when (EOS, '#'c)
               break
         else
            SYNERR ("Unrecognized word")
         }
      }

   if (errs > 0)
      stop

   call save_rd (rd, STDOUT)

  ### Construct and output the relation data
   if (isatty (STDOUT) == YES)
      call print_header (rd, STDOUT)

   lastfp = fp - 1
   while (getlin (buf, STDIN) ~= EOF) {

      i = 1
      for (fp = 1; fp <= lastfp; fp += 1) {

         while (buf (i) == fdelim (fp))
            i += 1

         for (j = 1; buf (i) ~= NEWLINE && buf (i) ~= EOS _
                   && buf (i) ~= fdelim (fp) && j <= flen (fp); _
                   {i += 1; j += 1})
            str (j) = buf (i)
         str (j) = EOS
         if (buf (i) == fdelim (fp))
            i += 1

         select (RFTYPE (rd, findex (fp)))
            when (INTEGER_TYPE) {
               j = 1
               l = gctol (str, j, 10)
               if (str (j) ~= EOS)
                  call print (ERROUT, "*s: bad integer*n"s, str)
               call put_data (rd, findex (fp), row, l)
               }
            when (REAL_TYPE) {
               j = 1
               d = ctod (str, j)
               if (str (j) ~= EOS)
                  call print (ERROUT, "*s: bad real*n"s, str)
               call put_data (rd, findex (fp), row, d)
               }
            when (STRING_TYPE) {
               j = ctoc (str, word, RFLEN (rd, findex (fp)) + 1)
               for (j += 1; j <= RFLEN (rd, findex (fp)); j += 1)
                  word (j) = ' 'c
               call put_data (rd, findex (fp), row, word)
               }
         }

      call put_row (rd, STDOUT, row)
      }

   if (isatty (STDOUT) == YES)
      call print_trailer (rd, STDOUT)

   stop
   end



# getword --- isolate a word from a string

   subroutine getword (str, i, word)
   character str (ARB), word (MAXLINE)
   integer i

   integer j

   SKIPBL (str, i)

   for (j = 1; str (i) ~= ' 'c && str (i) ~= NEWLINE
               && str (i) ~= EOS; {i += 1; j += 1} )
      word (j) = str (i)
   word (j) = EOS

   return
   end


include "rdb_sub.r.i"
