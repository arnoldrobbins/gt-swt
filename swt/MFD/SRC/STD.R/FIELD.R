# field --- select fields from standard input, transfer to standard output

# Field syntax:
#   <column>
#   <column>-<column>
#   s<string>
#   c<column>

   define(MAXFIELDS,20)
   define(STRINGSTORELEN,100)
   define(PADDEDFIELD,0)
   define(PADCOMMAND,'s'c)
   define(UCPADCOMMAND,'S'c)
   define(COLUMNFIELD,-2)
   define(COLCOMMAND,'c'c)
   define(UCCOLCOMMAND,'C'c)
   define(ENDOFFIELDS,-1)
   define(MAXRECORD,256)
   define(DEFAULT_WIDTH,72)

   integer getlin, getfld
   character in (MAXRECORD), out (MAXRECORD)
   integer fields (MAXFIELDS, 2), i, optf, argno, width
   character pads (STRINGSTORELEN)

   call getopt (optf, width, argno)
   if (getfld (argno, fields, pads, width) == ERR)
      call error ( _
         "Usage: field [-f[<width>]] {<col>[-<col>] | s<pad> | c<column>}"p)

   while (getlin (in, STDIN, MAXRECORD) ~= EOF) {
      call movfld (in, fields, pads, out, width)
      if (optf == NO) {            # fixed length output records?
         for (i = 1; out (i) ~= EOS; i = i + 1)
            ;
         repeat {
            i = i - 1
            if (i < 1 || out (i) ~= ' 'c)
               break
            }
         out (i + 1) = EOS
         }
      call putlin (out, STDOUT)
      call putch (NEWLINE, STDOUT)
      }

   stop
   end


# getfld --- get fields in arguments, placing them into arrays fields and pads
   integer function getfld (argno, fields, pads, recwidth)
   integer fields (MAXFIELDS, 2), argno, recwidth
   character pads (STRINGSTORELEN)

   character arg (MAXLINE)
   integer lasfld, laspad, from, to, ptr, narg
   integer getarg, ctoi, length

   lasfld = 0
   laspad = 0

   for (narg = argno; getarg (narg, arg, MAXLINE) ~= EOF; narg = narg + 1) {
      if (arg (1) == PADCOMMAND || arg (1) == UCPADCOMMAND) {
         laspad = laspad + 1
         if (laspad + length (arg) + 1 > STRINGSTORELEN) {
            call print (ERROUT, "*s: too many padding strings*n"p, arg)
            stop
            }
         call scopy (arg, 2, pads, laspad)
         lasfld = lasfld + 1
         if (lasfld >= MAXFIELDS) {
            call print (ERROUT, "*s: too many fields*n"p, arg)
            stop
            }
         fields (lasfld, 1) = PADDEDFIELD
         fields (lasfld, 2) = laspad
         laspad = laspad + length (arg)
         }
      else if (arg (1) == COLCOMMAND || arg (1) == UCCOLCOMMAND) {
         ptr = 2
         to = ctoi (arg, ptr)
         if (to < 1 || to > recwidth) {
            call print (ERROUT, "*s: column out of range*n"p, arg)
            stop
            }
         lasfld = lasfld + 1
         if (lasfld > MAXFIELDS) {
            call print (ERROUT, "*s: too many fields*n"p, arg)
            stop
            }
         fields (lasfld, 1) = COLUMNFIELD
         fields (lasfld, 2) = to
         }
      else {                           # check for column specifications
         ptr = 1
         from = ctoi (arg, ptr)
         if (from < 1 || from > recwidth) {
            call print (ERROUT, "*s: column out of range*n"p, arg)
            stop
            }
         if (arg (ptr) == EOS)
            to = from                  # "x" is equivalent to "x-x"
         else if (arg (ptr) ~= '-'c) {
            call print (ERROUT, "*s: bad column syntax*n"p, arg)
            stop
            }
         else {
            ptr = ptr + 1
            to = ctoi (arg, ptr)
            if (to < 1 || to > recwidth) {
               call print (ERROUT, "*s: column out of range*n"p, arg)
               stop
               }
            }
         lasfld = lasfld + 1
         if (lasfld >= MAXFIELDS) {
            call print (ERROUT, "*s: too many fields*n"p, arg)
            stop
            }
         fields (lasfld, 1) = from
         fields (lasfld, 2) = to
         }
      }

   if (narg == argno) {                  # take default action: 1-width
      fields (1, 1) = 1
      fields (1, 2) = recwidth
      lasfld = 1
      }

   fields (lasfld + 1, 1) = ENDOFFIELDS
   getfld = OK

   return
   end


# movfld --- move fields specified by fields and pads from in to out
   subroutine movfld (in, fields, pads, out, recwidth)
   character in (MAXRECORD), out (MAXRECORD), pads (STRINGSTORELEN)
   integer fields (MAXFIELDS, 2), recwidth

   integer outptr, i, fld
   integer index, length

   i = index (in, NEWLINE)
   if (i == 0)
      i = length (in)
   for ( ; i <= recwidth; i = i + 1)
      in (i) = ' 'c
   in (i) = EOS

   for (outptr = 1; outptr <= recwidth; outptr = outptr + 1)
      out (outptr) = ' 'c
   outptr = 0
   for (fld = 1; fields (fld, 1) ~= ENDOFFIELDS; fld = fld + 1) {
      if (fields (fld, 1) == PADDEDFIELD) {
         for (i = fields (fld, 2); pads (i) ~= EOS; i = i + 1) {
            outptr = outptr + 1
            out (outptr) = pads (i)
            }
         }
      else if (fields (fld, 1) == COLUMNFIELD) {
         outptr = fields (fld, 2) - 1
         }
      else {
         for (i = fields (fld, 1); i <= fields (fld, 2); i = i + 1) {
           outptr = outptr + 1
           out (outptr) = in (i)
           }
         }
      }

   out (outptr + 1) = EOS
   return
   end


# getopt --- get option letters in first argument (if any)
   subroutine getopt (optf, width, argno)
   integer optf, argno, width

   character arg (MAXLINE)
   integer getarg, ctoi
   integer j

   width = MAXRECORD - 1
   optf = NO
   if (getarg (1, arg, MAXLINE) == EOF
   || arg (1) ~= '-'c) {
      argno = 1
      return
      }

   if (arg (2) == 'f'c || arg (2) == 'F'c) {
      optf = YES
      j = 3
      width = ctoi (arg, j)
      if (width < 1 || width >= MAXRECORD)
         width = DEFAULT_WIDTH
      argno = 2
      }
   else
      argno = 1

   return
   end
