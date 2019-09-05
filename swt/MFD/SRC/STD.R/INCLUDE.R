# include --- replace  include file  by contents of file

   define (NFILES,5)

   character line (MAXLINE), str (MAXLINE)
   integer equal, getlin, getwrd, open
   integer infile (NFILES), len, level, loc, i
   string incl "include"


   infile (1) = STDIN
   for (level = 1; level > 0; level -= 1) {
      while (getlin (line, infile (level)) ~= EOF) {
         loc = 1
         len = getwrd (line, loc, str)
         if (equal (str, incl) == NO)
            call putlin (line, STDOUT)
         else {
            level += 1
            if (level > NFILES)
               call error ("includes nested too deeply"p)
            len = getwrd (line, loc, str)
            i = 1
            if (str (1) == "'"c || str (1) == '"'c) {
               i = 2
               str (len) = EOS
               }
            infile (level) = open (str (i), READ)
            if (infile (level) == ERR) {
               call print (ERROUT, "*s: can't open include file*n"s, str (i))
               level -= 1
               call putlin (line, STDOUT)
               }
            }
         }
      if (level > 1)
         call close (infile (level))
      }
   stop
   end
