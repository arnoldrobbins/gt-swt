# find --- find lines matching a given pattern

   include ARGUMENT_DEFS

   define (MAXPAT,128)
   define (MAXLINE,500)
   define (COUNT,ARG_PRESENT(c))
   define (FILE_NAMES,ARG_PRESENT(v))
   define (IGNORE_CASE,ARG_PRESENT(i))
   define (LINE_NUMBERS,ARG_PRESENT(l))
   define (MAX_MATCHES,ARG_VALUE(o))
   define (HUGE,32767)

   ARG_DECL
   filedes fd
   filedes open
   integer state (4), mode
   integer gfnarg
   character name (MAXARG), pat (MAXPAT)

   procedure do_arguments forward
   procedure do_file forward

   do_arguments

   state (1) = 1
   repeat
      select (gfnarg (name, state))
         when (EOF)
            break
         when (OK) {
            fd = open (name, READ)
            if (fd ~= ERR) {
               do_file
               call close (fd)
               }
            else
               call print (ERROUT, "*s: can't open*n"s, name)
            }
         when (ERR)
            call print (ERROUT, "*s: can't open*n"s, name)

   stop



# do_arguments --- process command line arguments for find

   procedure do_arguments {

      local i, arg, usage
      integer i
      integer getarg, getpat
      character arg (MAXARG)
      string usage _
         "Usage: find <pattern> {-{c|i|l|o<num>|v|x}} {<file name>}"

      if (getarg (1, arg, MAXARG) == EOF) # pattern must be supplied
         call error (usage)
      call delarg (1)                     # get rid of pattern
      if (arg (1) == '~'c) {  # leading ~ => negated pattern
         i = 2
         mode = NO
         }
      else {
         i = 1
         mode = YES
         }

      PARSE_COMMAND_LINE ("cilvxn<ign>o<oi>"s, usage)
      if (ARG_PRESENT (o))
         ARG_DEFAULT_INT (o, 1)
      else
         ARG_DEFAULT_INT (o, HUGE)
      if (ARG_PRESENT (x))
         mode = YES + NO - mode
      if (IGNORE_CASE)
         call mapstr (arg(i), LOWER)

      if (getpat (arg (i), pat) == ERR)
         call error ("illegal pattern"p)

      }



# do_file --- process one file for find

   procedure do_file {

      local lcount, lineno, line, ii, cslin
      integer lcount, lineno, ii
      integer getlin, match, mapdn
      character line (MAXLINE), csline(MAXLINE)

      lcount = 0
      lineno = 0

      while (getlin (line, fd, MAXLINE) ~= EOF) {
         lineno += 1
         for (ii = 1; line(ii) ~= EOS; ii += 1)
            if (IGNORE_CASE)
               csline(ii) = mapdn (line(ii))
            else
               csline(ii) = line(ii)
         csline(ii) = EOS
         if (match (csline, pat) == mode) {
            if (~ COUNT) {
               if (FILE_NAMES)
                  call putlin (name, STDOUT)
               if (LINE_NUMBERS)
                  call putdec (lineno, 6, STDOUT)
               if (FILE_NAMES || LINE_NUMBERS)
                  call putlin (": "s, STDOUT)
               call putlin (line, STDOUT)
               }
            lcount += 1
            if (lcount >= MAX_MATCHES)
               break
            }
         }

      if (COUNT) {
         if (FILE_NAMES)
            call print (STDOUT, "*s: "p, name)
         call print (STDOUT, "*i*n"p, lcount)
         }

      }

   end



# getpat --- convert argument into pattern

   integer function getpat (arg, pat)
   integer arg (MAXARG), pat (MAXPAT)

   integer makpat

   getpat = makpat (arg, 1, EOS, pat)

   return
   end
