# unoct --- un-octalize and load "gtld|ld -b" dumps from UNIX

   integer getarg, getlin, open
   integer i, file

   character outch, line (MAXLINE)

   file = STDIN
   if (getarg (1, line, MAXLINE) ~= EOF) {
      file = open (line, READ)
      if (file == ERR)
         call cant (line)
      }

   while (getlin (line, file) ~= EOF) {
      for (i = 1; line (i) ~= ' 'c; i += 1)   # Ignore address
         ;
      repeat {
         i += 1
         outch = 0
         for (; line (i) ~= ' 'c & line (i) ~= NEWLINE; i += 1)
            outch = 8 * outch + line (i) - '0'c
         call t1ou (outch)
         } until (line (i) == NEWLINE)
      }

   call close (file)
   stop
   end
