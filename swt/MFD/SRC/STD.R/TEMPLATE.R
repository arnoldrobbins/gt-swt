# template --- command to manipulate templates

   include ARGUMENT_DEFS
   include LIBRARY_DEFS
   define (CHANGE,2)
   define (DELETE,1)

   ARG_DECL
   logical list_users, list_system
   string usage "Usage: template [-a|-r] [-l{usv}]  { <string> }"

   procedure change_templates forward
   procedure delete_templates forward
   procedure check_arguments forward
   procedure expand_templates forward
   procedure list_templates forward

   PARSE_COMMAND_LINE ("alrsuv"s, usage)
   list_users = ARG_PRESENT (u)
   list_system = ARG_PRESENT (s)
   if (~ list_users && ~ list_system)
      list_users = TRUE

   if (ARG_PRESENT (a) && ARG_PRESENT (r))
      call error (usage)

   if (ARG_PRESENT (a))
      change_templates
   elif (ARG_PRESENT (r))
      delete_templates
   elif (~ ARG_PRESENT (l))
      expand_templates

   if (ARG_PRESENT (l))
      list_templates

   stop



   # expand_templates --- expand templates specified as arguments

      procedure expand_templates {

      local i, str, arg
      integer i
      integer getarg
      character arg (MAXLINE), str (MAXPATH)

      for (i = 1; getarg (i, arg, MAXLINE) ~= EOF; i += 1) {
         call expand (arg, str, MAXPATH)
         call print (STDOUT, "*s*n"s, str)
         }

      }



   # list_templates --- list contents of the specified template files

      procedure list_templates {

      include SWT_COMMON
      include "=incl=/temp_com.r.i"


      if (list_users) {
         if (ARG_PRESENT (v))
            call print (STDOUT, "*nUser Templates:*n"s)
         call print_templates (Uhashtb, Utempbuf)
         }
      if (list_system) {
         if (ARG_PRESENT (v))
            call print (STDOUT, "*nSystem Templates:*n"s)
         call print_templates (Hashtb, Tempbuf)
         }

      }



   # change_templates --- modify or add to the user's template file

      procedure change_templates {

      local fd, tfd, arg, line, jig, rep
      filedes fd, tfd
      filedes open, mktemp
      integer arg
      integer getlin, getarg, gtemp, targ
      character line (MAXLINE), jig (MAXARG), rep (MAXARG)

      check_arguments   # check for duplicates
      fd = open ("=utemplate="s, READWRITE)
      if (fd == ERR)
         call error ("can't open user template file"p)
      tfd = mktemp (READWRITE)
      if (tfd == ERR)
         call error ("can't create temporary file"p)
      while (getlin (line, fd) ~= EOF) {
         if (gtemp (line, jig, rep) == EOF         # comment line
               || targ (arg, jig, CHANGE) == EOF)  # not in arg list
            call putlin (line, tfd)
         else {
            call getarg (arg + 1, rep, MAXARG)
            call ptemp (jig, rep, tfd)
            call delarg (arg)    # delete the template name
            call delarg (arg)    # ...and its definition
            }
         }
      call rewind (fd)
      call rewind (tfd)
      call fcopy (tfd, fd)
      call rmtemp (tfd)
      for (arg = 1; getarg (arg, jig, MAXARG) ~= EOF; arg += 2) {
         call getarg (arg + 1, rep, MAXARG)
         call ptemp (jig, rep, fd)
         }
      call trunc (fd)
      call close (fd)
      call ldtmp$

      }



   # check_arguments --- validate template definition args

      procedure check_arguments {

      local i, j, errcnt, s1, s2
      integer i, j, errcnt
      integer getarg, equal, index
      character s1 (MAXARG), s2 (MAXARG)

      errcnt = 0
      for (i = 1; getarg (i, s1, MAXARG) ~= EOF; i += 2) {

         if (index (s1, '='c) ~= 0) {
            call print (ERROUT, "*s: may not contain '='*n"s, s1)
            errcnt += 1
            }

         if (getarg (i + 1, s2, 1) == EOF) {
            call print (ERROUT, "*s: missing definition*n"s, s1)
            errcnt += 1
            }
         for (j = i + 2; getarg (j, s2, MAXARG) ~= EOF; j += 2)
            if (equal (s1, s2) ~= NO) {
               call print (ERROUT, "*s: duplicate name*n"s, s1)
               errcnt += 1
               }
         }
      if (errcnt ~= 0)
         call error ("file not altered"s)

      }



   # delete_templates --- make deletions from the user's template file

      procedure delete_templates {

      local fd, tfd, arg, line, jig, rep
      filedes fd, tfd
      filedes open, mktemp
      integer arg
      integer getlin, gtemp, targ, getarg
      character line (MAXLINE), jig (MAXARG), rep (MAXARG)

      fd = open ("=utemplate="s, READWRITE)
      if (fd == ERR)
         call error ("can't open user template file"p)
      tfd = mktemp (READWRITE)
      if (tfd == ERR)
         call error ("can't open temporary file"p)
      while (getlin (line, fd) ~= EOF)
         if (gtemp (line, jig, rep) == EOF)        # comment line
            call putlin (line, tfd)
         elif (targ (arg, jig, DELETE) == EOF)     # not in arg list
            call putlin (line, tfd)
         else
            call delarg (arg)
      call rewind (tfd)
      call rewind (fd)
      call trunc (fd)
      call fcopy (tfd, fd)
      call rmtemp (tfd)
      call close (fd)
      call ldtmp$

      for (arg = 1; getarg (arg, line, MAXARG) ~= EOF; arg += 1)
         call print (ERROUT, "*s: not in template file*n"s, line)

      }

   end



# print_templates --- print stored templates on STDOUT

   subroutine print_templates (hashtb, tempbuf)
   integer hashtb (ARB)
   character tempbuf (ARB)

   integer h
   pointer p

   do h = 1, MAXTEMPHASH
      for (p = hashtb (h); p ~= LAMBDA; p = tempbuf (p))
         if (tempbuf (p + 1) > 0)
            call ptemp (tempbuf (p + 2), tempbuf (tempbuf (p + 1)), STDOUT)

   return
   end



# ptemp --- print a template and its value

   subroutine ptemp (jig, rep, fd)
   character jig (ARB), rep (ARB)
   filedes fd

   integer l
   integer length

   l = max0 (length (jig) + 1, 15)
   l = l - mod (l, 3) + 4
   call print (fd, "   *s*#t*s*n"s, jig, l, rep)

   return
   end



# targ --- see if a template name is specified on the command line

   integer function targ (arg, jig, cmd)
   integer arg, cmd
   character jig (ARB)

   integer bump
   integer getarg, equal
   character str (MAXARG)

   if (cmd == CHANGE)
      bump = 2
   else
      bump = 1

   for (arg = 1; getarg (arg, str, MAXARG) ~= EOF; arg += bump)
      if (equal (jig, str) ~= NO)
         return (arg)

   return (EOF)
   end
