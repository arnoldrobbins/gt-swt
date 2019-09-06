# lz --- format fmt output for Xerox 9700 lazer printer

include ARGUMENT_DEFS

define (DEFAULT_PAGE_SIZE,87)
define (FORMAT,"GTPF6"s)
define (MAXWIDTH,100)
define (MAXLINE,1454)            # ((4 * OVERSTRIKES + 3) * (MAXLINE - 2) + 2) ?????
define (BSNP,8r10)
define (FFNP,8r14)
define (SPNP,8r40)
define (BOLD,'2'c)
define (ITALIC,'3'c)
define (NORMAL,'1'c)

   character c
   character oba(MAXLINE)           # output, basic information
   character obf(MAXLINE)           # output, bold face information
   character oul(MAXLINE)           # output, underline information
   character oubf(MAXLINE)          # output, bf and ul
   character ibuf(MAXLINE)          # input buffer

   integer i, ibp, obp, newlines, topchar, empty
   integer page_size, line_ctr, overstrike
   integer getlin

   ARG_DECL

   procedure dump_buffer forward


   PARSE_COMMAND_LINE ("i l<ri>"s, "Usage: lz [-i] [-l <page length>]"s)
   ARG_DEFAULT_INT (l, DEFAULT_PAGE_SIZE)
   page_size = ARG_VALUE(l)

   line_ctr = page_size
   overstrike = NO
   newlines = 1
   topchar = 0
   ibp = 0
   ibuf(1) = EOS

   do i = 1, MAXLINE; {
      oba(i) = ' 'c
      obf(i) = ' 'c
      oul(i) = ' 'c
      oubf(i) = ' 'c
      }

   call print(STDOUT, "   DJDE DUPLEX=YES,*n"s)
   call print(STDOUT, "   DJDE FONTINDEX=0,*n"s)
   call print(STDOUT, "   DJDE FORM=NONE,*n"s)
   call print(STDOUT, "   DJDE FORMAT=*s,*n"s, FORMAT)
   call print(STDOUT, "   DJDE BOF=*i,*n"s, page_size)
   call print(STDOUT, "   DJDE DATA=(1,*i),*n"s, MAXWIDTH)
   call print(STDOUT, "   DJDE SIDE=(NUBACK,NOFFSET),*n"s)
   call print(STDOUT, "   DJDE END;*n"s)

   repeat {                # each input line
      obp = 0
      empty = YES
      repeat {             # each output character
         ibp += 1
         c = ibuf(ibp)
         while (c == EOS) {
            if (getlin(ibuf, STDIN, MAXLINE) == EOF)
               break 3

            ibp = 1
            c = ibuf(ibp)
            }

         select (c)
            when (NEWLINE)
               break
            when (FF, FFNP) {
               dump_buffer
               line_ctr = page_size
               }
            when (BS, BSNP)
               obp -= 1
            when (' 'c, SPNP)
               obp += 1
         elif (or(c, NUL) >= ' 'c) {
            obp += 1
            empty = NO
            if (0 < obp && obp < MAXLINE) {
               if (c == '_'c)             # check for underscores
                  if (oul(obp) == c)
                     oubf(obp) = c        # boldfaced underscores
                  else
                     oul(obp) = c         # normal underscores
               elif (oba(obp) == c)
                  obf(obp) = c            # boldfaced characters
               else
                  oba(obp) = c            # normal characters

               if (topchar < obp)
                  topchar = obp
               }
            }
         }

      dump_buffer
      }

   stop



#  dump_buffer --- output the buffers to STDOUT and clear

   procedure dump_buffer {

      local i
      integer i

      line_ctr += 1
      if (line_ctr > page_size) {
         if (newlines > 0) {
            call print (STDOUT, "11*n"s)
            overstrike = YES
            newlines = 0
            }

         line_ctr = 1
         }

      if (empty == NO) {
         for (; newlines > 0; newlines -= 1) {
            call print(STDOUT, " *c*n"s, NORMAL)
            }

         for (i = 1; i <= topchar; i += 1) {
            if (obf(i) ~= ' 'c)
               oba(i) = ' 'c
            if (oubf(i) ~= ' 'c)
               oul(i) = ' 'c
            if (ARG_PRESENT (i)) {
               if (oul(i) ~= ' 'c) {     # for italics
                  oul(i) = oba(i)
                  oba(i) = ' 'c
                  }
               }
            }

         call trim(oba, topchar)
         if (overstrike == YES)
            call putch('+'c, STDOUT)
         else
            call putch(' 'c, STDOUT)
         call putch(NORMAL, STDOUT)
         call putlin(oba, STDOUT)
         call clear(oba, topchar)
         overstrike = NO

         call trim(obf, topchar)
         if (obf(1) ~= NEWLINE) {
            call putch('+'c, STDOUT)
            call putch(BOLD, STDOUT)
            call putlin(obf, STDOUT)
            }
         call clear(obf, topchar)

         call trim(oul, topchar)
         if (oul(1) ~= NEWLINE) {
            call putch('+'c, STDOUT)
            if (~ ARG_PRESENT (i))
               call putch(NORMAL, STDOUT)
            else
               call putch(ITALIC, STDOUT)      # for italics
            call putlin(oul, STDOUT)
            }
         call clear(oul, topchar)

         call trim(oubf, topchar)
         if (oubf(1) ~= NEWLINE) {
            call putch('+'c, STDOUT)
            call putch(BOLD, STDOUT)
            call putlin(oubf, STDOUT)
            }
         call clear(oubf, topchar)

         }
         else
            newlines += 1

      topchar = 0
      }

   end



#  trim --- strip trailing blanks from a buffer

   subroutine trim(buf, top)
   character buf(MAXLINE)
   integer top

   integer i


   for (i = min0(top, MAXLINE - 2); i > 0; i -= 1)
      if (buf(i) ~= ' 'c)
         break

   buf(i + 1) = NEWLINE
   buf(i + 2) = EOS

   return
   end



#  clear --- clear an output buffer for further use

   subroutine clear(buf, top)
   character buf(MAXLINE)
   integer top

   integer i


   for (i = 1; i <= top + 2; i += 1)
      buf(i) = ' 'c

   return
   end
