# vcg --- 64V-mode code generator

   include VCG_COMMON

   ARG_DECL

   integer word
   integer from_stdin      # are we reading from stdin?
   integer getlin, get

   character line (MAXLINE), filename (MAXPATH), module_name (MAXLINE)

   file_des open, Obj_file

   PARSE_COMMAND_LINE ("[-m<rs>][-s<os>][-b<os>]"s,
      "Usage: vcg [-m <file_basename>] [-b [<obj_file>]] [-s [<asm_file>]]"p)

   # set up proper defaults for output file names

   if (~ ARG_PRESENT (m) && ~ ARG_PRESENT (s) && ~ ARG_PRESENT (b))
      call error ("Vcg: input is STDIN, but no object file named."p)

   if (ARG_PRESENT (m)) {  # module name given
      call ctoc (ARG_TEXT (m), module_name, MAXLINE)
      from_stdin = NO
      
      # now set up default file names
      if (ARG_PRESENT (s)) {
         call encode (filename, MAXLINE, "*s.s"s, module_name)
         ARG_DEFAULT_STR (s, filename)
         }

      if (ARG_PRESENT (b)) {
         call encode (filename, MAXLINE, "*s.b"s, module_name)
         ARG_DEFAULT_STR (b, filename)
         }

      filename (1) = EOS
      }
   else {
      from_stdin = YES
      
      if (ARG_PRESENT (b)) {  # test for file name given
         call ctoc (ARG_TEXT (b), filename, MAXLINE)
         if (filename (1) == EOS)   # no name, so barf
            call error ("Vcg: input is STDIN, but no object file named."p)
         # else
            # file name is there, leave alone
         }

      if (ARG_PRESENT (s))
         ARG_DEFAULT_STR (s, "/dev/stdout1"s)   # will be tested against later
      }

   Errors = 0

   Emit_Obj = YES    # default action -- binary only

   if (ARG_PRESENT(s)) {
      Emit_PMA = YES
      Emit_Obj = NO
      }

   if (ARG_PRESENT(b))
      Emit_Obj = YES    # in case it was just turned off

   if (from_stdin == YES) {
      Stream_1 = STDIN1
      Stream_2 = STDIN2
      Stream_3 = STDIN3

      if (Emit_Obj == YES) {
         call ctoc (ARG_TEXT (b), filename, MAXLINE)  # has already been set up
         Obj_file = open (filename, WRITE)
         if (Obj_file == ERR)
            call cant (filename)

         call trunc (Obj_file)
         call init_otg (Obj_file)
         }

      if (Emit_PMA == YES)    {  # must have seen "-s"
         if (equal (ARG_TEXT (s), "/dev/stdout1"s) == YES)
            Outfile = STDOUT1
         else {
            call ctoc (ARG_TEXT (s), filename, MAXLINE)  # also already set up
            Outfile = open (filename, WRITE)
            if (Outfile == ERR)
               call cant (filename)
            call trunc (Outfile)
            }
         }
      }
   else {      # a module name specified
      call encode (filename, MAXLINE, "*s.ct1"s, module_name)
      Stream_1 = open (filename, READ)
      if (Stream_1 == ERR)
         call cant (filename)

      call encode (filename, MAXLINE, "*s.ct2"s, module_name)
      Stream_2 = open (filename, READ)
      if (Stream_2 == ERR)
         call cant (filename)

      call encode (filename, MAXLINE, "*s.ct3"s, module_name)
      Stream_3 = open (filename, READ)
      if (Stream_3 == ERR)
         call cant (filename)

      if (Emit_Obj == YES) {
         if (ARG_PRESENT (b))
            call ctoc (ARG_TEXT (b), filename, MAXLINE)
         else
            call encode (filename, MAXLINE, "*s.b"s, module_name)
         Obj_file = open (filename, WRITE)
         if (Obj_file == ERR)
            call cant (filename)

         call trunc (Obj_file)
         call init_otg (Obj_file)
         }

      if (Emit_PMA == YES)    {
         if (~ ARG_PRESENT (s) || equal (ARG_TEXT (s), "/dev/stdout1"s) == YES)
            Outfile = STDOUT1
         else {
            call ctoc (ARG_TEXT (s), filename, MAXLINE)
            Outfile = open (filename, WRITE)
            if (Outfile == ERR)
               call cant (filename)
            call trunc (Outfile)
            }
         }
      }

   Infile = Stream_1
   while (get (word) == MODULE_OP) {
      call module
      Infile = Stream_1
      }

   if (word ~= 0 && word ~= NULL_OP)
      call warning ("expected MODULE in ENT stream, found *i*n"p, word)

   if (getlin (line, Stream_1) ~= EOF)
      call warning ("Not all of IMF consumed*n"p)

   if (Errors ~= 0)
      call error ("Code generation terminated abnormally"p)

   stop
   end
