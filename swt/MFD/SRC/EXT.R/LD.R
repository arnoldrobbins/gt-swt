# ld --- invoke a PRIMOS loader to create an executable file

   include ARGUMENT_DEFS

   define (NEXT_ARG_IS_NOT_FILE,
         getarg (ap + 1, arg, MAXLINE) == EOF || arg (1) == '-'c)

   ARG_DECL

   integer ap, term_out, init_out, main_out
   integer getarg, mapdn, parscl, length, index

   file_des fd
   file_des mktemp

   character arg (MAXLINE), output_file (MAXLINE), file (MAXLINE)
   character segment_name (MAXLINE)

   string default_segment_name ".."
   string segment_no "4000"
   string default_segment_no "4000"
   string common_segment "4001"
   string default_common_segment "4001"
   string default_pl1_common_segment "4000"
   string swt_cm_loc "4040 10000"
   string swt_tp_loc "2030 120000"

   data term_out /NO/, init_out /NO/, main_out /NO/, fd /ERR/

   procedure bomb forward
   procedure put_init_commands forward
   procedure put_load_main forward
   procedure put_term_commands forward
   procedure create_loader_commands forward

   if (parscl ("[-abdfhnpuvw] [-o<req str>] -s<ign> -m<ign> -l<ign>" _
           "-i<ign> -t<ign> -g<ign> -e<ign> -c<ign>"s, ARG_BUF) == ERR)
      bomb

   if (ARG_PRESENT (p) || ARG_PRESENT (a)) {
      call scopy (default_pl1_common_segment, 1, default_common_segment, 1)
      call scopy (default_pl1_common_segment, 1, common_segment, 1)
      }

   call ctoc (default_segment_name, segment_name, MAXLINE)

   fd = mktemp (READWRITE)
   if (fd == ERR)
      call error ("can't open temporary file"p)

   create_loader_commands

   call rewind (fd)

   call print (STDOUT, "swtseg*n"p)
   if (ARG_PRESENT (d)) {
      call print (STDOUT, "vl *s*n"p, output_file)
      call fcopy (fd, STDOUT)
      call print (STDOUT, "q*n"p)
      }
   else {
      call print (STDOUT, "vl #*n"s)
      call fcopy (fd, STDOUT)
      call print (STDOUT, "re*nsh*n*s*ndelete*nq*n"p, segment_name)
      if (index (output_file, '>'c) == 0)
         call print (STDOUT, "cname *s4000 *s*n"p, segment_name, output_file)
      else
         call print (STDOUT, "copy *s4000 *s -delete -nq*n"s,
                                 segment_name, output_file)
      }

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
            if (ARG_PRESENT (d))
               call print (fd, "lo *s*n"p, file)
            else
               call print (fd, "s/lo *s 0 *s *s*n"p,
                           file, segment_no, segment_no)
            }

         else if (arg (3) ~= EOS)        # this is an ill-formatted option
            bomb

         else
            select (mapdn (arg (2)))
               when ('s'c) {
                  if (NEXT_ARG_IS_NOT_FILE)
                     bomb
                  ap += 1
                  call print (fd, "*s*n"p, arg)
                  }

               when ('l'c) {
                  if (NEXT_ARG_IS_NOT_FILE)
                     call scopy ("vswtlb"s, 1, arg, 1)
                  else
                     ap += 1
                  put_load_main
                  call make_lib_name (arg, file)
                  if (ARG_PRESENT (d))
                     call print (fd, "lo *s*n"p, file)
                  else
                     call print (fd, "s/lo *s 0 *s *s*n"p,
                                     file, segment_no, segment_no)
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
                  call print (fd, "ma *s*n"p, file)
                  }

               when ('i'c)
                  put_init_commands

               when ('t'c)
                  put_term_commands

               when ('g'c) {
                  if (NEXT_ARG_IS_NOT_FILE)
                     arg (1) = EOS
                  else
                     ap += 1
                  if (arg (1) == EOS)
                     call ctoc (default_segment_name, segment_name, MAXLINE)
                  elif (length (arg) > 28) {
                     call rmtemp (fd)
                     call error ("string following -g must be 28 chars long or less"p)
                     }
                  else
                     call ctoc (arg, segment_name, MAXLINE)
                  }

               when ('e'c) {
                  if (NEXT_ARG_IS_NOT_FILE)
                     arg (1) = EOS
                  else
                     ap += 1
                  if (arg (1) == EOS)
                     call ctoc (default_segment_no, segment_no, 5)
                  else
                     call ctoc (arg, segment_no, 5)
                  }

               when ('c'c) {
                  if (NEXT_ARG_IS_NOT_FILE)
                     arg (1) = EOS
                  else
                     ap += 1
                  if (arg (1) == EOS)
                     call ctoc (default_common_segment, common_segment, 5)
                  else
                     call ctoc (arg, common_segment, 5)
                  call print (fd, "co ab *s*n"p, common_segment)
                  }

            else
               bomb
         }  # for ...

      if (~ ARG_PRESENT (n))
         put_term_commands

      if (ARG_PRESENT (u))
         call print (fd, "ma 6*n"p)

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

      if (~ ARG_PRESENT (d))
         call print (fd, "co ab *s*n"s, common_segment)
      if (expand ("=cm_loc="s, cm_loc, 32) == ERR)
         call scopy (swt_cm_loc, 1, cm_loc, 1)
      if (expand ("=tp_loc="s, tp_loc, 32) == ERR)
         call scopy (swt_tp_loc, 1, tp_loc, 1)
      call print (fd, "sy swt$cm *s*nsy swt$tp *s*n"s, cm_loc, tp_loc)
      if (~ ARG_PRESENT (h))
         call print (fd, "mi*n"p)
      }


   # put_load_main --- output the load of the C main program

      procedure put_load_main {

      if (ARG_PRESENT (b) && main_out == NO) {
         call make_lib_name ("c$main"s, file)
         if (ARG_PRESENT (d))
            call print (fd, "lo *s*n"p, file)
         else
            call print (fd, "s/lo *s 0 *s *s*n"p,
                            file, segment_no, segment_no)
         main_out = YES
         }

      if (ARG_PRESENT (w) && main_out == NO) {
         call make_lib_name ("ccmain.bin"s, file)
         if (ARG_PRESENT (d))
            call print (fd, "lo *s*n"p, file)
         else
            call print (fd, "s/lo *s 0 *s *s*n"p,
                            file, segment_no, segment_no)
         main_out = YES
         }
      }


   # put_term_commands --- output the swt program library requests

      procedure put_term_commands {

      if (term_out == NO) {

         if (ARG_PRESENT (p))
            if (ARG_PRESENT (d))
               call print (fd, "li pl1glb*n"p)
            else
               call print (fd, "s/li pl1glb 0 *s *s*n"p,
                               segment_no, segment_no)

         if (ARG_PRESENT (a))
            if (ARG_PRESENT (d))
               call print (fd, "li paslib*n"p)
            else
               call print (fd, "s/li paslib 0 *s *s*n"p,
                               segment_no, segment_no)

         if (ARG_PRESENT (b)) {
            call make_lib_name ("ciolib"s, file)
            if (ARG_PRESENT (d))
               call print (fd, "lo *s*n"s, file)
            else
               call print (fd, "s/lo *s 0 *s *s*n"s, file,
                                    segment_no, segment_no)
            call make_lib_name ("vswtmath"s, file)
            if (ARG_PRESENT (d))
               call print (fd, "lo *s*n"s, file)
            else
               call print (fd, "s/lo *s 0 *s *s*n"s, file,
                                    segment_no, segment_no)
            call make_lib_name ("vshlib"s, file)
            if (ARG_PRESENT (d))
               call print (fd, "lo *s*n"s, file)
            else
               call print (fd, "s/lo *s 0 *s *s*n"s, file,
                                    segment_no, segment_no)
            }

         if (ARG_PRESENT (w)) {
            if (ARG_PRESENT (d))
               call print (fd, "li cclib*n"s, file)
            else
               call print (fd, "s/li cclib 0 *s *s*n"s, file,
                                    segment_no, segment_no)
            }

         call make_lib_name ("vswtlb"s, file)
         if (ARG_PRESENT (d))
            call print (fd, "lo *s*nli*n"p, file)
         else
            call print (fd, "s/lo *s 0 *s *s*ns/li 0 *s *s*n"p,
                  file, segment_no, segment_no, segment_no, segment_no)
         }
      term_out = YES

      }


   # bomb --- print usage message and quit

      procedure bomb {

      if (fd ~= ERR)
         call rmtemp (fd)

      call remark ("Usage: ld -{a|b|d|f|h|n|p|u|w} [-o <output file>]"p)
      call remark ("          { <binary file> | -m [<map opt>] | -s <command>"p)
      call remark ("             | -l [<library>] | -i | -t | -g <seg name>"p)
      call remark ("             | -e <segment> | -c <segment> }"p)
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
