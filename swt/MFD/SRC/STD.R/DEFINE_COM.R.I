# define_com.r.i --- common declarations for the 'define' program

# In_line holds the input characters, and In_ptr is the index into In_line.
# Buffer holds the output line, and arguments and parameters as they are
# processed, and B_ptr is the index into Buffer. Back_ptr points to the
# beginning of a token in In_line.  Current_line is the line most recently
# read from input. Error_on_current_line is a flag set if there is an error.
# Define_line and All_blanks are flags used to indicate whether or not a
# line in the Buffer is to be printed.  In_file is the array of file
# descriptors used to keep track of nested includes. Line_number is the
# number of the line last read from each file. Save_filename is an array
# of pointers to the names of the nested files. Save_filename, Line_number,
# Current_line, and Error_on_current_line are used in printing error
# messages. Error_in_define is set if there was an syntax error in the
# define. Map is a flag specifying whether or not to map upper case
# into lower case. Command_arg is the number of the next filename in
# the command line.

   common /char_store/ In_line, In_ptr, Back_ptr,
                       Buffer, B_ptr, All_blanks, Define_line,
                       In_file, Save_filename, Line_number, Level,
                       Current_line, Error_on_current_line,
                       Error_in_define, Map, ARG_BUF, Swt_defs,
                       Command_arg

   character In_line (PBLIMIT), Buffer (MAXLINE), Current_line (MAXLINE)
   integer In_ptr, Back_ptr, B_ptr, All_blanks, Define_line,
           Infile (MAXLEVEL), Level, Line_number (MAXLEVEL),
           Save_filename (MAXLEVEL), Error_on_current_line,
           Error_in_define, Map, Swt_defs, Command_arg
   ARG_DECL

# Macro_call holds the information about a macro during expansion.
# Macro_name is used to avoid recursively expanding a macro if the name
# of the macro appears in the definition.

   common /stack/ Macro_call, Macro_name
   character Macro_name (MAXTOKEN)
   integer Macro_call (MAXCALLSIZE)

# Dynamic storage area for macro definitions.

   DS_DECL (Mem, MEMSIZE)

# Def_table is the address of the definition table.

   common /deftab/ Def_table
   pointer Def_table
