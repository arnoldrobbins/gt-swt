# chown --- change directory ownership

   include LIBRARY_DEFS
   include ARGUMENT_DEFS

   ARG_DECL
   character arg (MAXARG)
   integer i, owner (3), code, max_levels, level, entry (MAXDIRENTRY)
   integer follow, getarg, tscan$
   string usage "Usage: chown [-s [<levels>]] <owner> {<dir>}"

   procedure do_subtree forward
   procedure do_current_dir forward

   PARSE_COMMAND_LINE ("-s <oi>"s, usage)
   ARG_DEFAULT_INT (s, 31)
   max_levels = ARG_VALUE (s) + 1   # must enter directory to chown it

   if (getarg (1, arg, MAXARG) == EOF)    # get the owner name
      call error (usage)
   call mapstr (arg, UPPER)               # force upper case
   do i = 1, 3                            # pad with blanks
      owner (i) = "  "
   i = 1
   call ctop (arg, i, owner, 3)           # convert to packed string
   if (arg (i) ~= EOS)
      call error ("owner name too long"s)

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

   if (i == 2)    # chown current ufd
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

         call spas$$ (owner, 0, code)
         if (code ~= 0)
            call print (ERROUT, "*s: can't change owner*n"s, arg)

         }

   stop
   end
