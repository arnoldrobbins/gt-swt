# who --- print a list of logged-in users and their locations

   include ARGUMENT_DEFS
   include "=incl=/user_types.r.i"

   define (MEMSIZE,16384)
   define (MAXPROC,128)

   define (USER_SCOL,1)          # Starting and ending columns in =userlist=
   define (USER_ECOL,32)
   define (FNAME_SCOL,70)
   define (FNAME_ECOL,89)
   define (LNAME_SCOL,34)
   define (LNAME_ECOL,68)
   define (PROJ_SCOL,91)
   define (PROJ_ECOL,100)

   define (NOT_CONFIGURED,-1)    # these should be small and negative
   define (REMOTE,-2)
   define (PHANTOM,-3)
   define (LOCAL,-4)


   ARG_DECL

   filedes nfd, tfd
   filedes open

   filemark ttable (MAXPROC)

   integer pid, first_pid, utype
   integer get_user_info, get_locn, length

   logical header

   character rem, uid (MAXUSERNAME), name (30), locn (30), time (6)
   character project (MAXUSERNAME)

   pointer utable
   pointer load_userlist


   string usage "Usage: who {-a | -l | -p | -q}"

   PARSE_COMMAND_LINE ("alpq"s, usage)

   if (ARG_PRESENT (l) && ARG_PRESENT (p))
      call error ("can't display both location and project at the same time"p)

   nfd = open ("=userlist="s, READ)
   if (nfd == ERR)
      call error ("can't read user list"p)

   tfd = open ("=termlist="s, READ)
   if (tfd == ERR) {
      call close (nfd)
      call error ("can't read terminal list"p)
      }

   utable = load_userlist (nfd)
   call load_termlist (tfd, ttable)

   header = ~ ARG_PRESENT (q)
   if (ARG_PRESENT (a))
      first_pid = 1        # system console is always pid #1
   else
      first_pid = 2
   do pid = first_pid, MAXPROC; {
      if (get_user_info (pid, rem, uid, time, project, utype) ~= EOF) {

         select (get_locn (pid, ttable, tfd, locn, utype))
            when (PHANTOM)
               if (~ARG_PRESENT (a))
                  break
            when (NOT_CONFIGURED)
               break

         if (header) {
            if (~ ARG_PRESENT (p) || ARG_PRESENT (l))
               call print (STDOUT, "*#p *3p  *5p  *29p  *27p*n"p,
                     (MAXUSERNAME - 1) / 4, "User"p, "Pid"p, "In At"p, "Name"p, "Location"p)
            else
               call print (STDOUT, "*#p *3p  *5p  *29p  *27p*n"p,
                     (MAXUSERNAME - 1) / 4, "User"p, "Pid"p, "In At"p, "Name"p, "Project"p)
            call print (STDOUT, "*,,-u*#s *3s  *5s  *29s  *27s*n"p,
                  (MAXUSERNAME - 1) / 4, EOS, EOS, EOS, EOS, EOS)
            header = FALSE
            }

         call get_name (utable, nfd, uid, name)
         if (length (uid) > (MAXUSERNAME - 1) / 4) {
            call print (STDOUT, "*s*n"s, uid)
            if (~ ARG_PRESENT (p) || ARG_PRESENT (l))
               call print (STDOUT, "*#t *3i*c *5s  *29,29s  *,27s*n"p,
                     (MAXUSERNAME + 3) / 4, pid, rem, time, name, locn)
            else
               call print (STDOUT, "*#t *3i*c *5s  *29,29s  *,27s*n"p,
                     (MAXUSERNAME + 3) / 4, pid, rem, time, name, project)
            }
         else
            if (~ ARG_PRESENT (p) || ARG_PRESENT (l))
               call print (STDOUT, "*#s *3i*c *5s  *29,29s  *,27s*n"p,
                     (MAXUSERNAME - 1) / 4, uid, pid, rem, time, name, locn)
            else
               call print (STDOUT, "*#s *3i*c *5s  *29,29s  *,27s*n"p,
                     (MAXUSERNAME - 1) / 4, uid, pid, rem, time, name, project)
         }
      }

   call close (nfd)
   call close (tfd)

   stop
   end


# get_locn --- read and format next line from =termlist= file

   integer function get_locn (pid, table, fd, locn, utype)
   integer pid, utype
   filemark table (MAXPROC)
   filedes fd
   character locn (30)

   integer l
   integer getlin
   character line (MAXLINE)

   select
      when (utype == FROM_REMOTE) {
         call ctoc ("Remote Login Server"s, locn, 30)
         return (REMOTE)
         }

      when (utype <= HIGH_TERMINAL_USER)
         if (table (pid) == NOT_CONFIGURED)
            return (NOT_CONFIGURED)
         else {
            call seekf (table (pid), fd)
            l = getlin (line, fd)
            if (l == EOF || l < 19)
               locn (1) = EOS
            else {
               if (line (l) == NEWLINE)
                  line (l) = EOS
               call ctoc (line (18), locn, 30)
               }
            return (LOCAL)
            }

      when (utype == NPX_SLAVE) {
         call ctoc ("NPX Slave"s, locn, 30)
         return (PHANTOM)
         }

      when (utype >= LOW_PHANTOM_USER) {
         call ctoc ("Phantom User"s, locn, 30)
         return (PHANTOM)
         }
   else
      call error ("in get_locn: can't happen"p)

   end


# get_user_info --- return the name of a logged-in user

   integer function get_user_info (pid, rem, uid, time, project, utype)
   integer pid, utype
   character rem, uid (MAXUSERNAME), time (6), project (MAXUSERNAME)

   integer userm (43), code, h, m

   call gmetr$ (4, loc (userm), 43, code, pid)
   if (code ~= 0 || userm (2) < 0)        # either error or not logged in
      return (EOF)

   if (userm (1) >= 3) {                  # Rev 19 version structure or later
      call ptoc (userm (5), ' 'c, uid, MAXUSERNAME)
      call ptoc (userm (21), ' 'c, project, MAXUSERNAME)
      }
   else
      return (EOF)                        # don't support old revs

   call mapstr (uid, LOWER)
   call mapstr (project, LOWER)

   utype = userm (2)

   if (userm (2) == 2 || userm (2) == 4)  # test gone remote
      rem = 'r'c                          # or logged thru
   else
      rem = ' 'c

   # time is kept in quad-seconds since midnight
   h = mod ((userm (4) / 15) / 60, 24)
   m = mod (userm (4) / 15, 60)
   call encode (time, 6, "*2i:*2,,0i"s, h, m)

   return (OK)
   end


# get_name --- find the user name corresponding to a login name

   subroutine get_name (table, nfd, uid, name)
   pointer table
   file_des nfd
   character uid (ARB), name (30)

   integer l, i
   integer ctoc, equal, expand, getlin, lookup
   longint mark
   character line (MAXLINE), junk (MAXLINE)

   if (lookup (uid, mark, table) == YES) {
      call seekf (mark, nfd)
      l = getlin (line, nfd)
      if (l == EOF || l < 9) {
         name (1) = EOS
         return
         }
      if (line (l) == NEWLINE)
         line (l) = EOS

      if (expand ("=GaTech="s, junk, MAXLINE) ~= ERR
            && equal (junk, "yes"s) == YES) {
         i = 1
         if (l > FNAME_SCOL) {
            i += ctoc (line (FNAME_SCOL), name (i),
                   min0 (30 - i + 1, FNAME_ECOL - FNAME_SCOL + 2))
            for (i -= 1; i >= 1 && name (i) == ' 'c; i -= 1)
               ;
            if (i <= 1)
               i = 1
            else {
               name (i + 1) = ' 'c
               i += 2
               }
            }
         if (l > LNAME_SCOL) {
            i += ctoc (line (LNAME_SCOL), name (i),
                  min0 (30 - i + 1, LNAME_ECOL - LNAME_SCOL + 2))
            for (i -= 1; i >= 1 && name (i) == ' 'c; i -= 1)
               ;
            i += 1
            }
         name (i) = EOS
         }
      else
         call ctoc (line (MAXUSERNAME + 1), name, 30) # this assumes
      return                                          # that MAXUSERNAME
      }                                               # includes room for
                                                      # EOS

   name (1) = EOS

   return
   end


# load_userlist --- read user list file into a symbol table

   pointer function load_userlist (fd)
   file_des fd

   DS_DECL (mem, MEMSIZE)
   pointer mktabl
   integer getlin

   character line (MAXLINE)
   longint mark
   longint markf

   call dsinit (MEMSIZE)

   load_userlist = mktabl (2)
   repeat {
      mark = markf (fd)
      if (getlin (line, fd) == EOF)
         break
      line (MAXUSERNAME) = EOS
      call strim (line)
      call mapstr (line, LOWER)
      call enter (line, mark, load_userlist)
      }

   return
   end



# load_termlist --- read terminal list file

   subroutine load_termlist (fd, table)
   filedes fd
   filemark table (MAXPROC)

   character pidstr (10), ttystr (10), line (MAXLINE)

   integer i, l, pid
   integer getlin, getwrd, ctoi

   filemark mark
   filemark markf

   do i = 1, MAXPROC
      table (i) = NOT_CONFIGURED

   repeat {
      mark = markf (fd)
      l = getlin (line, fd)
      if (l == EOF)
         break
      i = 1
      if (getwrd (line, i, ttystr, 10) == 0
            || getwrd (line, i, pidstr, 10) == 0)
         next
      i = 2
      pid = ctoi (pidstr, i)
      if (pid < 1 || pid > MAXPROC)
         next

      table (pid) = mark
      }

   return
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
