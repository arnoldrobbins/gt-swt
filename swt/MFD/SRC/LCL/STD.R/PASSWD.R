# passwd --- change directory password

   include LIBRARY_DEFS
   include ARGUMENT_DEFS

   ARG_DECL
   character arg (MAXARG), c
   integer i, pwd (3), code, max_levels, level, entry (MAXDIRENTRY)
   integer follow, getarg, tscan$
   string usage "Usage: passwd [-s [<levels>]] <password> {<dir>}"

   procedure do_subtree forward
   procedure do_current_dir forward

   PARSE_COMMAND_LINE ("-s <oi>"s, usage)
   ARG_DEFAULT_INT (s, 31)
   max_levels = ARG_VALUE (s) + 1   # must enter directory to passwd it

   if (getarg (1, arg, MAXARG) == EOF)    # get the password
      call error (usage)
   call mapstr (arg, UPPER)               # force upper case
   if (arg (1) == EOS)                    # convert empty passwd to zeros
      c = 0
   else                                   # otherwise, pad with blanks
      c = "  "
   do i = 1, 3
      pwd (i) = c
   i = 1
   call ctop (arg, i, pwd, 3)             # convert to packed string
   if (arg (i) ~= EOS)
      call error ("password too long"s)

   for (i = 2; getarg (i, arg, MAXARG) ~= EOF; i += 1)
      if (follow (arg, 0) ~= ERR) {
         if (ARG_PRESENT (s))
            do_subtree
         else
            do_current_dir
         call at$hom (code)
         }
      else
         call print (ERROUT, "*s: bad pathname*n"s, arg)

   if (i == 2)    # password current ufd
      if (ARG_PRESENT (s))
         do_subtree
      else
         do_current_dir


   # do_subtree --- operate on an entire subtree

      procedure do_subtree {

         level = 0
         repeat {
            select (tscan$ (arg, entry, level, max_levels, EODPAUSE))
               when (EOF)
                  break
               when (EOD)
                  do_current_dir
            }

         }


   # do_current_dir --- operate on the current directory

      procedure do_current_dir {

         call spas$$ (0, pwd, code)
         if (code ~= 0)
            call print (ERROUT, "*s: can't change password*n"s, arg)

         }

   stop
   end
