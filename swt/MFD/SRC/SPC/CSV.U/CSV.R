#  csv --- convert shell variables to new format

   integer i
   character c
   filedes fd, tfd
   character buf1(MAXLINE)
   character buf2(MAXLINE)

   character mntoc
   filedes open, mktemp
   integer equal, length, getlin


#  create the temporary file

   tfd = mktemp(READWRITE)
   if (tfd == ERR)
      call error("can't open temporary file")

#  perform the operation for each user input

   while (getlin(buf1, STDIN, MAXLINE) ~= EOF) {
      buf1(length(buf1)) = EOS
      call encode(buf2, MAXLINE, "=vars=/*s/.vars"s, buf1)
      fd = open(buf2, READWRITE)
      if (fd == ERR) {
         call print(ERROUT, "can't open *s*n"s, buf2)
         next
         }

      call print(STDOUT, "*s*n"s, buf1)
      call rewind(tfd)
      call trunc(tfd)

#  convert a single user's variables

      while (getlin(buf1, fd, MAXLINE) ~= EOF) {
         if (buf1(length(buf1)) == NEWLINE)
            buf1(length(buf1)) = EOS

         select
         when (equal("_eof"s, buf1) == YES)
            call getlin(buf2, fd, MAXLINE)
         when (equal("_erase"s, buf1) == YES)
            call getlin(buf2, fd, MAXLINE)
         when (equal("_escape"s, buf1) == YES)
            call getlin(buf2, fd, MAXLINE)
         when (equal("_kill"s, buf1) == YES)
            call getlin(buf2, fd, MAXLINE)
         when (equal("_newline"s, buf1) == YES)
            call getlin(buf2, fd, MAXLINE)
         when (equal("_retype"s, buf1) == YES)
            call getlin(buf2, fd, MAXLINE)
         ifany
            call print(tfd, "*s*n"s, buf1)
         else {
            call print(tfd, "*s*n"s, buf1)      # not special, copy it
            call getlin(buf2, fd, MAXLINE)
            if (buf2(length(buf2)) == NEWLINE)
               buf2(length(buf2)) = EOS
            if (equal("_kill_resp"s, buf1) == YES)
               call print(tfd, "*s<LF>*n"s, buf2)
            else
               call print(tfd, "*s*n"s, buf2)

            next
            }

#  convert a possible mnemonic

         if (buf2(length(buf2)) == NEWLINE)
            buf2(length(buf2)) = EOS
         if (length(buf2) <= 1) {
            call print(tfd, "*s*n"s, buf2)
            next
            }

         i = 1
         c = mntoc(buf2, i, EOS)
         if (c == EOS)
            call print(tfd, "*s*n"s, buf2)
         else
            call print(tfd, "<*s>*n"s, buf2)
         }

#  rewrite the variables file

      call rewind(fd)
      call rewind(tfd)
      call fcopy(tfd, fd)

#  cleanup

      call close(fd)
      }

   call rmtemp(tfd)
   stop
   end
