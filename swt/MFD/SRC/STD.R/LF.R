# lf --- list files

   include LIBRARY_DEFS
   include PRIMOS_KEYS
   include PRIMOS_ERRD

   include "lf_def.r.i"
   include "lf_com.r.i"

   integer argp, code, save_argp
   integer getarg, follow, tscan$, finfo$, compare, expand, equal, ctoi
   pointer entry
   pointer dsget

   procedure do_dir forward
   procedure do_file forward
   procedure end_line forward
   procedure enter_entry forward
   procedure get_options forward
   procedure get_owner forward
   procedure get_size forward
   procedure print_tree forward

   get_options                   # parse command line options
   call dsinit (MEMSIZE)         # initialize dynamic storage
   Root = LAMBDA                 # sort tree is initially empty
   Col = 1                       # next output Column

   save_argp = argp
   for (Pl = getarg (argp, Parent, MAXPATH); Pl ~= EOF;
         {argp += 1; Pl = getarg (argp, Parent, MAXPATH)}) {
      call at$hom (code)
      if (Opts (DIRECTORY)
            || follow (Parent, 0) == ERR)
         do_file
      else
         do_dir
      }

   if (argp == save_argp) {      # no args, list current directory
      Parent (1) = EOS
      Pl = 0
      do_dir
      }


   # do_dir --- print contents of current directory

      procedure do_dir {

         local name
         character name (65)

         if (Opts (LABEL))
            call print (STDOUT, "-- *s --*n"s, Parent)
         Level = 0
         repeat {
            entry = dsget (NODESIZE)
            select (tscan$ (Parent, E_ecw (entry),
                              Level, Max_level, PREORDER))
               when (EOF) {
                  call dsfree (entry)
                  break
                  }
               when (OK) {
                  if ( ~Opts (ALL_FILES)
                        && rs (E_name (entry), 8) == '.'c) {
                     call dsfree (entry)
                     next
                     }
                  if (Opts (WORDS))
                     get_size
                  if (Opts (OWNER) || Opts (PASSWORD))
                     get_owner
                  if (Opts (SUBTREE) || Opts (NOSORT)) {
                     if (Opts (FULLNAME))
                        call put_entry (entry, Parent)
                     else {
                        call upkfn$ (E_name (entry), 32, name, 65)
                        call put_entry (entry, name)
                        }
                     call dsfree (entry)
                     }
                  else
                     enter_entry
                  }
            else
               call dsfree (entry)
            }  # repeat

         if (~ Opts (SUBTREE)) {
            if (~ Opts (NOSORT))
               print_tree
            end_line
            }

         }


   # do_file --- print information for a single file

      procedure do_file {

         local attach, code, name
         integer attach, code
         character name (65)

         entry = dsget (NODESIZE)
         if (finfo$ (Parent, E_ecw (entry), attach) == OK) {
            if (Opts (WORDS))
               get_size
            if (Opts (OWNER))
               get_owner
            if (Opts (FULLNAME))
               call put_entry (entry, Parent)
            else {
               call upkfn$ (E_name (entry), 32, name, 65)
               call put_entry (entry, name)
               }
            end_line
            if (attach ~= NO)
               call at$hom (code)
            }
         else
            call print (ERROUT, "*s: not found*n"s, Parent)

         call dsfree (entry)

         }


   # end_line --- terminate partially filled output line

      procedure end_line {

         if (Col > 1) {
            call putch (NEWLINE, STDOUT)
            Col = 1
            }

         }


   # enter_entry --- insert entry into tree

      procedure enter_entry {

         local p, last_p, use_left
         pointer p, last_p
         bool use_left

         E_llink (entry) = LAMBDA
         E_rlink (entry) = LAMBDA

         if (Root == LAMBDA)
            Root = entry
         else {
            for (p = Root; p ~= LAMBDA; ) {
               last_p = p
               use_left = (compare (Mem (entry + Keypos),
                                    Mem (p + Keypos), Keylen) < 0)
               if (Opts (REVERSE))
                  use_left = ~ use_left
               if (use_left)
                  p = E_llink (p)
               else
                  p = E_rlink (p)
               }
            if (use_left)
               E_llink (last_p) = entry
            else
               E_rlink (last_p) = entry
            }

         }


   # get_options --- process option flags for lf

      procedure get_options {

         local i, key, kp, kl, arg
         character arg (MAXLINE)
         integer kp, kl, i
         bool key

         Opts (ALL_FILES)   = FALSE # -a
         Opts (COLUMNAR)    = FALSE # -c
         Opts (DIRECTORY)   = FALSE # -d
         Opts (DUMPED)      = FALSE # -u
         Opts (FILETYPE)    = FALSE # -t
         Opts (FULLNAME)    = FALSE # -f
         Opts (LABEL)       = FALSE # -v
         Opts (LOCK)        = FALSE # -k
         Opts (OWNER)       = FALSE # -o
         Opts (PASSWORD)    = FALSE # -q
         Opts (PROTECTIONS) = FALSE # -p
         Opts (REVERSE)     = FALSE # -r
         Opts (SUBTREE)     = FALSE # -s
         Opts (TIMEDATE)    = FALSE # -m
         Opts (WORDS)       = FALSE # -w
         Opts (NOSORT)      = FALSE # -n

         if (expand ("=GaTech="s, arg, MAXLINE) == ERR
               || equal (arg, "yes"s) == NO)
            Opts (SECURITY) = FALSE
         else
            Opts (SECURITY) = TRUE

         Max_level = 1
         Keypos = NAMEPOS
         Keylen = 16

         for (argp = 1; getarg (argp, arg, MAXLINE) ~= EOF; argp += 1) {
            if (arg (1) ~= '-'c)
               break
            for (i = 2; arg (i) ~= EOS; i += 1) {
               if (arg (i) == '/'c || arg (i) == '\'c) {
                  if (arg (i + 1) ~= EOS) {
                     Opts (REVERSE) = (arg (i) == '\'c)
                     i += 1
                     key = TRUE
                     }
                  else
                     break
                  }
               else
                  key = FALSE
               kp = NAMEPOS
               kl = 16

               select (arg (i))
                  when ('a'c)
                     Opts (ALL_FILES) = TRUE
                  when ('c'c)
                     Opts (COLUMNAR) = TRUE
                  when ('d'c)
                     Opts (DIRECTORY) = TRUE
                  when ('f'c)
                     Opts (FULLNAME) = TRUE
                  when ('k'c)
                     Opts (LOCK) = TRUE
                  when ('l'c) {
                     Opts (FILETYPE)    = TRUE
                     Opts (PROTECTIONS) = TRUE
                     Opts (TIMEDATE)    = TRUE
                     Opts (LOCK)        = TRUE
                     Opts (DUMPED)      = TRUE
                     Opts (WORDS)       = TRUE
                     Opts (OWNER)       = TRUE
                     }
                  when ('m'c) {
                     Opts (TIMEDATE) = TRUE
                     kp = DTMPOS
                     kl = 2
                     }
                  when ('n'c)
                     Opts (NOSORT) = TRUE
                  when ('o'c) {
                     Opts (OWNER) = TRUE
                     kp = OWNERPOS
                     kl = 3
                     }
                  when ('p'c) {
                     Opts (PROTECTIONS) = TRUE
                     kp = PROPOS
                     kl = 1
                     }
                  when ('q'c)
                     Opts (PASSWORD) = TRUE
                  when ('r'c)
                     Opts (REVERSE) = TRUE
                  when ('s'c) {
                     Opts (SUBTREE) = TRUE
                     i += 1
                     Max_level = ctoi (arg, i)
                     i -= 1
                     }
                  when ('t'c)
                     Opts (FILETYPE) = TRUE
                  when ('u'c)
                     Opts (DUMPED) = TRUE
                  when ('v'c)
                     Opts (LABEL) = TRUE
                  when ('w'c) {
                     Opts (WORDS) = TRUE
                     kp = SIZEPOS
                     kl = 2
                     }

               if (key) {
                  Keypos = kp
                  Keylen = kl
                  }
               }
            }

         if (Max_level <= 0)
            Max_level = MAX_INTEGER

         }


   # get_owner --- determine owner of a directory

      procedure get_owner {

         local i
         integer i

         if (and (E_filtyp (entry), 7) == 4) {
            call gpas$$ (E_name (entry), 32,
                  E_owner (entry), E_passwd (entry), code)
            if (code ~= 0)
               do i = 0, 2; {
                  E_owner (entry + i) = "  "
                  E_passwd (entry + i) = "  "
                  }
            }
         else
            do i = 0, 2; {
               E_owner (entry + i) = "  "
               E_passwd (entry + i) = "  "
               }

         }


   # get_size --- determine size of named file

      procedure get_size {

         local fd, typ, code
         integer fd, typ, code

         call srch$$ (KREAD + KGETU, E_name (entry), 32, fd, typ, code)
         if (code == 0) {
            call fsize (fd, and (typ, 7), E_fsize (entry))
            call srch$$ (KCLOS, 0, 0, fd, typ, code)
            }
         else {
            E_fsize (entry) = 0
            E_fsize1 (entry) = 0
            }
         }


   # print_tree --- do inorder traversal of tree, printing each node

      procedure print_tree {

         local i
         integer i

         if (Root ~= LAMBDA) {
            if (Opts (FULLNAME)) {
               i = Pl + 1
               if (Pl > 0 && Parent (Pl) ~= '\'c) {
                  Parent (i) = '/'c
                  i += 1
                  }
               }
            else
               i = 1
            call print_sub_tree (Root, Parent, i)
            }

         }


   stop
   end


# compare --- compare strings of length len

   integer function compare (s1, s2, len)
   integer s1 (ARB), s2 (ARB), len

   integer i

   compare = 0
   do i = 1, len; {
      compare = rt (intl (s1 (i)), 16) - rt (intl (s2 (i)), 16)
      if (compare ~= 0)
         break
      }

   return
   end


# fsize --- find length of a file

   subroutine fsize (fd, typ, size)
   integer fd, typ
   longint size

   integer rc, entrya, entryb

   size = 0
   if (typ == 2 || typ == 3) {
      call sgdr$$ (KGOND, fd, entrya, entryb, rc)
      if (rc == 0)
         size = entryb * 2
      }
   else {
      if (typ == 4) {
         repeat call rden$$ (KUPOS, fd, loc (0), 0, 0, 100000, 0, rc)
            until (rc ~= 0)
         }
      else {
         repeat call prwf$$ (KPOSN, fd, loc (0), 0, 100000, 0, rc)
            until (rc ~= 0)
         }
      if (rc ~= EEOF)
         return

      if (typ == 4) {
         call rden$$ (KGPOS, fd, loc (0), 0, 0, size, 0, rc)
         size += 1
         }
      else
         call prwf$$ (KRPOS, fd, loc (0), 0, size, 0, rc)
      }

   return
   end


# print_sub_tree --- handle a single sub_tree

   subroutine print_sub_tree (ptr, prefix, i)
   pointer ptr
   character prefix (ARB)
   integer i

   include "lf_com.r.i"

   if (E_llink (ptr) ~= LAMBDA)    # do left-hand sub-tree
      call print_sub_tree (E_llink (ptr), prefix, i)

   call upkfn$ (E_name (ptr), 32, prefix (i), MAXPATH - i + 1)
   call put_entry (ptr, prefix)

   if (E_rlink (ptr) ~= LAMBDA)    # do right-hand sub-tree
      call print_sub_tree (E_rlink (ptr), prefix, i)

   call dsfree (ptr)    # release space used by this subtree
   ptr = LAMBDA

   return
   end


# put_entry --- print a file entry with all requested information

   subroutine put_entry (entry, name)
   pointer entry
   character name (ARB)

   include "lf_com.r.i"

   integer i, j, k, tmp, tmp2
   integer scopy, encode, length
   character buf (MAXLINE)

   k = 1    # next free position in buf


   ### Build file type string if requested:

   if (Opts (FILETYPE)) {
      if (and (E_filtyp (entry), SPECIAL_FILE) ~= 0)
         call scopy ("spc "s, 1, buf, k)
      else
         select (and (E_filtyp (entry), 7))
            when (0) # SAM file
               call scopy ("sam "s, 1, buf, k)
            when (1) # DAM file
               call scopy ("dam "s, 1, buf, k)
            when (2) # SAM segment directory
               call scopy ("sgs "s, 1, buf, k)
            when (3) # DAM segment directory
               call scopy ("sgd "s, 1, buf, k)
            when (4) # UFD
               call scopy ("ufd "s, 1, buf, k)
            when (6) # Access Category
               call scopy ("act "s, 1, buf, k)
         else     # unknown type
            call scopy ("??? "s, 1, buf, k)
      k += 4
      }


   ### Build protections string if requested:

   if (Opts (PROTECTIONS)) {
      call scopy ("   /   "s, 1, buf, k)
      tmp = E_protec (entry)
      i = k + 2
      if (and (tmp, 8r3400) == 8r3400)
         buf (i) = 'a'c
      else {
         if (and (tmp, 8r400) ~= 0) {
            buf (i) = 'r'c
            i -= 1
            }
         if (and (tmp, 8r1000) ~= 0) {
            buf (i) = 'w'c
            i -= 1
            }
         if (and (tmp, 8r2000) ~= 0)
            buf (i) = 't'c
         }
      i = k + 4
      if (and (tmp, 7) == 7)
         buf (i) = 'a'c
      else {
         if (and (tmp, 4) ~= 0) {
            buf (i) = 't'c
            i += 1
            }
         if (and (tmp, 2) ~= 0) {
            buf (i) = 'w'c
            i += 1
            }
         if (and (tmp, 1) ~= 0)
            buf (i) = 'r'c
         }
      buf (k + 7) = ' 'c
      k += 8
      }


   ### Build modification time/date string if requested:

   if (Opts (TIMEDATE)) {
      tmp = E_datmod (entry)
      tmp2 = E_timmod (entry)
      k += encode (buf (k), 19, "*2,,0u*i/*i/*i *i:*i:*i "s,
            and (rs (tmp, 5), 8r17),   # month
            and (tmp, 8r37),           # day
            rs (tmp, 9),               # year
            tmp2 / 900,                # hours
            mod (tmp2 / 15, 60),       # minutes
            mod (tmp2, 15) * 4)        # seconds
      }


   ### Build owner string if requested:

   if (Opts (OWNER))
      k += encode (buf (k), 8, "*7,6h"s, E_owner (entry))


   ### Build password string if requested:

   if (Opts (PASSWORD))
      k += encode (buf (k), 8, "*7,6h"s, E_passwd (entry))


   ### Build file size string if requested:

   if (Opts (WORDS))
      k += encode (buf (k), 10, "*8l "s, E_fsize (entry))


   ### Build read/write lock string if requested:

   if (Opts (LOCK)) {
      select (and (E_filtyp (entry), RWLOCK))
         when (0)          # default
            call scopy ("sys "s, 1, buf, k)
         when (LOCK1)      # n readers or 1 writer
            call scopy ("n-1 "s, 1, buf, k)
         when (LOCK2)      # n readers and 1 writer
            call scopy ("n+1 "s, 1, buf, k)
      else                 # n readers and n writers
         call scopy ("n+n "s, 1, buf, k)
      k += 4
      }


   ### Indicate status of "dumped" bit if requested:

   if (Opts (DUMPED)) {
      if (and (E_filtyp (entry), DUMPED_BIT) ~= 0)
         buf (k) = 'd'c
      else
         buf (k) = ' 'c

      if (and (E_filtyp (entry), MODIFIED_BIT) ~= 0)
         buf (k + 1) = 'm'c
      else
         buf (k + 1) = ' 'c

      buf (k + 2) = ' 'c
      k += 3
      }


   ### Include length of name in buffer size:

   buf (k) = EOS
   k += length (name)


   ### Now print out requested information about the file:

   if (~ Opts (COLUMNAR)) {
      if (Opts (SUBTREE)) {
         for (i = 1; i < Level; i += 1)        # do indentation
            call putlin ("|  "s, STDOUT)
         call putlin (buf, STDOUT)
         call putlin (name, STDOUT)
         call putch (NEWLINE, STDOUT)
         }
      else {
         if (Col > 1) {
            j =           Col _  # current cursor position
              +             1 _  # one blank between file names
              + TAB_WIDTH - 1    # to get to or beyond next tab stop

            j -= mod (j, TAB_WIDTH) - 1   # back to the tab stop

            if (j + k - 1 <= OUTPUT_WIDTH) {
               while (Col < j) {
                  call putch (' 'c, STDOUT)
                  Col += 1
                  }
               }
            else {
               call putch (NEWLINE, STDOUT)
               Col = 1
               }
            }
         call putlin (buf, STDOUT)
         call putlin (name, STDOUT)
         Col += k - 1
         }
      }
   else {   # Opts (COLUMNAR)
      call putlin (buf, STDOUT)
      call putlin (name, STDOUT)
      call putch (NEWLINE, STDOUT)
      }

   return
   end
