# cp --- copy source to destination (handles subtrees)

   include PRIMOS_KEYS
   include PRIMOS_ERRD
   include LIBRARY_DEFS
   include ARGUMENT_DEFS
   include "cp_def.r.i"

   ARG_DECL
   character src_path (MAXPATH), dst_path (MAXPATH), sname (MAXFNAME)
   character mapdn, gchar
   integer entry (MAXDIRENTRY), code, src_fd, dst_fd, src_type, dst_type, i,
         level, max_level, opw (3), npw (3), dst_name (16, MAX_LEVELS),
         dst_pwd (3, MAX_LEVELS), fcp, scp, junk (3), attach,
         entry2 (MAXDIRENTRY)
   integer tscan$, follow, getarg, finfo$, getto,
         expand, equal, upkfn$, length
   bool dst_created, GaTech

   procedure do_file forward
   procedure do_dir forward
   procedure get_passwords forward
   procedure update_dst_path forward
   procedure print_dst_path forward
   procedure set_attributes forward
   procedure follow_dst_path forward
   procedure create_dst_file forward
   procedure create_dst_dir forward
   procedure open_src forward
   procedure abend forward
   procedure save_entry forward
   procedure restore_entry forward
DB procedure print_current_dir forward
   procedure construct_dest_name forward
   procedure add_password forward

   string usage "Usage: cp [-mp] [-s <depth>] <from> [<to>]"

   if (expand ("=GaTech="s, src_path, MAXPATH) == ERR
         || equal (src_path, "yes"s) == NO)
      GaTech = FALSE
   else
      GaTech = TRUE

   PARSE_COMMAND_LINE ("[-mp] [-s <opt int>]"s, usage)
   ARG_DEFAULT_INT (s, MAX_INTEGER)    # set default value for "s" option
   if (getarg (3, src_path, 1) ~= EOF
         || getarg (1, src_path, MAXPATH) == EOF)
      call error (usage)

   i = getarg (2, dst_path, MAXPATH)   # destination is optional
   level = 0
   max_level = ARG_VALUE (s)

   if (finfo$ (src_path, entry, attach) == ERR) {
      call putlin (src_path, ERROUT)
      call error (": not found"s)
      }
   elif (and (entry (E_FTYPE), 7) ~= UFD_TYPE)  # source is a ufd
      do_file
   elif (ARG_PRESENT (s) || ARG_PRESENT (m))
      do_dir
   else {
      call putlin (src_path, ERROUT)
      call error (": is a directory"s)
      }


# do_file --- copy a single file

   procedure do_file {

      open_src
      if (code ~= 0)
         abend
      if (attach ~= NO)
         HOME

      select
         when (follow (dst_path, 0) == OK)   # dst is a directory
            construct_dest_name

         when (getto (dst_path, entry (E_NAME), junk, attach) == OK)
            ;

      ifany
         create_dst_file   # create the file and copy it

      else {
         code = ERR
         call putlin (dst_path, ERROUT)
         call remark (": bad pathname"s)
         }

      call srch$$ (KCLOS, 0, 0, src_fd, 0, junk)
      if (code ~= 0)
         abend

      }


# do_dir --- copy a subtree of the file system

   procedure do_dir {

      get_passwords
      if (attach ~= NO)
         HOME

      dst_created = FALSE
      select
         when (follow (dst_path, 0) == ERR)
            ;
         when (~ ARG_PRESENT (m))
            construct_dest_name
      ifany {
         add_password
         HOME
         create_dst_dir
         dst_created = TRUE
         save_entry
         }

      repeat {
         select (tscan$ (src_path, entry, level, max_level,
                                 PREORDER + POSTORDER + REATTACH))
            when (EOF)
               break

            when (OK) {    # a valid entry has been returned
DB             call print (ERROUT, "new entry: path = '*s'*n"s, src_path)
DB             call print (ERROUT, "   type=*,-8i, level=*i, ecw=*i, name=*,32h*n"s,
DB                   entry (E_FTYPE), level, entry (1), entry (E_NAME))
DB             print_current_dir
               max_level = ARG_VALUE (s)
               if (and (entry (E_FTYPE), 7) == UFD_TYPE) {
                  get_passwords  # while still attached to its parent
                  src_type = UFD_TYPE
                  }
               else {
                  open_src
                  if (code ~= 0)
                     next
                  }
               follow_dst_path
               update_dst_path
DB             call print (ERROUT, "destination path = '"s)
DB             call print_dst_path
DB             call print (ERROUT, "'*n"s)
DB             call print_current_dir
               if (src_type == UFD_TYPE) {
                  if (entry (E_ECW) == 0) {  # preorder encounter
                     call rmfil$ (entry (E_NAME))
                     call crea$$ (entry (E_NAME), 32, opw, npw, code)
DB                   call errpr$ (KIRTN, code, entry (E_NAME), 32,
DB                         "crea$$", 6)
                     if (code ~= 0 && code ~= EEXST) {
                        print_dst_path
                        call remark (": can't create"s)
                        max_level = level    # prevent tscan$ from entering this ufd
                        }
                     }
                  else                       # postorder encounter
                     set_attributes
                  }
               else {   # source is not a directory
                  create_dst_file
                  call srch$$ (KCLOS, 0, 0, src_fd, 0, junk)
                  }
               }  # when (OK)

         }  # repeat

      if (dst_created) {
         restore_entry
         HOME
         if (getto (dst_path, entry (E_NAME), junk, attach) == ERR)
            call error ("can't happen"s)
         set_attributes
         }

      }


# get_passwords --- fetch passwords for the current directory entry

   procedure get_passwords {

      call gpas$$ (entry (E_NAME), 32, opw, npw, code)
DB    call errpr$ (KIRTN, code, entry (E_NAME), 32, "gpas$$", 6)
      if (code ~= 0 || ~ ARG_PRESENT (p))
         do i = 1, 3; {
            opw (i) = 0
            npw (i) = 0
            }
      }


# update_dst_path --- add name and password to destination path

   procedure update_dst_path {

      local sptr, fptr
      longint sptr, fptr

      sptr = loc (dst_name (1, level))
      fptr = loc (entry (E_NAME))

      for ({fcp = 0; scp = 0}; fcp < 32; )
         call schar (sptr, scp, mapdn (gchar (fptr, fcp)))

      if (GaTech)
         do i = 1, 3
            dst_pwd (i, level) = npw (i)
      else
         do i = 1, 3
            if (opw (1) == 0)
               dst_pwd (i, level) = "  "
            else
               dst_pwd (i, level) = opw (i)
      }


# print_dst_path --- construct and print the destination pathname

   procedure print_dst_path {

      call putlin (dst_path, ERROUT)
      for (i = 1; i <= level; i += 1) {
         if (level > 1 || dst_path (1) ~= EOS)
            call putch ('/'c, ERROUT)
         call upkfn$ (dst_name (1, i), 32, sname, MAXFNAME)
         call putlin (sname, ERROUT)
         }
      }


# set_attributes --- set file attributes

   procedure set_attributes {

      call satr$$ (KPROT, entry (E_NAME), 32,
            ls (intl (entry (E_PROTEC)), 16), junk)
      if (src_type ~= UFD_TYPE && src_type ~= ACAT_TYPE)
         call satr$$ (KRWLK, entry (E_NAME), 32,
               rs (and (entry (E_FTYPE), LOCK_BITS), 10), junk)
      if (and (entry (E_FTYPE), MODIFIED_BIT) == 0)
         call satr$$ (KDTIM, entry (E_NAME), 32, entry (E_DATMOD), junk)
      call satr$$ (KSDL, entry (E_NAME), 32,
            and (entry (E_PROTEC), DEL_PROT_BIT), junk)
      call satr$$ (KLTYP, entry (E_NAME), 32, entry (E_LTYPE), junk)
      }


# follow_dst_path --- attach to the current destination directory

   procedure follow_dst_path {

      HOME
      if (follow (dst_path, 0) ~= ERR)
         for (i = 1; i < level; i += 1) {
            call atch$$ (dst_name (1, i), 32, 0, dst_pwd (1, i),
                  KICUR, code)
DB          call errpr$ (KIRTN, code, dst_name (1, i), 32, 0, 0)
            if (code ~= 0)
               call error ("in follow_dst_path: can't happen 1"s)
            }
      else
         call error ("in follow_dst_path: can't happen 2"s)
      }


# create_dst_dir --- create the top-level destination directory

   procedure create_dst_dir {

      if (getto (dst_path, entry (E_NAME), junk, attach) == ERR) {
         call putlin (dst_path, ERROUT)
         call error (": bad pathname"s)
         }

      call rmfil$ (entry (E_NAME))
      call crea$$ (entry (E_NAME), 32, opw, npw, code)
DB    call errpr$ (KIRTN, code, entry (E_NAME), 32, "crea$$", 6)
      if (code ~= 0 && code ~= EEXST) {
         call putlin (dst_path, ERROUT)
         call error (": can't create"s)
         }
      }


# open_src --- open the source file

   procedure open_src {

      call srch$$ (KREAD + KGETU, entry (E_NAME), 32,
            src_fd, src_type, code)
DB    call errpr$ (KIRTN, code, entry (E_NAME), 32, "srch$$", 6)
      if (code ~= 0) {
         call putlin (src_path, ERROUT)
         call remark (": can't open"s)
         }
      else
         src_type &= 7     # mask out "funny" bits

      }


# create_dst_file --- create destination file and copy source to it

   procedure create_dst_file {

      call srch$$ (KRDWR + KGETU + ls (src_type, 10),
            entry (E_NAME), 32, dst_fd, dst_type, code)
DB    call errpr$ (KIRTN, code, entry (E_NAME), 32, "srch$$", 6)
      if (code == 0 && dst_type ~= src_type) {
         call rmfil$ (entry (E_NAME))
         call srch$$ (KRDWR + KGETU + ls (src_type, 10),
               entry (E_NAME), 32, dst_fd, dst_type, code)
DB       call errpr$ (KIRTN, code, entry (E_NAME), 32, "srch$$", 6)
         }
      if (code ~= 0) {
         print_dst_path
         call remark (": can't create"s)
         }
      elif (dst_type ~= src_type) {    # file/directory conflict
         call srch$$ (KCLOS, 0, 0, dst_fd, 0, code)
         print_dst_path
         call remark (": non-empty directory"s)
         code = ERR
         }
      else {
         select (src_type)
            when (SAM_TYPE, DAM_TYPE)
               call cpfil$ (src_fd, dst_fd, code)
            when (SAMSEG_TYPE, DAMSEG_TYPE)
               call cpseg$ (src_fd, dst_fd, code)
         call prwf$$ (KTRNC, dst_fd, intl (0), 0, intl (0), 0, junk)
         call srch$$ (KCLOS, 0, 0, dst_fd, 0, junk)
         if (code == ERR) {
            print_dst_path
            call remark (": copy incomplete"s)
            }
         else {
            set_attributes
            code = 0
            }
         }

      }


# abend --- set error code and die

   procedure abend {

      call seterr (1000)   # set a fatal error code
      stop

      }


# save_entry --- squirrel away the current entry

   procedure save_entry {

      call move$ (entry, entry2, MAXDIRENTRY)

      }


# restore_entry --- restore a previously saved entry

   procedure restore_entry {

      call move$ (entry2, entry, MAXDIRENTRY)

      }


DB procedure print_current_dir {
DB
DB    local path
DB    character path (MAXPATH)
DB    integer gcdir$
DB
DB    if (gcdir$ (path) ~= ERR)
DB       call print (ERROUT, "current ufd = '*s'*n"s, path)
DB    }


# construct_dest_name --- append source name to destination path

   procedure construct_dest_name {

      i = length (dst_path) + 1
      if (i > 1 && i < MAXPATH) {
         dst_path (i) = '/'c
         i += 1
         }
      call upkfn$ (entry (E_NAME), 32, dst_path (i), MAXPATH - i + 1)

      }


# add_password --- append password to destination path

   procedure add_password {

      i = length (dst_path) + 1
      dst_path (i) = ':'c
      if (GaTech && npw (1) ~= 0)
         call upkfn$ (npw, 6, dst_path (i + 1), MAXPATH - i)
      elif (~ GaTech && opw (1) ~= 0)
         call upkfn$ (opw, 6, dst_path (i + 1), MAXPATH - i)
      else
         dst_path (i) = EOS

      }

   stop
   end
