# chat --- change file attributes

   include PRIMOS_KEYS
   include LIBRARY_DEFS
   define (DEFPROVAL,8r3401)
   define (DB,#)

   integer argp, array (2), attach, code, day, descend, dtm, dumped,
         dval, entry (MAXDIRENTRY), filename_seen, i, j, junk (3), level,
         lockval, max_levels, month, owner, protect, proval,
         rwlock, tval, year
   integer nonowner_bits (4), owner_bits (4)
   integer ctoi, follow, getarg, getto, index, strlsr, tscan$, parsdt,
         parstm
   longint ltime
   character path (MAXPATH), arg (MAXARG)

   string_table lockpos, locktext _
      / 0, "sys"  / 1, "n-1"  / 2, "n+1"  / 3, "n+n"

   data owner_bits / 8r2000, 8r1000, 8r0400, 8r3400 /
   data nonowner_bits / 4, 2, 1, 7 /

   procedure parse_protection forward
   procedure parse_rwlock forward
   procedure default_opts forward
   procedure do_dir forward
   procedure do_file forward
   procedure do_path forward
   procedure get_options forward
   procedure help forward
   procedure reset_opts forward

   filename_seen = NO   # no filename args processed yet

   reset_opts
   for (argp = 1; getarg (argp, path, MAXPATH) ~= EOF; argp += 1)
      if (path (1) == '-'c)   # arg is an option
         get_options
      else {                  # arg is a file name
         filename_seen = YES
         default_opts
         do_path
         }

   if (filename_seen == NO && descend ~= NO) {  # work on current ufd
      default_opts
      path (1) = EOS
      do_path
      }


   # parse_protection --- parse protection specification argument

      procedure parse_protection {

         owner = YES
         proval = 0
         for ( ; arg (j) ~= EOS; j += 1) {
            if (arg (j) == '/'c) {
               owner = NO
               next
               }
            i = index ("twra"s, arg (j))
            if (i <= 0) {
               call putlin (arg, ERROUT)
               call error (": bad protection mode"s)
               }
            if (owner ~= NO)
               proval |= owner_bits (i)
            else
               proval |= nonowner_bits (i)
            }
         }


   # parse_rwlock --- parse read/write lock specification argument

      procedure parse_rwlock {

         call mapstr (arg, LOWER)
         i = strlsr (lockpos, locktext, 1, arg (j))
         if (i == EOF) {
            call putlin (arg, ERROUT)
            call error (": bad lock specification"s)
            }
         else
            lockval = locktext (lockpos (i))
         }


   # default_opts --- check for defaulted options

      procedure default_opts {

         if (max_levels <= 0)
            max_levels = MAX_INTEGER

         if (dumped == NO && rwlock == NO && dtm == NO && protect == NO) {
            protect = YES
            proval = DEFPROVAL
            }
         }


   # do_dir --- operate on the contents of the current ufd

      procedure do_dir {

         level = 0
         repeat {
            select (tscan$ (path, entry, level, max_levels, POSTORDER))
               when (OK)
                  do_file
               when (EOF)
                  break
            }
         }


   # do_file --- operate on a single file

      procedure do_file {

         code = 0
         if (protect ~= NO) {
            array (1) = proval; array (2) = 0
            call satr$$ (KPROT, entry (2), 32, array, code)
DB          call errpr$ (KIRTN, code, 0, 0, 0, 0)
            if (code ~= 0)
               call errmsg (path, "can't set protection"s)
            }

         if (dtm ~= NO && code == 0) {
            array (1) = dval; array (2) = tval
            call satr$$ (KDTIM, entry (2), 32, array, code)
DB          call errpr$ (KIRTN, code, 0, 0, 0, 0)
            if (code ~= 0)
               call errmsg (path, "can't set modification date/time"s)
            }

         if (dumped ~= NO && code == 0) {
            array (1) = 0; array (2) = 0
            call satr$$ (KDMPB, entry (2), 32, array, code)
DB          call errpr$ (KIRTN, code, 0, 0, 0, 0)
            if (code ~= 0)
               call errmsg (path, "can't set dumped bit"s)
            }

         if (rwlock ~= NO && code == 0 && and (entry (20), 7) ~= 4) {
            array (1) = lockval; array (2) = 0
            call satr$$ (KRWLK, entry (2), 32, array, code)
DB          call errpr$ (KIRTN, code, 0, 0, 0, 0)
            if (code ~= 0)
               call errmsg (path, "can't set read/write lock"s)
            }

         }


   # do_path --- operate on a single <path_name> argument

      procedure do_path {

         if (descend == YES)
            if (follow (path, 0) ~= ERR) {
               do_dir
               call at$hom (junk)
               }
            else
               call errmsg (path, "not a directory"s)
         elif (getto (path, entry (2), junk, attach) ~= ERR) {
            entry (20) = 0    # do_file tests type before setting rwlock
            do_file
            if (attach ~= NO)
               call at$hom (junk)
            }
         else
            call errmsg (path, "bad pathname"s)

         }


   # get_options --- process options for chat

      procedure get_options {

         reset_opts

         for ( ; getarg (argp, arg, MAXARG) ~= EOF; argp += 1) {
            if (arg (1) ~= '-'c)    # it's not an option
               break
            select (arg (2))
               when ('s'c, 'S'c) {  # descend into directory
                  descend = YES
                  if (arg (3) == EOS) {
                     if (getarg (argp + 1, arg, MAXARG) ~= EOF) {
                        j = 1
                        max_levels = ctoi (arg, j)
                        if (arg (j) == EOS)
                           argp += 1
                        else
                           max_levels = 0
                        }
                     }
                  else {
                     j = 3
                     max_levels = ctoi (arg, j)
                     if (arg (j) ~= EOS)
                        help
                     }
                  }
               when ('u'c, 'U'c, 'd'c, 'D'c)    # set "dumped" bit
                  dumped = YES
               when ('k'c, 'K'c) {     # set read/write lock
                  rwlock = YES
                  if (arg (3) == EOS) {
                     argp += 1
                     if (getarg (argp, arg, MAXARG) == EOF)
                        help
                     j = 1
                     }
                  else
                     j = 3
                  parse_rwlock
                  }
               when ('m'c, 'M'c) {     # set modification date/time
                  dtm = YES
                  argp += 2
                  if (getarg (argp - 1, arg, 10) == EOF
                        || getarg (argp, arg (11), 10) == EOF)
                     help
                  j = 1
                  if (parsdt (arg, j, month, day, year) == ERR)
                     help
                  j = 11
                  if (parstm (arg, j, ltime) == ERR)
                     help
                  dval = ls (year, 9) + ls (month, 5) + day
                  tval = ltime / 4
                  }
               when ('p'c, 'P'c) {     # set protection mode
                  protect = YES
                  if (arg (3) == EOS) {
                     argp += 1
                     if (getarg (argp, arg, MAXARG) == EOF)
                        help
                     j = 1
                     }
                  else
                     j = 3
                  parse_protection
                  }
            else  # unrecognized option
               help
            }  # for ...

         argp -= 1         # back up to last option seen

         }


   # help --- print usage summary and die

      procedure help {

         call remark ( _
            "Usage: chat { {-u|-s [<levels>]|-p <protect>|-m <date> <time>"s)
         call error ( _
            "              |-k (sys|n-1|n+1|n+n)} {<path>} }"s)

         }


   # reset_opts --- reset all option flags for chat

      procedure reset_opts {

         descend = NO
         dumped = NO
         rwlock = NO
         dtm = NO
         protect = NO
         max_levels = 0
         }

   stop
   end


# errmsg --- print out an error message

   subroutine errmsg (path, msg)
   integer path (ARB), msg (ARB)

   call print (ERROUT, "*s: *s*n"s, path, msg)

   return
   end
