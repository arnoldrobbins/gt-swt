# ar --- file maintainer

   include "ar_def.r.i"
   include ARGUMENT_DEFS
   include AR_COMMON

   ARG_DECL
   character aname (MAXLINE)
   integer getarg
   string usage "Usage: ar -(a[d]|d|p|t|u[d]|x)[v] <archive> {<file>}"

   PARSE_COMMAND_LINE ("adptuxv n<ign>"s, usage)
   if (getarg (1, aname, MAXLINE) == EOF)
      call error (usage)

   call delarg (1)   # only file names are left
   Errcnt = 0        # no errors found so far
   call getfns
   if (Errcnt ~= 0)  # errors encountered in fetching file names
      call error ("archive not altered"s)

   select
      when (ARG_PRESENT (a)) {
         if (ARG_PRESENT (p) || ARG_PRESENT (t)
               || ARG_PRESENT (u) || ARG_PRESENT (x))
            call error (usage)   # make sure p, t, u and x are absent
         call append (aname, ARG_PRESENT (d), ARG_PRESENT (v))
         }
      when (ARG_PRESENT (t)) {   # we know a is absent
         if (ARG_PRESENT (d) || ARG_PRESENT (p)
               || ARG_PRESENT (u) || ARG_PRESENT (x))
            call error (usage)   # make sure d, p, u and x are absent
         call table (aname, ARG_PRESENT (v))
         }
      when (ARG_PRESENT (p)) {   # we know t is absent
         if (ARG_PRESENT (d) || ARG_PRESENT (u) || ARG_PRESENT (x))
            call error (usage)   # make sure d, u and x are absent
         call extract (aname, PRINT, ARG_PRESENT (v))
         }
      when (ARG_PRESENT (u)) {   # we know p and t are absent
         if (ARG_PRESENT (x))    # make sure x is absent
            call error (usage)
         call update (aname, ARG_PRESENT (d), ARG_PRESENT (v))
         }
      when (ARG_PRESENT (d)) {   # we know p, t and u are absent
         if (ARG_PRESENT (x))    # make sure x is absent
            call error (usage)
         call delete (aname, ARG_PRESENT (v))
         }
      when (ARG_PRESENT (x))     # we know d, p, t and u are absent
         call extract (aname, EXTRACT, ARG_PRESENT (v))

   else     # no command given
      call error (usage)

   stop
   end



# acopy --- copy  size  words from  ifd  to  ofd

   longint function acopy (ifd, ofd, size)
   filedes ifd, ofd
   longint size

   integer buf (MAXBUF), len
   integer readf
   longint i, lim

   lim = size - MAXBUF
   for (i = 0; i <= lim; i += len) {
      len = readf (buf, MAXBUF, ifd)
      if (len > 0)
         call writef (buf, len, ofd)
      else
         return (i)
      }
   if (size - i > 0) {  # anything left?
      len = readf (buf, ints (size - i), ifd)
      if (len > 0) {
         call writef (buf, len, ofd)
         i += len
         }
      }

   return (i)
   end



# addfil --- add file  "name"  to archive open on  afd

   subroutine addfil (name, afd, errcnt)
   character name (ARB)
   filedes afd
   integer errcnt

   longint size
   longint fsize
   character head (MAXHEADER)
   filedes nfd
   filedes open

   nfd = open (name, READ)
   if (nfd == ERR) {
      call print (ERROUT, "*s: can't add*n"s, name)
      errcnt += 1
      }
   if (errcnt == 0) {
      size = fsize (nfd)
      call makhdr (name, size, head)
      call putlin (head, afd)
      call flush$ (afd)
      call fcopy (nfd, afd)
      }

   call close (nfd)

   return
   end



# amove --- move  name1  to  name2

   subroutine amove (name1, name2)
   character name1 (ARB), name2 (ARB)

   filedes create, open
   filedes fd1, fd2

   fd1 = open (name1, READ)
   if (fd1 ~= ERR)
      fd2 = create (name2, WRITE)
   if (fd1 == ERR || fd2 == ERR) {
      call print (ERROUT, "can't replace archive with *s*n"s, name1)
      call error (""s)
      }

   call fcopy (fd1, fd2)
   call close (fd1)
   call close (fd2)
   call remove (name1)

   return
   end



# append --- add files to the end of an archive

   subroutine append (aname, remopt, verbose)
   character aname (ARB)
   bool remopt, verbose

   include AR_COMMON

   integer filarg, gethdr, remove
   integer i
   longint size
   filedes afd
   filedes open
   character head (MAXHEADER), name (NAMESIZE)

   if (Nfiles <= 0)
      return

   afd = open (aname, READWRITE)
   if (afd == ERR)
      call cant (aname)

   while (gethdr (afd, head, name, size) ~= EOF) {
      if (filarg (name) == YES) {
         call print (ERROUT, "*s: already in archive*n"s, name)
         Errcnt += 1
         }
      call fskip (afd, size)
      }

   do i = 1, Nfiles
      if (Fstat (i) == NO) {
         if (verbose)
            call print (STDOUT, "*s*n"s, Fname (1, i))
         call addfil (Fname (1, i), afd, Errcnt)
         }

   call close (afd)

   if (Errcnt ~= 0)
      call error ("archive not altered"s)
   else if (remopt)
      do i = 1, Nfiles
         if (remove (Fname (1, i)) == ERR)
            call print (ERROUT, "*s: can't remove*n"s, Fname (1, i))

   return
   end



# delete --- delete files from archive

   subroutine delete (aname, verbose)
   character aname (ARB)
   bool verbose

   include AR_COMMON

   integer afd, tfd
   integer create, open
   string tname "arctemp.=pid="

   if (Nfiles <= 0)   # protect innocents
      call error ("delete by name only"s)
   afd = open (aname, READWRITE)
   if (afd == ERR)
      call cant (aname)
   tfd = create (tname, READWRITE)
   if (tfd == ERR)
      call cant (tname)
   call replace (afd, tfd, DELETE, verbose, Errcnt)
   call close (afd)
   call close (tfd)
   if (Errcnt == 0)
      call notfound
   if (Errcnt == 0)
      call amove (tname, aname)
   else {
      call remove (tname)
      call error ("archive not altered"s)
      }

   return
   end



# extract --- extract files from archive

   subroutine extract (aname, cmd, verbose)
   character aname (ARB), cmd
   bool verbose

   include AR_COMMON

   character ename (NAMESIZE), head (MAXHEADER)
   filedes afd, efd
   filedes open, create, mktemp
   integer filarg, gethdr, isatty
   longint size
   longint acopy

   afd = open (aname, READ)
   if (afd == ERR)
      call cant (aname)

   if (cmd == PRINT)
      if (isatty (STDOUT) == YES) {
         efd = mktemp (READWRITE)
         if (efd == ERR)
            call error ("can't open temporary file for extraction"p)
         }
      else
         efd = STDOUT

   while (gethdr (afd, head, ename, size) ~= EOF)
      if (filarg (ename) == NO)
         call fskip (afd, size)
      else {
         if (verbose)
            call print (STDOUT, "*s*n"s, ename)
         if (cmd ~= PRINT)
            efd = create (ename, WRITE)
         if (efd == ERR) {
            call print (ERROUT, "*s: can't create*n"s, ename)
            Errcnt += 1
            call fskip (afd, size)
            }
         else {
            if (acopy (afd, efd, size) ~= size) {
               Errcnt += 1
               call remark ("premature EOF"s)
               }
            if (cmd ~= PRINT)
               call close (efd)
            }
         }

   if (cmd == PRINT && isatty (STDOUT) == YES) {
      call rewind (efd)
      call fcopy (efd, STDOUT)
      call rmtemp (efd)
      }

   if (Errcnt == 0)
      call notfound

   return
   end



# filarg --- check if name matches argument list

   integer function filarg (name)
   character name (ARB)

   include AR_COMMON

   integer i
   integer equal

   if (Nfiles <= 0)
      return (YES)

   do i = 1, Nfiles
      if (equal (name, Fname (1, i)) == YES) {
         Fstat (i) = YES   # mark it visited
         return (YES)
         }

   return (NO)
   end



# fsize --- return size of file in words

   longint function fsize (fd)
   filedes fd

   longint markf

   call wind (fd)
   fsize = markf (fd)
   call rewind (fd)

   return
   end



# fskip --- skip  n  words on file  fd

   subroutine fskip (fd, n)
   filedes fd
   longint n

   call seekf (n, fd, REL)

   return
   end



# getfns --- get file names into fname, check for duplicates

   subroutine getfns

   include AR_COMMON

   character junk (NAMESIZE)
   integer i, j, state (4)
   integer equal, gfnarg, getarg

   if (getarg (1, junk, 1) == EOF) {   # no files specified
      Nfiles = 0
      return
      }

   state (1) = 1
   for (i = 1; i <= MAXFILES; i += 1) {
      Fstat (i) = NO
      if (gfnarg (Fname (1, i), state) == EOF)
         break
      }

   if (i > MAXFILES && gfnarg (junk, state) ~= EOF) {
      call print (ERROUT, "can't handle more than *i file names*n"s,
               MAXFILES)
      Errcnt += 1
      }

   Nfiles = i - 1
   for (i = 1; i < Nfiles; i += 1)
      for (j = i + 1; j <= Nfiles; j += 1)
         if (equal (Fname (1, i), Fname (1, j)) == YES) {
            call print (ERROUT, "*s: duplicate file name*n"s,
                  Fname (1, i))
            Errcnt += 1
            }

   return
   end



# gethdr --- get header info from fd

   integer function gethdr (fd, head, name, size)
   filedes fd
   character head (MAXHEADER), name (NAMESIZE)
   longint size

   include AR_COMMON

   character temp (NAMESIZE)
   integer i, len
   integer equal, getlin, getwrd
   longint ctol
   string hdr HEADER

   if (getlin (head, fd, MAXHEADER) == EOF)
      return (EOF)

   i = 1
   len = getwrd (head, i, temp, NAMESIZE)
   if (equal (temp, hdr) == NO && equal (temp, "###H:"s) == NO) {
      call remark ("archive not in proper format"s)
      Errcnt += 1
      return (EOF)
      }

   if (equal (temp, "###H:"s) == YES)
      call convert_header (head)

   call getwrd (head, i, name, NAMESIZE)
   size = ctol (head, i)

   return (OK)
   end



# getwrd --- get non-blank word from in (i) into  out, increment i

   integer function getwrd (in, i, out, max)
   integer in (ARB), out (ARB)
   integer i, max

   integer j

   SKIPBL (in, i)
   j = 1
   while (in (i) ~= EOS && in (i) ~= ' 'c && in (i) ~= NEWLINE) {
      if (j >= max)
         break
      out (j) = in (i)
      i += 1
      j += 1
      }
   out (j) = EOS

   return (j - 1)
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
   call encode (sdate, 12, "*s-*,2s-19*,2s"s,
         smon (spos (month + 1)), mmddyy (4), mmddyy (7))

   return
   end



# makhdr --- make header line for archive member

   subroutine makhdr (name, size, head)
   character name (NAMESIZE), head (MAXHEADER)
   longint size

   character dat (12), tim (9)
   string hdr HEADER

   call get_date (dat)
   call date (SYS_TIME, tim)
   call encode (head, MAXHEADER, "*s *s  *l  *s  *s*n"s,
         hdr, name, size, dat, tim)

   return
   end



# notfound --- print "not found" message

   subroutine notfound

   include AR_COMMON

   integer i

   for (i = 1; i <= Nfiles; i += 1)
      if (Fstat (i) == NO) {
         call print (ERROUT, "*s: not in archive*n"s, Fname (1, i))
         Errcnt += 1
         }

   return
   end



# replace --- replace or delete files

   subroutine replace (afd, tfd, cmd, verbose, errcnt)
   filedes afd, tfd
   character cmd
   bool verbose
   integer errcnt

   character head (MAXHEADER), name (NAMESIZE)
   integer filarg, gethdr
   longint size
   longint acopy
   filedes tfd

   while (gethdr (afd, head, name, size) ~= EOF)
      if (filarg (name) == YES) {
         if (verbose)
            call print (STDOUT, "*s*n"s, name)
         if (cmd == UPDATE)      # add new one
            call addfil (name, tfd, errcnt)
         call fskip (afd, size)  # discard old one
         }
      else {
         call putlin (head, tfd)
         if (acopy (afd, tfd, size) ~= size) {
            errcnt += 1
            call remark ("premature EOF"s)
            }
         }

   return
   end



# table --- print table of archive contents

   subroutine table (aname, verbose)
   character aname (ARB)
   logical verbose

   include AR_COMMON

   character head (MAXHEADER), name (NAMESIZE)
   integer filarg, gethdr
   longint size
   filedes afd
   filedes open

   afd = open (aname, READ)
   if (afd == ERR)
      call cant (aname)
   while (gethdr (afd, head, name, size) ~= EOF) {
      if (filarg (name) == YES)
         call tprint (head, verbose)
      call fskip (afd, size)
      }

   if (Errcnt == 0)
      call notfound

   return
   end



# tprint --- print table entry for one member

   subroutine tprint (buf, verbose)
   character buf (ARB)
   logical verbose

   integer i
   character name (NAMESIZE), size (12), date (12), time (9)

   i = 1
   call getwrd (buf, i, name, NAMESIZE)   # discard header flag
   call getwrd (buf, i, name, NAMESIZE)   # get member name
   if (~ verbose)    # only want name
      call print (STDOUT, "*s*n"s, name)
   else {
      call getwrd (buf, i, size, 12)
      call getwrd (buf, i, date, 12)
      call getwrd (buf, i, time, 9)
      call print (STDOUT, "*s *s *-6s *s*n"s, date, time, size, name)
      }

   return
   end



# update --- update existing files, add new ones at end

   subroutine update (aname, remopt, verbose)
   character aname (ARB)
   bool remopt, verbose

   include AR_COMMON

   integer i
   integer remove
   filedes afd, tfd
   filedes open, create
   string tname "arctemp.=pid="

   afd = open (aname, READWRITE)
   if (afd == ERR)      # maybe it's a new one
      afd = create (aname, READWRITE)
   if (afd == ERR)
      call cant (aname)
   tfd = create (tname, READWRITE)
   if (tfd == ERR)
      call cant (tname)
   call replace (afd, tfd, UPDATE, verbose, Errcnt)   # update existing
   for (i = 1; i <= Nfiles; i += 1)                   # add new ones
      if (Fstat (i) == NO) {
         if (verbose)
            call print (STDOUT, "*s*n"s, Fname (1, i))
         call addfil (Fname (1, i), tfd, Errcnt)
         Fstat (i) = YES
         }
   call close (afd)
   call close (tfd)
   if (Errcnt == 0) {
      call amove (tname, aname)
      if (remopt)    # remove files after updating archive?
         for (i = 1; i <= Nfiles; i += 1)
            if (remove (Fname (1, i)) == ERR)
               call print (ERROUT, "*s: can't remove*n"s, Fname (1, i))
      }
   else {
      call remove (tname)
      call error ("archive not altered"s)
      }

   return
   end



# convert_header --- put the header into the new format

   subroutine convert_header (head)
   character head (MAXHEADER)

   integer i
   integer getwrd

   character name (NAMESIZE), size (12), mon (4), day (3), year (5),
         time (9)

   string flag HEADER

   i = 1
   call getwrd (head, i, name, NAMESIZE)  # skip header flag
   call getwrd (head, i, name, NAMESIZE)  # get member name
   call getwrd (head, i, size, 12)        # get member size
   call getwrd (head, i, mon, 4)          # get month
   call getwrd (head, i, day, 3)          # get day
   call getwrd (head, i, year, 5)         # get year
   call getwrd (head, i, time, 9)         # get time

   call encode (head, MAXHEADER, "*s *s  *s  *s-*s-*s  *s*n"s,
         flag, name, size, mon, day, year, time)

   return
   end
