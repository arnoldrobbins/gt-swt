# os --- convert text with backspaces to line printer spacing

   include ARGUMENT_DEFS

   define (DEFAULT_PAGE_SIZE,66)
   define (MAXLINE,134)
   define (MAXLINE2,268)   # MAXLINE * 2
   define (MAXLINE3,402)   # MAXLINE * 3
   define (MAXLINE4,536)   # MAXLINE * 4
   define (MAXLINE5,670)   # MAXLINE * 5
   define (MAXLINE6,804)   # MAXLINE * 6
   define (BSNP,8r10)      # BS no parity
   define (FFNP,8r14)      # FF no parity
   define (SPNP,8r40)      # BLANK no parity

   character c, ibuf (MAXLINE), obuf (MAXLINE6)
   integer i, ibp, obp, newlines, overprint, topbuf, topchar,
         page_size, line_ctr
   integer getlin

   ARG_DECL

   procedure dump_buffer forward
   procedure trim_buffer (offset) forward
   procedure clear_buffer (offset) forward

   PARSE_COMMAND_LINE ("-l<req int> -x"s,
         "Usage: os { -l <page length> | -x }"s)
   ARG_DEFAULT_INT (l, DEFAULT_PAGE_SIZE)
   page_size = ARG_VALUE (l)

   line_ctr = page_size
   newlines = 1
   overprint = NO
   topbuf = 0
   topchar = 0
   ibp = 0
   ibuf (1) = EOS
   do i = 1, MAXLINE6
      obuf (i) = ' 'c

   repeat {    # for each logical input line
      obp = 0
      repeat {    # for each character in that line
         ibp += 1
         c = ibuf (ibp)
         while (c == EOS) {   # end of string, but not end of line
            if (getlin (ibuf, STDIN, MAXLINE) == EOF)
               break 3
            ibp = 1
            c = ibuf (1)
            }
         select (c)
            when (NEWLINE)       # end of line reached
               break
            when (FF, FFNP) {
               dump_buffer
               line_ctr = page_size
               }
            when (BS, BSNP)
               obp -= 1
            when (' 'c, SPNP)
               obp += 1
         elif (or (c, NUL) >= ' 'c) {
            obp += 1
            if (0 < obp && obp < MAXLINE) {
               select
                  when (obuf (obp) == ' 'c) {
                     obuf (obp) = c
                     i = 1
                     }
                  when (ARG_PRESENT (x)) {   # for Printronix
                     if (obuf (obp) == '_'c) {           # swap them
                        obuf (obp + MAXLINE) = '_'c
                        obuf (obp) = c
                        i = 2
                        }
                     else if (c == '_'c) {               # goes here
                        obuf (obp + MAXLINE) = c
                        i = 2
                        }
                     else                                # chuck it
                        i = 1
                     }
                  when (obuf (obp + MAXLINE) == ' 'c) {
                     obuf (obp + MAXLINE) = c
                     i = 2
                     }
                  when (obuf (obp + MAXLINE2) == ' 'c) {
                     obuf (obp + MAXLINE2) = c
                     i = 3
                     }
                  when (obuf (obp + MAXLINE3) == ' 'c) {
                     obuf (obp + MAXLINE3) = c
                     i = 4
                     }
                  when (obuf (obp + MAXLINE4) == ' 'c) {
                     obuf (obp + MAXLINE4) = c
                     i = 5
                     }
                  when (obuf (obp + MAXLINE5) == ' 'c) {
                     obuf (obp + MAXLINE5) = c
                     i = 6
                     }
               ifany {
                  if (topbuf < i)
                     topbuf = i
                  }
               else {
                  dump_buffer
                  overprint = YES
                  obuf (obp) = c
                  topbuf = 1
                  }
               if (topchar < obp)
                  topchar = obp
               }
            }
         }
      dump_buffer
      }

   stop



# dump_buffer --- output buffers to STDOUT and clear

   procedure dump_buffer {

      local i, k
      integer i, k

      if (overprint == NO) {           # starting a new line
         line_ctr += 1
         if (line_ctr > page_size) {
            if (newlines > 0) {        # at least 1 blank line at bottom
               call putch ('1'c, STDOUT)
               call putch (NEWLINE, STDOUT)
               newlines = 0
               overprint = YES         # so next line is 1st on page
               }
            # else we're already at top of page
            line_ctr = 1
            }
         if (topbuf <= 0)              # outputting a blank line
            newlines += 1
         }

      if (topbuf > 0) {                # a non-blank line to print
         for ( ; newlines > 0; newlines -= 1) {
            call putch (' 'c, STDOUT)  # dump outstanding blank lines
            call putch (NEWLINE, STDOUT)
            }
         if (overprint == NO)
            call putch (' 'c, STDOUT)
         else
            call putch ('+'c, STDOUT)

         k = 0
         trim_buffer (k)
         call putlin (obuf (k + 1), STDOUT)  # write first buffer segment
         clear_buffer (k)
         for ({i = 1; k += MAXLINE}; i < topbuf; {i += 1; k += MAXLINE}) {
            trim_buffer (k)
            call putch ('+'c, STDOUT)
            call putlin (obuf (k + 1), STDOUT)
            clear_buffer (k)
            }
         }
      topbuf = 0
      topchar = 0
      overprint = NO

      }



# trim_buffer --- strip trailing blanks and terminate a buffer

   procedure trim_buffer (offset) {
   integer offset

      local i
      integer i

      i = offset + MAXLINE - 2
      if (i > offset + topchar)
         i = offset + topchar
      for (; i > offset; i -= 1)
         if (obuf (i) ~= ' 'c)
            break
      obuf (i + 1) = NEWLINE
      obuf (i + 2) = EOS

      }



# clear_buffer --- clear buffer to all blanks (only up to first EOS)

   procedure clear_buffer (offset) {
   integer offset

      local i, lim
      integer i, lim

      lim = offset + MAXLINE
      for (i = offset + 1; i < lim && obuf (i) ~= EOS; i += 1)
         obuf (i) = ' 'c
      obuf (i) = ' 'c         # catch the last position (or EOS)

      }


   end
