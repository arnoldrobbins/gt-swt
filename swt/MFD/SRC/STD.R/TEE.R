# tee --- tee fitting for pipelines

   character file (MAXARG), line (MAXLINE)

   integer i, fcnt, fd, outf (16)
   integer getarg, create, getlin, equal

   string std  "-"
   string std1 "-1"
   string std2 "-2"
   string std3 "-3"


   fcnt = 0
   for (i = 1; getarg (i, file, MAXARG) ~= EOF; i = i + 1) {
      fcnt = fcnt + 1
      if (equal (file, std) == YES || equal (file, std1) == YES)
         outf (fcnt) = STDOUT1
      else if (equal (file, std2) == YES)
         outf (fcnt) = STDOUT2
      else if (equal (file, std3) == YES)
         outf (fcnt) = STDOUT3
      else {
         outf (fcnt) = create (file, WRITE)
         if (outf (fcnt) == ERR) {
            fcnt = fcnt - 1
            call print (ERROUT, "*s: can't create*n"p, file)
            }
         }
      }

   while (getlin (line, STDIN) ~= EOF) {
      call putlin (line, STDOUT)
      for (i = 1; i <= fcnt; i = i + 1)
         call putlin (line, outf (i))
      }

   for ( ; fcnt > 0; fcnt = fcnt - 1) {
      fd = outf (fcnt)
      if (fd ~= STDOUT1 && fd ~= STDOUT2 && fd ~= STDOUT3)
         call close (fd)
      }

   stop
   end
