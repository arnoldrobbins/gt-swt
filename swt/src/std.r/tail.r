# tail --- print last n lines from standard input

   define(MAXBUF,30702)
   define(MAX_NLINES,300)
   define(DEFAULT_NLINES,20)

   character buf (MAXBUF), arg (MAXARG)

   integer bp, ep, nlines, fence, i
   integer getlin, getarg, gctoi
   filedes fd
   filedes open

   if (getarg (1, arg, MAXARG) == EOF) {  # no arguments at all
      nlines = DEFAULT_NLINES
      call scopy ("/dev/stdin/"s, 1, arg, 1)
      }
   else {
      i = 1
      nlines = gctoi (arg, i, 10)   # convert to + or - integer

      if (nlines == 0)               # just file name
         nlines = DEFAULT_NLINES
      else {                        # number of lines given
         if (getarg (2, arg, MAXARG) == EOF)
            call scopy ("/dev/stdin/"s, 1, arg, 1)
         }
      }

   fd = open (arg, READ)
   if (fd == ERR)
      call cant (arg)

   if (nlines < 0) {
      for ( ; nlines < 0; nlines += 1)
         if (getlin (buf, fd) == EOF)
            stop
      call fcopy (fd, STDOUT)
      }
   else {
      nlines = min0 (max0 (0, nlines), MAX_NLINES)
      fence = nlines * MAXLINE
      i = 0; bp = 1; ep = 1
      while (getlin (buf (ep), fd) ~= EOF) {    # read lines into buffer
         i += 1   # bump line count
         if (ep > fence)
            ep = 1
         else
            ep += MAXLINE
         if (i > nlines)
            if (bp > fence)
               bp = 1
            else
               bp += MAXLINE
         }
      while (bp ~= ep) {   # now write them out
         call putlin (buf (bp), STDOUT)
         if (bp > fence)
            bp = 1
         else
            bp += MAXLINE
         }
      }

   stop
   end
