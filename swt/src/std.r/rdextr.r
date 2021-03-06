# rdextr --- extract relation data from a relation

   include "rdb_def.r.i"

   define (DB,#)

   relation_des rd (RDSIZE)

   integer i, j, errs
   integer fp, flen (MAXFIELDS), fdelim (MAXFIELDS), findex (MAXFIELDS), lastfp
   integer row (RDATASIZE), buf (MAXLINE)
   integer getrow, find_field, load_rd, ctoi, getlin
   character str (MAXDATASIZE), word (MAXLINE), name (MAXLINE)

   define (SYNERR (m), {errs += 1; call print (ERROUT,m ": *s"s, str)})

   errs = 0

   if (load_rd (rd, STDIN) ~= OK)
      call error ("Cannot access input relation"p)

  ### Read in and build the output format table
   for (fp = 1; getlin (str, STDIN2) ~= EOF; fp += 1) {

      i = 1
      call getword (str, i, name)

      findex (fp) = find_field (rd, name)
      if (findex (fp) == 0)
         SYNERR (": domain not found")

      flen (fp) = 0
      fdelim (fp) = ' 'c

      repeat {
         call getword (str, i, word)
         select (word (1))
            when ('d'c, 'D'c)
               fdelim (fp) = word (2)     # May be an EOS
            when ('l'c, 'L'c) {
               j = 2
               flen (fp) = ctoi (word, j)
               if (flen (fp) < 0 || word (j) ~= EOS)
                  SYNERR ("Illegal output length")
               }
            when (EOS, '#'c)
               break
         else
            SYNERR ("Unrecognized word")
         }
      }

   if (errs > 0)
      stop

  ### Construct and output the relation data

   lastfp = fp - 1
   while (getrow (rd, STDIN, row) ~= EOF)

      for (fp = 1; fp <= lastfp; fp += 1) {

         call get_data (rd, findex (fp), row, buf)

         select (RFTYPE (rd, findex (fp)))
            when (INTEGER_TYPE)
               call print (STDOUT, "*#l"s, flen (fp), buf)
            when (REAL_TYPE)
               call print (STDOUT, "*#d"s, flen (fp), buf)
            when (STRING_TYPE)
               call print (STDOUT, "*#s"s, flen (fp), buf)

         if (fp == lastfp)
            call print (STDOUT, "*n"s)
         else if (fdelim (fp) ~= EOS)
            call print (STDOUT, "*c"s, fdelim (fp))
         else if (flen (fp) <= 0)
            call print (STDOUT, " "s)

         }

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
