# phist --- print selected portions of Subsystem History

   include ARGUMENT_DEFS
   define (DATELINE_PREFIX,'!'c)
   define (BYLINE_PREFIX,'*'c)
   define (MODLINE_PREFIX,'$'c)
   define (DATALINE_PREFIX,'#'c)

   ARG_DECL
   file_des hfd
   file_des open
   integer read_buf, match, makpat, parsdt
   longint from_date
   bool precedes
   character buf (MAXLINE), by_line (MAXLINE), mod_line (MAXLINE),
         t_by_line (MAXLINE), t_mod_line (MAXLINE), module (MAXPAT),
         author (MAXPAT)

   string history_file "=doc=/hist/history"

   procedure do_args forward

   do_args

   if (ARG_PRESENT (i))
      hfd = open (ARG_TEXT (i), READ)
   else
      hfd = open (history_file, READ)
   if (hfd == ERR)
      call error ("history file not available"p)

   call read_buf (buf, hfd)
   while (buf (1) ~= EOF) {

      if (buf (1) ~= DATELINE_PREFIX
            || read_buf (by_line, hfd) == EOF
            || by_line (1) ~= BYLINE_PREFIX
            || read_buf (mod_line, hfd) == EOF
            || mod_line (1) ~= MODLINE_PREFIX) {
         call close (hfd)
         call error ("history file contains apocryphal information"p)
         }

      if (ARG_PRESENT (b)) {
         call scopy (by_line, 2, t_by_line, 1)
         call mapstr (t_by_line, LOWER)
         }

      if (ARG_PRESENT (s)) {
         call scopy (mod_line, 2, t_mod_line, 1)
         call mapstr (t_mod_line, LOWER)
         }

      if (ARG_PRESENT (s) && match (t_mod_line, module) == NO
            || ARG_PRESENT (f) && precedes (buf, from_date)
            || ARG_PRESENT (b) && match (t_by_line, author) == NO)
         call skip_entry (buf, hfd)

      elif (ARG_PRESENT (q)) {   # print only the entry header
         call print (STDOUT, "*n*sBy: *sRe: *s"p,
               buf (2), by_line (2), mod_line (2))
            call skip_entry (buf, hfd)
         }
      else {
         call print (STDOUT, "*2n*s*nBy: *sRe: *s*n"p,
               buf (2), by_line (2), mod_line (2))
         call read_buf (buf, hfd)
         while (buf (1) == DATALINE_PREFIX) {
            call print (STDOUT, "   *s"p, buf (2))
            call read_buf (buf, hfd)
            }
         }
      }

   call close (hfd)



# do_args --- process command line arguments for phist

   procedure do_args {

      local i, day, month, year, usage
      integer i, day, month, year

      string usage _
         "Usage: phist {-b <author> | -f <date> | -s <subject> | -q}"

      PARSE_COMMAND_LINE ("b<rs>f<rs>s<rs>i<rs>q"s, usage)

      if (ARG_PRESENT (b))
         if (makpat (ARG_TEXT (b), 1, EOS, author) == ERR) {
            call putlin (ARG_TEXT (b), ERROUT)
            call error (": bad author pattern"p)
            }

      if (ARG_PRESENT (f)) {
         i = 1
         if (parsdt (ARG_TEXT (f), i, month, day, year) == ERR) {
            call putlin (ARG_TEXT (f), ERROUT)
            call error (": bad date"p)
            }
         from_date = intl (year) * 10000 _
                   + intl (month) * 100 _
                   + intl (day)
         }

      if (ARG_PRESENT (s))
         if (makpat (ARG_TEXT (s), 1, EOS, module) == ERR) {
            call putlin (ARG_TEXT (s), ERROUT)
            call error (": bad subject pattern"p)
            }

      }


   stop
   end



# read_buf --- read one line from the history file

   integer function read_buf (buf, fd)
   character buf (ARB)
   file_des fd

   integer getlin

   read_buf = getlin (buf, fd)
   if (read_buf == EOF)
      buf (1) = EOF

   return
   end



# skip_entry --- gobble up the data part of an entry

   subroutine skip_entry (buf, fd)
   character buf (ARB)
   file_des fd

   integer read_buf

   repeat
      call read_buf (buf, fd)
      until (buf (1) ~= DATALINE_PREFIX)

   return
   end



# precedes --- determine if date in 'dateline' precedes 'from'

   bool function precedes (dateline, from)
   character dateline (ARB)
   longint from

   integer i, year, month, day
   integer index

   i = index (dateline, ' 'c) + 1
   call parsdt (dateline, i, month, day, year)

   return (intl (year) * 10000 + intl (month) * 100 + intl (day) < from)

   end
