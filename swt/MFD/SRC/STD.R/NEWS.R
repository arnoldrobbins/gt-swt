# news --- print on-line newsletter articles

   include ARGUMENT_DEFS

   integer fd, argno
   integer open, getarg, encode

   ARG_DECL

   character arg (MAXLINE), buf (MAXLINE)

   procedure send_file (fd) forward

   PARSE_COMMAND_LINE ("p i"s,
         "Usage:  news [ -p ] { -i | <article no> }"s)

   if (ARG_PRESENT (i)) {
      fd = open ("=news=/index"s, READ)
      if (fd == ERR)
         call error ("can't open '=news=/index'"p)
      send_file (fd)
      }

   for (argno = 1; getarg (argno, arg, MAXLINE) ~= EOF; argno += 1) {
      call encode (buf, MAXLINE, "=news=/articles/art*s"s, arg)
      fd = open (buf, READ)
      if (fd == ERR)
         call print (ERROUT, "Article *s could not be found*n"p, arg)
      else
         send_file (fd)
      }

   if (argno == 1 && ~ ARG_PRESENT (i)) {    # no articles specified
      fd = open ("=news=/delivery/=user="s, READ)
      if (fd ~= ERR) {
         send_file (fd)
         call print (ERROUT, "save news? "p)
         call getlin (buf, ERRIN)
         if (buf (1) == 'n'c || buf (1) == 'N'c)
            call remove ("=news=/delivery/=user="s)
         }
      }

   stop


   # send_file --- 'fcopy' or 'page' a file, depending on "-p"

   procedure send_file (fd) {

      file_des fd

      if (ARG_PRESENT (p))
         call fcopy (fd, STDOUT)
      else
         call page (fd, "[*i] more? "s, "[END] "s, 22, STDOUT, PG_VTH)
      call close (fd)

      }

   end
