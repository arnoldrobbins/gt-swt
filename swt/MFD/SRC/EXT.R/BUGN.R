# bugn --- find the highest bug number, optionally preincrement

   include ARGUMENT_DEFS

   ARG_DECL
   character line (MAXLINE)
   integer i, mode, n
   integer ctoi
   filedes fd
   filedes open
   string bug_number "=bug=/$"

   PARSE_COMMAND_LINE ("-i"s, "Usage: bugn [-i]"p)

   if (ARG_PRESENT (i))
      mode = READWRITE
   else
      mode = READ

   fd = open (bug_number, mode)
   if (fd == ERR)
      call cant (bug_number)

   call getlin (line, fd)
   i = 1
   n = ctoi (line, i)
   if (ARG_PRESENT (i)) {
      n += 1
      call rewind (fd)
      call print (fd, "*3,,0i*n"p, n)
      }

   call close (fd)
   call print (STDOUT, "*3,,0i*n"p, n)

   stop
   end
