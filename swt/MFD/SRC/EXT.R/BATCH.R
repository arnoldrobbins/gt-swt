# batch --- interface to the Primos batch subsystem

   include LIBRARY_DEFS

   define (DB,#)
   define (DEFAULT_FUNIT, 6)

   integer getarg
   character arg (MAXLINE)

   if (getarg (1, arg, MAXLINE) == EOF)
      call start_job
   else if (arg (1) ~= '-'c)
      call start_job

   else
      select (arg (2))
         when ('s'c, 'S'c, 'd'c, 'D'c)
            call job_status (arg)

         when ('c'c, 'C'c, 'a'c, 'A'c, 'r'c, 'R'c)
            call cancel_job (arg)

         when ('m'c, 'M'c)
            call modify_job

      else
         call start_job

   stop
   end



# start_job --- build the job temporary file and the JOB command

   subroutine start_job

   character command (MAXLINE),
             homedir (MAXLINE),
             accountinfo (MAXLINE),
             queue (MAXLINE)
   integer   cptime,
             etime,
             priority,
             restart,
             funit,
             spoolout

   integer bfd, ifd, status, i
   integer getarg, open, create, getlin, get_seq
   integer expand, equal, index, length
   character arg (MAXLINE), buf (MAXLINE), tempfile (MAXLINE)

   status = OK

   command (1) = EOS
   accountinfo (1) = EOS
   queue (1) = EOS
   homedir (1) = EOS
   cptime = 0
   etime = 0
   priority = 0
   restart = NO
   funit = 0
   spoolout = YES

   for (i = 1; getarg (i, arg, MAXLINE) ~= EOF & status == OK; i += 1) {
      if (arg (1) ~= '-'c) {
         if (length (command) ~= 0)
            status = ERR
         call scopy (arg, 1, command, 1)
         }
      else if (arg (3) ~= EOS)
         status = ERR
      else {
         select (arg (2))
            when ('k'c, 'K'c) {
               if (length (command) ~= 0)
                  status = ERR
               i = i + 1
               if (getarg (i, command, MAXLINE) == EOF)
                  status = ERR
               }

            when ('n'c, 'N'c)
               spoolout = NO
            when ('r'c, 'R'c)
               restart = YES

            when ('h'c, 'H'c)
               call grabstr (i, homedir, status)
            when ('a'c, 'A'c)
               call grabstr (i, accountinfo, status)
            when ('t'c, 'T'c)
               call grabnum (i, cptime, status)
            when ('e'c, 'E'c)
               call grabnum (i, etime, status)
            when ('p'c, 'P'c)
               call grabnum (i, priority, status)
            when ('q'c, 'Q'c)
               call grabstr (i, queue, status)
            when ('f'c, 'F'c)
               call grabnum (i, funit, status)
         else
            status = ERR
         }
      }

   if (status ~= OK)
      call usage_msg

DB call print (ERROUT, "command='*s'*n"s, command)
DB call print (ERROUT, "homedir='*s'*n"s, homedir)
DB call print (ERROUT, "acct='*s'*n"s, accountinfo)
DB call print (ERROUT, "queue='*s'*n"s, queue)
DB call print (ERROUT, "cptime=*i*n"s, cptime)
DB call print (ERROUT, "etime=*i*n"s, etime)
DB call print (ERROUT, "priority=*i*n"s, priority)
DB call print (ERROUT, "restart=*i*n"s, restart)
DB call print (ERROUT, "funit=*i*n"s, funit)
DB call print (ERROUT, "spoolout=*i*n"s, spoolout)

   call encode (tempfile, MAXLINE, "=varsdir=/=user=.=pid=.*i"s,
      get_seq (buf))

DB call print (ERROUT, "batch temp file name: *s*n"s, tempfile)

   bfd = create (tempfile, READWRITE)
   if (bfd == ERR)
      call error ("can't create batch file"p)

   if (funit == 0)
      funit = DEFAULT_FUNIT

   call date (SYS_USERID, buf)
   call print (bfd, "$$ JOB *s*n"s, buf)
   call expand (tempfile, buf, MAXLINE)
DB call print (ERROUT, "expanded temp name: '*s'*n"s, buf)
   call mktr$ (buf, tempfile)
DB call print (ERROUT, "temp tree name: '*s'*n"s, tempfile)
   call print (bfd, "swt -*i*n"s, funit)
   call get_passwd (buf)
   call print (bfd, "*s*n"s, buf)
   if (spoolout == YES)
      call print (bfd, "copyout*n"s)
   ifd = open ("=installation="s, READ)
   if (ifd == ERR)
      buf (1) = EOS
   else {
      i = getlin (buf, ifd)
      if (i == EOF)
         buf (1) = EOS
      else
         buf (i) = EOS     # zap the NEWLINE
      call close (ifd)
      }
   call print (bfd, "*n*n# *s*n"s, buf)
   call date (SYS_LDATE, buf)
   call print (bfd, "# Batch job scheduled on *s"s, buf)
   call date (SYS_TIME, buf)
   call print (bfd, " at *s.*n"s, buf)
   call print (bfd, "*n*n*n"s)

   if (length (command) == 0)
      call fcopy (STDIN, bfd)
   else
      call print (bfd, "*s*n"s, command)

   call print (bfd, "stop*n"s)

DB call print (ERROUT, "Batch file contents: *n"s)
DB call rewind (bfd)
DB call fcopy (bfd, ERROUT)

   call close (bfd)

   call print (STDOUT, "JOB '*s'"s, tempfile)

   if (length (accountinfo) ~= 0)
      call print (STDOUT, " -ACCT '*s'"s, accountinfo)

   if (length (homedir) ~= 0) {
      call mktr$ (homedir, buf)
      if (index (buf, ' 'c) ~= 0)
         call print (STDOUT, " -HOME '*s'"s, buf)
      else
         call print (STDOUT, " -HOME *s"s, buf)
      }

   if (length (queue) ~= 0)
      call print (STDOUT, " -QUEUE *s"s, queue)

   if (cptime > 0)
      call print (STDOUT, " -CPTIME *i"s, cptime)
   else if (cptime < 0)
      call print (STDOUT, " -CPTIME NONE"s)

   if (etime > 0)
      call print (STDOUT, " -ETIME *i"s, etime)
   else if (etime < 0)
      call print (STDOUT, " -ETIME NONE"s)

   if (priority > 0)
      call print (STDOUT, " -PRIORITY *i"s, priority)

   if (restart == YES)
      call print (STDOUT, " -RESTART YES"s)

   if (funit ~= DEFAULT_FUNIT && funit > 0)
      call print (STDOUT, " -FUNIT *i"s, funit)

   call print (STDOUT, "*n"s)

   if (expand ("=GaTech="s, buf, MAXLINE) ~= ERR
      && equal (buf, "yes"s) == YES)
      call print (STDOUT, "DELETE '*s'*n"s, tempfile)
   else
      call print (STDOUT, "COMO -NTTY*nDELETE '*s'*nCOMO -TTY*n"s, tempfile)

   return
   end



# get_passwd --- obtain the Subsystem password from the profile

   subroutine get_passwd (str)
   character str (ARB)

   include SWT_COMMON

   call scopy (Passwd, 1, str, 1)

   return
   end



# get_seq --- get the batch sequence number from the user's directory

   integer function get_seq (str)
   character str (MAXLINE)

   integer i, fd, t
   integer getlin, create, open, ctoi
   character buf (MAXLINE)

   string batch_seq "=varsdir=/.batch_seq"

   for (i = 1; i <= 5; i += 1) {
      fd = open (batch_seq, READWRITE)
      if (fd ~= ERR)
         break
      call sleep$ (intl (500))
      }

   if (i > 5) {
      fd = create (batch_seq, READWRITE)
      if (fd == ERR)
         call cant (batch_seq)
      t = 1
      }
   else if (getlin (buf, fd) == EOF)
      t = 1
   else {
      i = 1
      t = ctoi (buf, i)
      }

   call rewind (fd)
   call trunc (fd)
   call print (fd, "*i*n"s, t + 1)
   call close (fd)

DB call print (ERROUT, "in get_seq: returning '*s'*n"s, str)
   return (t)
   end



# grabstr --- get a string for the next argument; test for validity

   subroutine grabstr (i, str, status)
   integer i, status
   character str (ARB)

   integer getarg, length

   if (length (str) ~= 0)
      status = ERR
   i += 1
   if (getarg (i, str, MAXLINE) == EOF)
      status = ERR
   if (str (1) == '-'c)
      status = ERR

   return
   end



# grabnum --- get a number for the next argument; test for validity

   subroutine grabnum (i, num, status)
   integer i, num, status

   integer j
   integer getarg, ctoi
   character str (MAXLINE)

   if (num ~= 0)
      status = ERR
   j = getarg (i + 1, str, MAXLINE)
   if (j == EOF || j == 0 || str (1) == '-'c) {
      num = -1
      }
   else {
      j = 1
      num = ctoi (str, j)
      if (str (j) ~= EOS)
         status = ERR
      i += 1
      }

   return
   end



# usage_msg --- print usage message

   subroutine usage_msg

   call remark ("Usage: batch -(s|d)[a|t] [<jobname>]"s)
   call remark ("       batch -(c|a|r) <jobname>"s)
   call remark ("       batch -m <jobname> {<options>}"s)
   call remark ("       batch [[-k] <command>] {<options>}"s)
   call remark ("    <options> ::= -a <acct> | -r | -n |"s)
   call remark ("        -h <home dir> | -t <cpu time> | -e <elapsed> |"s)
   call error  ("        -p <priority> | -q <queue>    | -f <unit>"s)

   end


# job_status --- build command to display job status

   subroutine job_status (arg)
   character arg (ARB)

   character name (MAXLINE)
   integer mapdn

   call get_job_name (2, name)

   if (mapdn (arg (2)) == 's'c)
      call print (STDOUT, "JOB *s -STATUS"s, name)
   else if (mapdn (arg (2)) == 'd'c)
      call print (STDOUT, "JOB *s -DISPLAY"s, name)
   else
      call error ("in job_status: can't happen"s)

   if (arg (3) == EOS)
      call print (STDOUT, " ALL"s)
   else if (mapdn (arg (3)) == 'a'c)
      ;
   else if (mapdn (arg (3)) == 't'c)
      call print (STDOUT, " TODAY"s)
   else
      call usage_msg

   call putch (NEWLINE, STDOUT)

   return
   end



# cancel_job --- generate command to cancel, abort, or restart a job

   subroutine cancel_job (arg)
   character arg (ARB)

   character name (MAXLINE)
   integer length, mapdn

   call get_job_name (2, name)
   if (length (name) <= 0)
      call usage_msg

   call print (STDOUT, "JOB *s "s, name)
   if (mapdn (arg (2)) == 'a'c)
      call print (STDOUT, "-ABORT*n"s)
   else if (mapdn (arg (2)) == 'c'c)
      call print (STDOUT, "-CANCEL*n"s)
   else if (mapdn (arg (2)) == 'r'c)
      call print (STDOUT, "-RESTART*n"s)
   else
      call error ("in cancel_job: can't happen"s)

   return
   end



# modify_job --- generate command to modify a job's attributes

   subroutine modify_job

   call error ("Sorry, job modification not implemented"p)

   return
   end



# get_job_name --- get a job name; add a sharp sign if all numeric

   subroutine get_job_name (ap, str)
   integer ap
   character str (MAXLINE)

   integer i
   integer getarg
   character arg (MAXLINE)

   if (getarg (ap, arg, MAXLINE) == EOF)
      str (1) = EOS
   else if (arg (1) == '-'c)
      call usage_msg
   else {
      i = 1
      call ctoi (arg, i)
      if (arg (i) == EOS) {
         str (1) = '#'c
         call scopy (arg, 1, str, 2)
         }
      else
         call scopy (arg, 1, str, 1)
      }
   return
   end
