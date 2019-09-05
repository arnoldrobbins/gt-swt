# quota --- set and read disk quotas

   include ARGUMENT_DEFS

   integer gfdata, sfdata, gfnarg, length
   long_int gctol

   ARG_DECL
   integer i, is_quota_dir, state (4)
   long_int qbuf (8)
   character path (MAXPATH)

   string usage "Usage: quota [-s <quota value>] [-v] {<file_spec>}"


   PARSE_COMMAND_LINE ("-s<rs> n<ign>v"s, usage)

   if (ARG_PRESENT (s)) {
      i = 1
      qbuf (1) = gctol (ARG_TEXT (s), i, 10)
      if (i - 1 ~= length (ARG_TEXT (s)) || qbuf (1) < 0)
         call error ("improper quota value"s)
      }

   state (1) = 1
   repeat {
      select (gfnarg (path, state))
         when (EOF)
            break
         when (ERR)
            call error (usage)
      else
         if (~ ARG_PRESENT (s))
            if (gfdata (FILE_UFDQUOTA, path, qbuf, i, is_quota_dir) == ERR) {
               if (is_quota_dir == YES)
                  call print (ERROUT, "*s: can't get quota information*n"s, path)
               else
                  call print (ERROUT, "*s: not a quota directory*n"s, path)
               }
            else {
               call print (STDOUT, "*6l/*6l (*,-10l)"s, qbuf(4), qbuf(3), qbuf (5))

               if (ARG_PRESENT (v))
                  call print (STDOUT, " | *s"s, path)
               call print (STDOUT, "*n"s)
               }

         else
            if (sfdata (FILE_UFDQUOTA, path, qbuf, i, i) == ERR)
               call print (ERROUT, "*s: can't set quota*n"s, path)

      }  # repeat

   stop
   end
