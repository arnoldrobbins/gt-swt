# print --- print files with headings

   include ARGUMENT_DEFS
   define (LINESIZE,134)
   define (MARGIN,6)
   define (PAGELEN,66)
   define (PRINTOFFSET,5)

   ARG_DECL
   character name (MAXLINE), heading (MAXLINE)
   integer ifd
   integer state (4)
   integer open, equal, gfnarg, gvlarg

   PARSE_COMMAND_LINE ("i<ri>jl<ri>m<ri>p h<ign>n<ign>"s,
      "Usage: print {-{i<indent>|j|l<length>|m<margin>|p}} {-h <head> | <file>}"p)

   ARG_DEFAULT_INT (l, PAGELEN)
   ARG_DEFAULT_INT (m, MARGIN)
   if (ARG_PRESENT (p))
      ARG_DEFAULT_INT (i, PRINTOFFSET)
   else
      ARG_DEFAULT_INT (i, 0)

   state (1) = 1              # initialize for 'gfnarg'
   heading (1) = EOS

   repeat {
      select (gfnarg (name, state))
         when (EOF)
            break

         when (OK) {
            ifd = open (name, READ)
            if (ifd == ERR)
               call print (ERROUT, "*s: can't open*n"p, name)
            else {
               select
                  when (heading (1) ~= EOS)
                     call fprint (heading, ifd, ARG_BUF)
                  when (equal (name, "/dev/stdin1"s) == YES)
                     call fprint ("Standard Input 1"s, ifd, ARG_BUF)
                  when (equal (name, "/dev/stdin2"s) == YES)
                     call fprint ("Standard Input 2"s, ifd, ARG_BUF)
                  when (equal (name, "/dev/stdin3"s) == YES)
                     call fprint ("Standard Input 3"s, ifd, ARG_BUF)
                  else
                     call fprint (name, ifd, ARG_BUF)
               call close (ifd)
               }
            }

         when (ERR)
            call gvlarg (heading, state)

      } # end of infinite repeat

   stop
   end



# fprint --- print file 'name' from fin upon STDOUT

   subroutine fprint (name, fin, ARG_BUF)
   character name (ARB)
   filedes fin
   ARG_DECL

   character c, date (12), time (9), line (LINESIZE), buf (LINESIZE)
   integer pageno, lineno, j, bottom, column, maxcol, eject, tmarg
   integer getlin

   procedure new_page forward
   procedure head forward

   define (putchar(c),{
      column += 1
      if (column > 0 && column < LINESIZE) {
         line (column) = c
         if (column > maxcol)
            maxcol = column
         }
      })

   pageno = 1        # current page number
   lineno = 0        # number of lines printed so far on this page
   tmarg = ARG_VALUE (m) / 2  # number of blank lines after page heading
   bottom = ARG_VALUE (l) - ARG_VALUE (m)    # last line to print on
   call get_date (date)
   call get_time (time)

   while (getlin (buf, fin, LINESIZE) ~= EOF) {
      eject = NO
      column = 0
      maxcol = 0
      for (j = 1; buf (j) ~= EOS; j += 1) {
         c = buf (j)
         select (or (c, 8r200))
            when (FF)
               eject = YES
            when (BS)
               column -= 1
            when (CR)
               column = 0
            when (HT)
               repeat putchar (' 'c)
                  until (and (column, 7) == 0)
            when (NEWLINE)
               putchar (NEWLINE)
            when (SET_OF_GRAPHICS, DEL)
               putchar (c)
         }
      line (maxcol + 1) = EOS

      if (lineno >= bottom || lineno == 0 || eject ~= NO) {
         if (lineno > 0)
            new_page
         call skip (ARG_VALUE (m) - tmarg - 1, STDOUT)
         if (ARG_VALUE (m) > 0)
            head
         call skip (tmarg, STDOUT)
         lineno = ARG_VALUE (m)
         }

      if (ARG_VALUE (i) > 0)
         call print (STDOUT, "*#x"p, ARG_VALUE (i))
      call putlin (line, STDOUT)
      lineno += 1
      }  # while (getlin ...

   if (lineno > 0)               # has a partial page been printed?
      new_page

   return


   # new_page --- handle skip to new page

      procedure new_page {

      if (ARG_PRESENT (p) || ARG_PRESENT (j)) {
         call putch (FF, STDOUT)
         call putch (NEWLINE, STDOUT)
         }
      else
         call skip (ARG_VALUE (l) - lineno, STDOUT)
      pageno += 1

      }


   # head --- print top of page header

      procedure head {

      local i, fill
      integer i
      integer length
      string fill "                                        "

      call print (STDOUT, "*#x"s, ARG_VALUE (i))
      i = 41 - max0 (40 - length (name), 0)
      call print (STDOUT, "*s*s  *s  *s  page *i*n"p,
         name, fill (i), date, time, pageno)

      }


   end



# skip --- output  n  blank lines

   subroutine skip (n, fout)
   integer n, fout

   integer i

   for (i = 1; i <= n; i += 1)
      call putch (NEWLINE, fout)

   return
   end



# get_date --- construct the current date for page heading

   subroutine get_date (sdate)
   character sdate (12)

   integer month, i
   integer ctoi
   character mmddyy (9)

   string_table spos, smon
      "Jan"/ "Feb"/ "Mar"/ "Apr"/ "May"/ "Jun"/
      "Jul"/ "Aug"/ "Sep"/ "Oct"/ "Nov"/ "Dec"

   call date (SYS_DATE, mmddyy)
   i = 1
   month = ctoi (mmddyy, i)
   call encode (sdate, 12, "*s *,2s 19*,2s"s,
         smon (spos (month + 1)), mmddyy (4), mmddyy (7))

   return
   end



# get_time --- get the current time of day for heading

   subroutine get_time (stime)
   character stime (9)

   integer i, hour
   integer ctoi
   character hhmmss (9), ampm

   call date (SYS_TIME, hhmmss)

   i = 1
   hour = ctoi (hhmmss, i)

   if (hour >= 12)
      ampm = 'p'c
   else
      ampm = 'a'c

   call encode (stime, 9, "*2i:*,2s *cm"s,
         mod (hour + 11, 12) + 1, hhmmss (4), ampm)

   return
   end
