# define --- string replacement processor

   include ARGUMENT_DEFS
   include "define_def.r.i"
   include DEFINE_COMMON

   integer get_token,            # returns the next token from input
           t_type,               # the type returned by get_token
           equal,                # system function
           lookup,               # system function
           info (INFOSIZE)       # the information about an entry in the
                                 # definition table

   character token (MAXTOKEN)    # array holding the token string

   string define_string "define"
   string undefine_string "undefine"
   string include_string "include"

   # For each token, if the token is a string of alphanumeric characters,
   # then if the token is the string "define", enter the definition in
   # the definition table. If the token is the string "undefine", remove
   # the definition from the table. If the token is "include", begin
   # reading input from the new file. If the token is in the table,
   # replace it with its definition. Else if it is not in the table
   # or if it is not alphanumeric, move it to the output buffer.

   call initialize

   for (t_type = get_token (token); t_type ~= EOF; t_type = get_token (token)) {
      if (t_type == LETTER) {
DEBUG call print (STDOUT, "token - *s*n"s, token)
         if (equal (token, define_string) == YES)
            call enter_string

         else if (equal (token, undefine_string) == YES)
            call remove_string

         else if (equal (token, include_string) == YES)
            call include_file

         else if (lookup (token, info, Def_table) == YES) {
DEBUG       call print (STDOUT, "lookup = yes*n"s)
            call save_info (info)
            if (info (NUM_ARGS) == 0)
               call expand
            else {

               # If the macro is being called with no arguments, expand
               # it and print the blanks between the macro and the next
               # token.

               Back_ptr = In_ptr
               while (In_line (In_ptr) == " "c)
                  In_ptr += 1
               if (In_line (In_ptr) ~= "("c)
                  In_ptr = Back_ptr
               else {
                  In_ptr += 1
                  call get_args
                  }
               call expand
               }
            }

         else {
            All_blanks = NO
            call move_from_in_line
            }

         }
      else {
         All_blanks = NO
         call move_from_in_line
         }
      }

   stop
   end



# add_arg --- add an argument to the top level in Macro_stack
   subroutine add_arg

   include DEFINE_COMMON

   integer ptr,               # pointer to a string in Mem
           length,            # system function
           dsget              # system function

   # Copy the buffer into dynamic storage and put the address of the
   # string into the position for the next argument in the macro call,
   # then reset B_ptr.


   if (Macro_call (NUMBER_READ) < Macro_call (NUM_ARGUMENTS)) {
      Macro_call (NUMBER_READ) += 1
      if (B_ptr == 1)
         ptr = 0
      else {
         Buffer (B_ptr) = EOS
         ptr = dsget (length (Buffer))
         call scopy (Buffer, 1, Mem, ptr)
         }
      Macro_call (Macro_call (NUMBER_READ)) = ptr
      }

   B_ptr = 1

   return
   end



# clear_buffer --- clear the buffer and reset the variables
   subroutine clear_buffer

   include DEFINE_COMMON

   # If there is something in the buffer, write it out. Reset the
   # variables to begin a new line.

   Buffer (B_ptr) = EOS
   if ((All_blanks == NO || Define_line == NO) && Infile (Level) ~= Swt_defs)
      call putlin (Buffer, STDOUT)

   B_ptr = 1
   All_blanks = YES

   return
   end



# enter_string --- save an identifier and its definition
   subroutine enter_string

   include DEFINE_COMMON

   integer lookup,                  # system function
           def_length,              # length of the replacement string
           info (INFOSIZE),         # a node in the definition table
           i,                       # loop counter
           file_mark,               # either EOF or NOT_EOF
           num_params               # the number of formal parameters

   pointer ptr,                     # pointer into dynamic storage
           dsget,                   # system function
           param_table (MAXPARAMS)  # table holding pointers to the formal
                                    # parameters characters strings

   character get_token,             # returns the next token and its type
             token (MAXTOKEN),      # the name of the macro
             definition (MAXDEF)    # the replacement string

   # Read the macros name and formal parameters (if any).
   # Skip blanks and newlines up to the left paren.

   num_params = 0
   Define_line = YES
   if (get_token (token) ~= "("c) {
      call synerr ("missing left paren in define"p)
      In_ptr = Back_ptr
      }

   else if (get_token (Macro_name) ~= LETTER)
      call synerr ("non_alphanumeric name in define"p)
   else {
      call get_params (numparams, param_table)
DEBUG call print (STDOUT, "numparams - *i*n"s, num_params)

      # Read the definition and copy it into memory.

      if (Error_in_define == NO)
         call read_def (definition, num_params, param_table, def_length)
      if (Error_in_define == NO) {
         ptr = dsget (def_length)
DEBUG    call print (STDOUT, "definition - *s*n"s, definition)
         for (i = 1; i <= def_length; i += 1)
            Mem (ptr + i - 1) = definition (i)

         # Look the name up in the table, and if it is already there, remove the
         # previous defnition. Put the new definition in the table.

         if (lookup (Macro_name, info, Def_table) == YES)
            call dsfree (info (POINTER))
         info (POINTER) = ptr
         info (NUM_ARGS) = num_params
         info (LENGTH) = def_length - 1
         call enter (Macro_name, info, Def_table)
DEBUG    call print (STDOUT, "define - *s*n"s, Macro_name)
DEBUG    if (lookup (Macro_name, info, Def_table) == YES)
DEBUG       call print (STDOUT, "def - *s*n"s, Mem (info (POINTER)))
DEBUG    else
DEBUG       call print (STDOUT, "error - not in table*n"s)
         }
      }

   # Skip over any blanks and the first newline following the definition
   # and clear the parameter table.

   call skip (file_mark)
   Define_line = NO
   Error_in_define = NO

   for (i = 1; i <= num_params; i += 1)
      call dsfree (param_table (i))

   return
   end



# expand --- expand the macro
   subroutine expand

   include DEFINE_COMMON

   integer ptr,                     # address of the text of the macro
           arg_num,                 # the number of the parameter being replaced
           i                        # loop counter


   # Push the macro text back onto the input, replacing the formal
   # parameters with the arguments in the macro call.

   ptr = Macro_call (TEXT_POINTER) - 1
   for (i = Macro_call (TEXT_LENGTH); i > 0; i -= 1)

      if (Mem (ptr + i) < 0) {
         arg_num = - (Mem (ptr + i))
         if (arg_num <= Macro_call (NUMBER_READ)
                  & Macro_call (arg_num) ~= 0)
            call move_to_in_line (Mem (Macro_call (arg_num)))
         }

      else {
         In_ptr -= 1
         In_line (In_ptr) = Mem (ptr + i)
         }

   for (i = 1; i < Macro_call (NUMBER_READ); i += 1)
      call dsfree (Macro_call (i))

   return
   end



# get_args  --- read the macro calls arguments
   subroutine get_args

   include DEFINE_COMMON

   integer paren_count        # the number of unbalanced parens.
   character t_type,          # the token type
             get_token,       # function that returns a token
             token (MAXTOKEN)  # the text of the token

   # Read the arguments until the number of unmatched parens is less than one.

   paren_count = 1
   repeat {

      t_type = get_token (token)
      if (t_type == "("c) {
         All_blanks = NO
         call move_from_in_line
         paren_count += 1
         }

      else if (t_type == ")"c) {
         paren_count -= 1
         if (paren_count > 0) {
            All_blanks = NO
            call move_from_in_line
            }
         else {
            call add_arg
            break
            }
         }

   # Whenever a comma is encountered, add the argument in Buffer

      else if (t_type == ","c && paren_count == 1)
         call add_arg

      else {
         All_blanks = NO
         call move_from_in_line
         }

      } until (t_type == EOF)

   if (t_type == EOF)
      call synerr ("missing right paren after define"p)

   return
   end



# get_params --- read the macro's formal parameters
   subroutine get_params (num_params, param_table)
   integer num_params               # the number of parameters
   pointer param_table (MAXPARAMS)  # table holding pointers to the parameter's
                                    # character strings

   include DEFINE_COMMON

   pointer dsget                    # system function

   character get_token,             # returns the next token and its type
             token (MAXTOKEN),      # the token read by get_token
             c                      # the character read by get_next_ch

   integer length                   # system functin

   # If the next non-blank character is a left paren, the macro has a
   # list of parameters.

   c = get_token (token)
   if (c == "("c) {
      repeat {

         # Read the list of parameters, put the character strings in memory,
         # and the addresses of the strings in the param_table.

         c = get_token (token)

         if (c == ","c) {
            call synerr ("missing parameter in definition"p)
            Error_in_define = YES
            }

         else if (c == ")"c)
            break

         else if (num_params > MAXPARAMS) {
            call synerr ("too many parameters"p)
            Error_in_define = YES
            }

         else {
            if (c ~= LETTER) {
               call synerr ("non-numeric parameter not allowed"p)
               Error_in_define = YES
               }
            else {
               num_params += 1
               param_table (num_params) = dsget (length (token))
               call scopy (token, 1, Mem, param_table (num_params))
               }
            c = get_token (token)
            if (c == ")"c)
               break
            else if (c ~= ","c) {
               call synerr ("missing comma in parameter list"p)
               Error_in_define = YES
               }
            }
         }

      if (get_token (token) ~= ","c) {
         call synerr ("missing comma in define"p)
         Error_in_define = YES
         }
      }

   else if (c ~= ","c) {
      call synerr ("missing comma in define"p)
      Error_in_define = YES
      }

   return
   end



# get_token --- get a token from the input
   character function get_token (token)
   character token (MAXTOKEN)     # the token string

   include DEFINE_COMMON

   character char_type,          # the type of the next character in In_line
             mapdn,              # system function
             type                # system function
   integer file_mark,            # either EOF or NOT_EOF
           i                     # index into token_string

   # Skip over everything up to the next token.

   call skip (file_mark)
   if (file_mark == EOF)
      get_token = EOF

   # As long as the characters are letters, digits, dollars, or underlines, they
   # are part of the same token, so put them (except for underlines), in
   # the token string.

   else if (type (In_line (In_ptr)) == LETTER) {
      Back_ptr = In_ptr
      char_type = type (In_line (In_ptr))
      i = 1
      while (char_type == LETTER || char_type == DIGIT
               || char_type == "_"c || char_type == "$"c) {
         if (char_type ~= "_"c || char_type ~= "$"c)  {
            if (Map == YES)
               token (i) = mapdn (In_line (In_ptr))
            else
               token (i) = In_line (In_ptr)
            i += 1
            }
         In_ptr += 1
         char_type = type (In_line (In_ptr))
         }

      token (i) = EOS
      get_token = LETTER
      }

   # If the first character is not a letter, return it as the value of
   # get_token.

   else {
      Back_ptr = In_ptr
      get_token = In_line (In_ptr)
      In_ptr += 1
      }

   return
   end



# include_file --- process includes
   subroutine include_file

   include DEFINE_COMMON

   character type,                  # system function
             filename (MAXTOKEN)    # the name of the file
   integer i,                       # loop counter
           open,                    # system function
           length,                  # system function
           dsget                    # system function

   # Skip the characters between the include and the filename.

   if (All_blanks == YES)
      B_ptr = 1
   while (In_line (In_ptr) == " "c)
      In_ptr += 1
   if (In_line (In_ptr) == "'"c || In_line (In_ptr) == '"'c)
      In_ptr += 1

   # Read the filename

   i = 1
   while (type (In_line (In_ptr)) == LETTER
            || type (In_line (In_ptr)) == DIGIT
            || In_line (In_ptr) == "="c
            || In_line (In_ptr) == "_"c
            || In_line (In_ptr) == "/"c
            || In_line (In_ptr) == "."c
            || In_line (In_ptr) == "*"c
            || In_line (In_ptr) == "-"c
            || In_line (In_ptr) == "&"c
            || In_line (In_ptr) == "$"c
            || In_line (In_ptr) == "#"c) {
      file_name (i) = In_line (In_ptr)
      i += 1
      In_ptr += 1
      }

   # If the filename contains some illegal characters, produce an
   # error message.

   if (i <= 1 || (In_line (In_ptr) ~= " "c
                  && In_line (In_ptr) ~= "'"c
                  && In_line (In_ptr) ~= '"'c))
      call synerr ("invalid file name in include"p)

   # Else open the file, increment Level, and save the name of the file.

   else {
      file_name (i) = EOS
      Level += 1
      if (Level > MAXLEVEL)
         call synerr ("includes nested too deeply"p)

      else {
         Infile (Level) = open (filename, READ)
         Save_filename (Level) = dsget (length (filename))
         Line_number (Level) = 0
         call scopy (file_name, 1, Mem, Save_filename (Level))
         }

      if (Infile (Level) == ERR)
         call synerr ("can't open include file"p)
      }

   In_ptr += 1

   return
   end



# initialize --- initialize the global variables
   subroutine initialize

   include DEFINE_COMMON

   integer mktabl,           # system function
           length,           # system function
           len,              # length of a filename returned by getarg
           getarg,           # system function
           open,             # system function
           dsget             # system function

   character filename (MAXTOKEN)
   string usage_string "Usage: define [-f | m] {filename}"

   # If the -f argument is not present in the command line, include the
   # RATFOR definitions, else if there is a file name in the command
   # line, read from that file, else read from standard input. If the
   # -m argument is present, map all identifiers to lower case.

   call dsinit (MEMSIZE)

   Command_arg = 1
   PARSE_COMMAND_LINE ("f<flag>m<flag>"s, usage_string)
   if (ARG_PRESENT (m))
      Map = YES
   else
      Map = NO

   Level = 1
   if (~ARG_PRESENT (f)) {
      Infile (Level) = open ("=incl=/swt_def.r.i"s, READ)
      Swt_defs = Infile (Level)
      }
   else {
      Swt_defs = -1
      len = getarg (Command_arg, filename, MAXTOKEN)
      Command_arg += 1
      if (len == EOF) {
         Infile (Level) = STDIN
         Save_filename (1) = dsget (5)
         Line_number (1) = 0
         call scopy ("STDIN"s, 1, Mem, Save_filename (1))
         }
      else {
         Infile (Level) = open (file_name, READ)
         if (Infile (1) == ERR)
            call cant (filename)
         else {
            Save_filename (1) = dsget (length (filename))
            call scopy (filename, 1, Mem, Save_filename (1))
            Line_number (1) = 0
            }
         }
      }

   Def_table = mktabl (INFOSIZE)
   In_ptr = PBLIMIT
   B_ptr = 1
   In_line (PBLIMIT) = EOS
   Define_line = NO
   All_blanks = YES
   Error_in_define = NO

   return
   end



# move_from_in_line --- move characters from In_line to Buffer
   subroutine move_from_in_line

   include DEFINE_COMMON

   # Move the characters between Back_ptr and In_ptr from In_line
   # to Buffer.

   while (Back_ptr < In_ptr) {
      Buffer (B_ptr) = In_line (Back_ptr)
      B_ptr += 1
      Back_ptr += 1
      }

   return
   end



# move_to_in_line --- move characters to the input line
   subroutine move_to_in_line (text)
   character text (ARB)        # character string to be moved

   include DEFINE_COMMON

   integer len,               # the length of the character string
           length,            # system function
           i                  # loop counter

   # Move the characters in text to In_line and set In_ptr to point
   # to the new beginnning of the string.

   len = length (text)
   In_ptr -= len
   for (i = 1; i <= len; i += 1)
      In_line (In_ptr + i - 1) = text (i)

   return
   end



# read_def --- read the definition
   subroutine read_def (def, num_params, param_table, def_length)
   character def (MAXDEF)              # the array the definition is placed in
   integer num_params                  # number of formal parameters
   pointer param_table (MAXPARAMS)     # table of pointers to the parameter's
                                       # character strings
   integer def_length                  # the length of the definition

   include DEFINE_COMMON

   integer unmatched_parens,           # used to find the end of the definition
           file_mark,                  # either EOF or NOT_EOF
           j,                          # loop counter
           equal,                      # system function
           type                        # system function

   character token (MAXTOKEN)          # the token read by get_token

   # Transfer each character in the definition from the In_line to def.
   # If the character is a letter, call get_token. If the token is one
   # of the formal parameters, replace it with the negative of the the
   # number of the parameter, otherwise copy the token to the end of the
   # definition.

   unmatched_parens = 0
   def_length = 1
   repeat {

      if (def_length >= MAXDEF)
         call synerr ("definition too long"p)

      select (type (In_line (In_ptr)))

      # Read the next line from input.

      when (NEWLINE) {
         def (def_length) = NEWLINE
         def_length += 1
         In_ptr += 1
         if (In_ptr == PBLIMIT) {
            call read_line (file_mark)
            if (file_mark == EOF) {
               call synerr ("missing right paren after definition"p)
               def (def_length) = EOS
               break
               }
            }
         }

      # increment the number of unmatched parens.

      when ("("c) {
         unmatched_parens += 1
         def (def_length) = "("c
         def_length += 1
         In_ptr += 1
         }

      # Decrement the number of unmatched parens. If the number is less
      # than 0, the definitione is finished.

      when (")"c) {
         unmatched_parens -= 1
         if (unmatched_parens < 0) {
            def (def_length) = EOS
            In_ptr += 1
            break
            }
         else {
            def (def_length) = ")"c
            def_length += 1
            In_ptr += 1
            }
         }

      # If the token is one of the formal parameters, replace it with
      # the negative of the number of the parameter.

      when (LETTER) {
         call get_token (token)
         for (j = 1; j <= num_params; j += 1)
            if (equal (Mem (param_table (j)), token) == YES)
               break

         if (j <= num_params) {
            def (def_length) = -j
            def_length += 1
            }

         # If it was not one of the parameters, check if it is the same
         # as the name of the macro. If it is, put brackets around it so
         # that it will not be expanded after the macro is called.

         else if (equal (Macro_name, token) == YES) {
            def (def_length) = "["c
            def_length += 1
            while (Back_ptr < In_ptr) {
               def (def_length) = In_line (Back_ptr)
               def_length += 1
               Back_ptr += 1
               }
            def (def_length) = "]"c
            def_length += 1
            }

         # otherwise, copy the token into the definition

         else
            while (Back_ptr < In_ptr) {
               def (def_length) = In_line (Back_ptr)
               def_length += 1
               Back_ptr += 1
               }
         }

      # If the character was anything else, move it to the definition.

      else {
         def (def_length) = In_line (In_ptr)
         def_length += 1
         In_ptr += 1
         }
      }

   return
   end



# read_line --- read a line of input
   subroutine read_line (file_mark)
   integer file_mark          # returns EOF or NOT_EOF

   include DEFINE_COMMON

   integer getlin,            # system function
           open,              # system function
           length,            # system function
           len,               # the length of the file_name returnes by get_arg
           getarg             # system function
   pointer dsget              # system function
   character file_name (MAXTOKEN)

   # Clear the Buffer, read the next line from input, and update Current_line
   # and Line_number. If the value returned by get_lin was EOF and the
   # file was an included file, drop back to the calling file and read
   # the nest line from it.

   file_mark = NOT_EOF
   call clear_buffer

   while (file_mark ~= EOF)
      if (getlin (Buffer, Infile (Level)) ~= EOF) {
         call move_to_in_line (Buffer)
         call scopy (Buffer, 1, Current_line, 1)
         file_mark = NOT_EOF
         Line_number (Level) += 1
         Error_on_current_line = NO
         break
         }

      else if (Level > 1) {
         call close (Infile (Level))
         Level -= 1
         }


   # If the input file was "=incl=/swt_defs.r.i", then if there is a
   # filename on the command_line, read the input from that file,
   # else read input from standard input.

      else if (Infile (Level) == Swt_defs) {
         len = getarg (Command_arg, file_name, MAXTOKEN)
         Command_arg += 1
         Swt_defs = -1
         if (len == EOF) {
            Infile (Level) = STDIN
            Save_filename (1) = dsget (5)
            Line_number (1) = 0
            file_mark = NOT_EOF
            call scopy ("STDIN"s, 1, Mem, Save_filename (1))
            }

         else {
            Infile (Level) = open (file_name, READ)
            if (Infile (Level) == ERR)
               call cant (filename)
            Save_filename (1) = dsget (length (file_name))
            Line_number (1) = 0
            call scopy (file_name, 1, Mem, Save_filename (1))
            file_mark = NOT_EOF
            }
         }

   # If the input file was not on the command line, open the next
   # file on the command line.

      else if (In_file (1) ~= STDIN) {
         call close (Infile (1))
         len = getarg (Command_arg, file_name, MAXTOKEN)
         Command_arg += 1
         if (len == EOF)
            file_mark = EOF
         else {
            Infile (1) = open (file_name, READ)
            if (Infile (1) == ERR)
               call cant (file_name)
            Save_filename (1) = dsget (length (file_name))
            call scopy (file_name, 1, Mem, Save_filename (1))
            Line_number (1) = 0
            file_mark = NOT_EOF
            }
         }

      else
         file_mark = EOF

   return
   end



# remove_string --- remove a definition from the table
   subroutine remove_string

   include DEFINE_COMMON

   character token (MAXTOKEN),      # the character string returned by get_token
             get_token              # reads the next token
   integer lookup,                  # system function
           info (INFOSIZE)          # the information in a node in the Def_table

   # Read the name of the macro, look it up in the definition table,
   # return the space taken up by the definition to the dynamic storage,
   # and remove the node from the definition table.

   Define_line = YES
   if (get_token (token) ~= "("c)
      call synerr ("missing left paren after undefine"p)

   else if (get_token (token) ~= LETTER)
      call synerr ("non-alphanumeric name in undefine"p)

   else {
      if (lookup (token, info, Def_table) == YES) {
         call dsfree (info (POINTER))
         call delete (token, Def_table)
         }

      # Find the left paren following the definition name, then skip
      # characters until the NEWLINE is encountered or the next non_blank
      # character is found.

      if (get_token (token) ~= ")"c)
         call synerr ("missing right paren after undefine"p)
      else {
         while (In_line (In_ptr) == " "c)
            In_ptr += 1
         if (In_line (In_ptr) == NEWLINE)
            In_ptr += 1
         }
      }

   Define_line = NO

   return
   end



# save_info --- push an entry on the Macro_stack
   subroutine save_info (info)
   integer info (INFOSIZE)         # the information about an entry in
                                    # the definition table

   include DEFINE_COMMON

   # Save the information in info, and print out the contents of the buffer
   # so that the macro's arguments can be placed in it.

   Macro_call (TEXT_POINTER) = info (POINTER)
   Macro_call (NUM_ARGUMENTS) = info (NUM_ARGS)
   Macro_call (TEXT_LENGTH) = info (LENGTH)
   Macro_call (NUMBER_READ) = 0
   call clear_buffer

   return
   end



# skip --- skip characters up to the beginning to the next token
   subroutine skip (file_mark)
   integer file_mark          # the value of file_mark is either EOF of NOT_EOF

   include DEFINE_COMMON

   integer bracket_level,     # the number of unmatched brackets
           skip_flag          # set to YES in the middle of a comment or
                              # between quotes
   character skip_char        # all characters up to this character are to
                              # be skipped

   # Skip all characters up to the beginning of the next token.  Write out
   # the Buffer whenever a NEWLINE is encountered. If In_line is empty,
   # read the next line from input.

   file_mark = NOT_EOF
   skip_flag = NO
   bracket_level = 1

   repeat {

      # If the Buffer is full, write out an error message.

      if (B_ptr == MAXLINE) {
         call clear_buffer
         call synerr ("line too long"p)
         }

      # Skip blanks.

      while (In_line (In_ptr) == " "c && B_ptr < MAXLINE) {
         Buffer (B_ptr) = " "c
         B_ptr += 1
         In_ptr += 1
         }

      # Skip characters up to the balancing right bracket, but don't print the brackets.

      if (In_line (In_ptr) == "["c) {
         bracket_level += 1
         In_ptr += 1
         skip_char = "]"c
         All_blanks = NO
         skip_flag = YES
         }

      # Skip the characters inside quotes.

      else if (In_line (In_ptr) == "'"c || In_line (In_ptr) == '"'c) {
         skip_char = In_line (In_ptr)
         skip_flag = YES
         All_blanks = NO
         }

      # Skip comments by skipping characters up to the next NEWLINE.

      else if (In_line (In_ptr) == "#"c) {
         skip_char = NEWLINE
         skip_flag = YES
         All_blanks = NO
         }

      # Skip the characters up to the skip character, until In_line
      # is empty or NEWLINE is encountered.

      if (skip_flag == YES)
         repeat {
            Buffer (B_ptr) = In_line (In_ptr)
            B_ptr += 1
            In_ptr += 1
            } until (In_line (In_ptr) == skip_char
                        || In_line (In_ptr) == NEWLINE
                        || In_ptr + 1 == PBLIMIT)

      if (In_line (In_ptr) == skip_char || In_line (In_ptr) == NEWLINE) {
         if (skip_char ~= "]"c) {
            Buffer (B_ptr) = In_line (In_ptr)
            B_ptr += 1
            }
         In_ptr += 1
         skip_flag = NO
         }

      # If In_line is empty, clear the buffer and read the next line.

      if (In_line (In_ptr) == NEWLINE && In_ptr + 1 == PBLIMIT) {
         Buffer (B_ptr) = NEWLINE
         B_ptr += 1
         In_ptr = PBLIMIT
         call read_line (file_mark)
         }

      # If the character is a NEWLINE, print the contents of the buffer

      else if (In_line (In_ptr) == NEWLINE) {
         Buffer (B_ptr) = NEWLINE
         B_ptr += 1
         In_ptr += 1
         call clear_buffer
         }

      else if (In_ptr == PBLIMIT)
         call read_line (file_mark)

      if (file_mark == EOF)
         break

      }  until (In_line (Inptr) ~= NEWLINE
                 && In_line (In_ptr) ~= " "c
                 && In_line (In_ptr) ~= "'"c
                 && In_line (In_ptr) ~= '"'c
                 && In_line (In_ptr) ~= "#"c
                 && In_line (In_ptr) ~= "["c
                 && skip_flag == NO)

   return
   end



# synerr --- print error messages
   subroutine synerr (message)
   character message (ARB)        # the text of the message

   include DEFINE_COMMON

   integer len,                  # index into buf
           length,               # system function
           itoc                  # system functions
   character buf (MAXLINE)        # holds the filename

   string std_file "STDIN"

   # If this is the first error on this line, print out the filename,
   # the line number, and the text of the current line.

   if (Error_on_current_line == NO) {
      buf (1) = "("c
      if (Level == 0)
         call scopy (std_file, 1, buf, 2)
      else
         call scopy (Mem (Save_filename (Level)), 1, buf, 2)
      len = length (buf) + 1
      buf (len) = ")"c
      buf (len + 1) = " "c
      len += 2
      if (Level > 0)
         len += itoc (Line_number (Level), buf (len), MAXLINE)
      else
         len += itoc (Line_number (1), buf (len), MAXLINE)
      buf (len) = ":"c
      buf (len + 1) = " "c
      buf (len + 2) = EOS
      call print (ERROUT, "*s*s"s, buf, Current_line)
      }

   # print the error message.

   call print (ERROUT, "   ##### *p*n"s, message)
   Error_on_current_line = YES
   if (Level < 1)
      call error ("   ##### unexpected EOF"p)

   return
   end
