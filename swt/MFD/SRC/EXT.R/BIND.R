#  bind --- invoke BIND to create an Executable Program Format file

   include ARGUMENT_DEFS

   define (NEXT_ARG_IS_NOT_FILE,
         getarg (ap + 1, arg, MAXLINE) == EOF || arg (1) == '-'c)

   ARG_DECL

   integer ap, term_out, init_out, main_out
   integer getarg, mapdn, parscl, length, index

   file_des fd
   file_des mktemp

   character arg (MAXLINE), output_file (MAXLINE), file (MAXLINE)

   string swt_cm_loc "4040/10000"
   string swt_tp_loc "2030/120000"

   data term_out /NO/, init_out /NO/, main_out /NO/, fd /ERR/

   procedure bomb forward
   procedure put_init_commands forward
   procedure put_load_main forward
   procedure put_term_commands forward
   procedure create_loader_commands forward

   if (parscl ("[-abdfnpvu] [-o<req str>] -s<ign> -m<ign> -l<ign>" _
           "-i<ign> -t<ign>"s, ARG_BUF) == ERR)
      bomb

   fd = mktemp (READWRITE)
   if (fd == ERR)
      call error ("can't open temporary file"p)

   create_loader_commands

   call rewind (fd)

   call print (STDOUT, "bind*n"p)
   call fcopy (fd, STDOUT)
   call print (STDOUT, "file ..run*n"s)

   if (index (output_file, '>'c) ~= 0)
      call print (STDOUT, "copy ..run *s -delete -nq*n"s, output_file)
   else
      call print (STDOUT, "cname ..run *s*n"s, output_file)

   call rmtemp (fd)
   call remove (ARG_TEXT (o))

   stop


   # create_loader_commands --- devise and output the seg loader commands

      procedure create_loader_commands {

      if (~ ARG_PRESENT (n))
         put_init_commands

      for (ap = 1; getarg (ap, arg, MAXLINE) ~= EOF; ap += 1) {

         if (arg (1) ~= '-'c) {
            if (ARG_TEXT (o) == EOS) {
               call suffix (arg, ".b"s, file, ".o"s)
               ARG_DEFAULT_STR (o, file)
               }
            put_load_main
            call mktree (arg, file)
            call print (fd, "lo *s*n"s, file)
            }

         else if (arg (3) ~= EOS)        # this is an ill-formatted option
            bomb

         else
            select (mapdn (arg (2)))
               when ('s'c) {
                  if (NEXT_ARG_IS_NOT_FILE)
                     bomb
                  ap += 1
                  call print (fd, "*s*n"s, arg)
                  }

               when ('l'c) {
                  if (NEXT_ARG_IS_NOT_FILE)
                     call scopy ("vswtlb"s, 1, arg, 1)
                  else
                     ap += 1
                  put_load_main
                  call make_lib_name (arg, file)
                  call print (fd, "lo *s*n"s, file)
                  }

               when ('m'c) {
                  if (NEXT_ARG_IS_NOT_FILE)
                     arg (1) = EOS
                  else
                     ap += 1
                  if (arg (1) == EOS) {
                     call suffix (ARG_TEXT (o), ".o"s, file, ".m"s)
                     call mktree (file, file)
                     }
                  else
                     call mktree (arg, file)
                  call print (fd, "ma *s*n"s, file)
                  }

               when ('i'c)
                  put_init_commands

               when ('t'c)
                  put_term_commands

            else
               bomb
         }  # for ...

      if (~ ARG_PRESENT (n))
         put_term_commands

      if (ARG_PRESENT (u))
         call print (fd, "ma -undefined*n"s)

      if (ARG_PRESENT (f)) {
         call suffix (ARG_TEXT (o), ".o"s, file, ".m"s)
         call mktree (file, file)
         call print (fd, "ma *s*n"p, file)
         }

      call mktree (ARG_TEXT (o), output_file)

      }


   # put_init_commands --- output the swt program seg definitions

      procedure put_init_commands {

      local cm_loc, tp_loc
      character cm_loc (32), tp_loc (32)
      integer expand

      if (expand ("=cm_loc="s, cm_loc, 32) == ERR)
         call scopy (swt_cm_loc, 1, cm_loc, 1)
      if (expand ("=tp_loc="s, tp_loc, 32) == ERR)
         call scopy (swt_tp_loc, 1, tp_loc, 1)
      call print (fd,
         "sy swt$cm *s*nsy swt$tp *s*n"s,
          cm_loc, tp_loc)
      }


   # put_load_main --- output the load of the C main program

      procedure put_load_main {

      if (ARG_PRESENT (b) && main_out == NO) {
         call make_lib_name ("c$main"s, file)
         call print (fd, "lo *s*n"s, file)
         main_out = YES
         }

      if (ARG_PRESENT (w) && main_out == NO) {
         call print (fd, "lo lib>ccmain*n"s)
         main_out = YES
         }
      }


   # put_term_commands --- output the swt program library requests

      procedure put_term_commands {

      if (term_out == NO) {

         if (ARG_PRESENT (p))
            call print (fd, "li pl1glb*n"s)

         if (ARG_PRESENT (a))
            call print (fd, "li paslib*n"s)

         if (ARG_PRESENT (b)) {
            call make_lib_name ("ciolib"s, file)
            call print (fd, "lo *s*n"s, file)

            call make_lib_name ("vswtmath"s, file)
            call print (fd, "lo *s*n"s, file)

            call make_lib_name ("vshlib"s, file)
            call print (fd, "lo *s*n"s, file)
            }

         if (ARG_PRESENT (w))
            call print (fd, "li cclib*n"s)

         call make_lib_name ("vswtlb"s, file)
         call print (fd, "lo *s*nli*n"s, file)

         if (ARG_PRESENT (d))
            call print (fd, "dynt -all*n"s)
         }
      term_out = YES

      }


   # bomb --- print usage message and quit

      procedure bomb {

      if (fd ~= ERR)
         call rmtemp (fd)

      call remark ("Usage: bind -{a|b|f|n|p} [-o <output file>]"p)
      call remark ("          { <binary file> | -m [<map opt>] | -s <command>"p)
      call remark ("             | -l [<library>] | -i | -t"p)
      call seterr (1000)
      stop

      }

   end



# mktree --- convert path name to PRIMOS tree name, add ".o" suffix

   subroutine mktree (str, out)
   character str (ARB), out (ARB)

   integer i
   integer mktr$, index
   character in (MAXLINE)

   call expand (str, in, MAXLINE)

   if (index (in, '/'c) == 0 && index (in, '\'c) == 0) {
      call scopy (in, 1, out, 1)
      return
      }

   out (1) = "'"c
   i = mktr$ (in, out (2)) + 2  # convert pathname to treename
   out (i) = "'"c
   out (i + 1) = EOS

   return
   end


# make_lib_name --- add the library directory name to a file name

   subroutine make_lib_name (name, file)
   character name (ARB), file (ARB)

   character str (MAXLINE)

   call encode (str, MAXLINE, "=newlib=/*s"s, name)
   call mktree (str, file)

   return
   end


# suffix --- copy src to dest replacing suffix

   subroutine suffix (src, ssuff, dest, dsuff)
   character src (ARB), ssuff (ARB), dest (ARB), dsuff (ARB)

   character suff (MAXLINE)

   integer length, equal

   call stake (src, suff, -length (ssuff))
   if (equal (suff, ssuff) == YES)
      call sdrop (src, dest, -length (suff))
   else
      call scopy (src, 1, dest, 1)
   call scopy (dsuff, 1, dest, length (dest) + 1)

   return
   end
