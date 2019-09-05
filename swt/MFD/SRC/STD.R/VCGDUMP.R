# vcgdump --- interpret IMF files used by 'vcg'

include "=incl=/vcg_defs.r.i"

define (GLOBAL_VARS, "vcgdump_com.r.i")

define (EON, 0)
define (INT, 1)
define (UNS, 2)
define (TREE, 3)
define (SPECIAL, 4)
define (STRING, 5)
define (MODE, 6)

define (STEP_SIZE, 2)
define (MAX_INDENT, 60)

define (must_get (val, file, line, msg), _
{if (get (val, file, line) == EOF) {call errmsg (msg); return}})
define (must_get_node (val, file, line), _
must_get (val, file, line, "premature end of tree"p))

   include GLOBAL_VARS

   character file (MAXLINE), arg (MAXLINE)

   integer getarg

   file_des open

   if (getarg (1, arg, MAXLINE) == EOF
     || getarg (2, file, MAXLINE) ~= EOF)
      call error ("usage:  interp filename_prefix"p)

   call encode (file, MAXLINE, "*s.ct1"s, arg)
   Ef = open (file, READ)
   if (Ef == ERR)
      {
      call print (ERROUT, "interp:  can't open *s*n"p, file)
      stop
      }
   El = 1

   call encode (file, MAXLINE, "*s.ct2"s, arg)
   Sf = open (file, READ)
   if (Sf == ERR)
      {
      call print (ERROUT, "interp:  can't open *s*n"p, file)
      stop
      }
   Sl = 1

   call encode (file, MAXLINE, "*s.ct3"s, arg)
   Pf = open (file, READ)
   if (Pf == ERR)
      {
      call print (ERROUT, "interp:  can't open *s*n"p, file)
      stop
      }
   Pl = 1

   call display

   stop
   end



# display --- display IMF files one module at a time

   subroutine display

   include GLOBAL_VARS

   integer modnum, val
   integer get

   for (modnum = 1; get (val, Ef, El) ~= EOF && val ~= NULL_OP;
     modnum += 1)
      {
      call print (STDOUT, "*n*n######  Module *i  ######*n*n"s, modnum)

      if (val ~= MODULE_OP)
         {
         call errmsg ("missing MODULE_OP in entry points"p)
         call skipto (MODULE_OP, Ef, El)
         }
      if (get (val, Sf, Sl) == EOF || val ~= MODULE_OP)
         {
         call errmsg ("missing MODULE_OP in static data"p)
         call skipto (MODULE_OP, Sf, Sl)
         }
      if (get (val, Pf, Pl) == EOF || val ~= MODULE_OP)
         {
         call errmsg ("missing MODULE_OP in procedures"p)
         call skipto (MODULE_OP, Pf, Pl)
         }

      call print (STDOUT, "Entry Points:*n*n"s)
      call display_module (Ef, El, val)    # returns last value in val
      if (val ~= NULL_OP)
         {
         call errmsg ("missing NULL_OP in entry points"p)
         call skipto (NULL_OP, Ef, El)
         }

      call print (STDOUT, "*nStatic Data Definitions:*n*n"s)
      call display_module (Sf, Sl, val)
      if (val ~= NULL_OP)
         {
         call errmsg ("missing NULL_OP in static data"p)
         call skipto (NULL_OP, Sf, Sl)
         }

      call print (STDOUT, "*nProcedure Definitions:*n*n"s)
      call display_module (Pf, Pl, val)
      if (val ~= NULL_OP)
         {
         call errmsg ("missing NULL_OP in procedures"p)
         call skipto (NULL_OP, Pf, Pl)
         }
      }

   if (val ~= NULL_OP)
      call errmsg ("missing NULL_OP at end of entry points"p)

   if (get (val, Sf, Sl) == EOF || val ~= NULL_OP)
      call errmsg ("missing NULL_OP at end of static data"p)

   if (get (val, Pf, Pl) == EOF || val ~= NULL_OP)
      call errmsg ("missing NULL_OP at end of procedures"p)

   return
   end



# display_entry_point --- print one out, dummy

   subroutine display_entry_point

   include GLOBAL_VARS

   integer obj_id
   integer get

   character name (MAXLINE)

   must_get (obj_id, Ef, El, "missing object id in entry point declaration"p)
   call get_string (name, Ef, El)
   call print (STDOUT, "object id *i, '*s'*n"s, obj_id, name)

   return
   end



# display_mode --- convert a data mode to printable form

   subroutine display_mode (mode)
   integer mode

   select (mode)
      when (INT_MODE)
         call putlin ("int"s, STDOUT)
      when (UNS_MODE)
         call putlin ("unsigned"s, STDOUT)
      when (LONG_INT_MODE)
         call putlin ("long"s, STDOUT)
      when (LONG_UNS_MODE)
         call putlin ("long unsigned"s, STDOUT)
      when (FLOAT_MODE)
         call putlin ("floating"s, STDOUT)
      when (LONG_FLOAT_MODE)
         call putlin ("long floating"s, STDOUT)
      when (STOWED_MODE)
         call putlin ("stowed"s, STDOUT)
   else
      call print (STDOUT, "unknown (*i)"s, mode)

   return
   end



# display_module --- display everything in one module

   subroutine display_module (file, line_num, last)
   file_des file
   integer line_num, last

   include GLOBAL_VARS

   integer get

   while (get (last, file, line_num) ~= EOF && last == SEQ_OP)
      if (file == Ef)
         call display_entry_point
      else if (file == Sf)
         call display_static_datum
      else if (file == Pf)
         call display_procedure
      else
         call error ("interp:  can't possibly happen"p)

   return
   end



# display_op --- display name of IMF operator

   subroutine display_op (op)
   integer op

   string_table posn, info _
      / "addaa",
      / "add",
      / "andaa",
      / "and",
      / "assign",
      / "break",
      / "case",
      / "compl",
      / "const",
      / "convert",
      / "declare_stat",
      / "default",
      / "define_dynm",
      / "define_stat",
      / "deref",
      / "divaa",
      / "div",
      / "do_loop",
      / "eq",
      / "for_loop",
      / "ge",
      / "goto",
      / "gt",
      / "if",
      / "index",
      / "initializer",
      / "label",
      / "le",
      / "lshiftaa",
      / "lshift",
      / "lt",
      / "module",
      / "mulaa",
      / "mul",
      / "neg",
      / "next",
      / "ne",
      / "not",
      / "null",
      / "object",
      / "oraa",
      / "or",
      / "postdec",
      / "postinc",
      / "predec",
      / "preinc",
      / "proc_call_arg",
      / "proc_call",
      / "proc_defn_arg",
      / "proc_defn",
      / "refto",
      / "remaa",
      / "rem",
      / "return",
      / "rshiftaa",
      / "rshift",
      / "sand",
      / "select",
      / "seq",
      / "sor",
      / "subaa",
      / "sub",
      / "switch",
      / "undefine_dynm",
      / "while_loop",
      / "xoraa",
      / "xor",
      / "zero_initializer",
      / "field",
      / "check_range",
      / "check_upper",
      / "check_lower"

   call putlin (info (posn (op + 1)), STDOUT)

   return
   end



# display_procedure --- self explanatory

   subroutine display_procedure

   include GLOBAL_VARS

   integer proc_op, obj_id, nargs, length, val, mode, disp
   integer get

   character name (MAXLINE)

   if (get (proc_op, Pf, Pl) == EOF || proc_op ~= PROC_DEFN_OP)
      {
      call errmsg ("missing PROC_DEFN in procedure stream"p)
      call skipto (PROC_DEFN_OP, Pf, Pl)
      }

   must_get (obj_id, Pf, Pl, "missing object id in procedure definition"p)

   must_get (nargs, Pf, Pl, "missing number-of-arguments in proc defn"p)

   call get_string (name, Pf, Pl)

   call print (STDOUT, "procedure '*s', object id *i; *i arguments*n"s,
      name, obj_id, nargs)

   while (get (val, Pf, Pl) ~= EOF && val == PROC_DEFN_ARG_OP)
      {
      must_get (obj_id, Pf, Pl, "missing argument object id number"p)
      must_get (mode, Pf, Pl, "missing argument data mode"p)
      must_get (disp, Pf, Pl, "missing argument disposition"p)
      must_get (length, Pf, Pl, "missing argument length"p)
      call print (STDOUT, "   argument, object id *i, mode "s, obj_id)
      call display_mode (mode)
      if (disp == VALUE_DISP)
         call print (STDOUT, ", pass-by-value, "s)
      else if (disp == REF_DISP)
         call print (STDOUT, ", pass-by-reference, "s)
      else
         call print (STDOUT, ", illegal disposition (*i), "s, disp)
      call print (STDOUT, "size *,-10i*n"s, length)
      }

   if (val ~= NULL_OP)
      {
      call errmsg ("missing NULL at end of procedure parameters"p)
      return
      }

   Indent = 0
   call display_tree (Pf, Pl)    # the procedure code itself
   return
   end



# display_static_datum --- obvious

   subroutine display_static_datum

   include GLOBAL_VARS

   Indent = 0
   call display_tree (Sf, Sl)
      # in this case, must be a DEFINE_STAT or a DECLARE_STAT

   return
   end



# display_tree --- format and display a subtree

   subroutine display_tree (file, line_num)
   file_des file
   integer line_num

   include GLOBAL_VARS

   string_table posn, info _
      / ADDAA_OP, MODE, TREE, TREE, EON,
      / ADD_OP, MODE, TREE, TREE, EON,
      / ANDAA_OP, MODE, TREE, TREE, EON,
      / AND_OP, MODE, TREE, TREE, EON,
      / ASSIGN_OP, MODE, TREE, TREE, INT, EON,
      / BREAK_OP, INT, EON,
      / CASE_OP, TREE, TREE, TREE, EON,
      / COMPL_OP, MODE, TREE, EON,
      / CONST_OP, SPECIAL, EON,
      / CONVERT_OP, MODE, MODE, TREE, EON,
      / DECLARE_STAT_OP, INT, STRING, EON,
      / DEFAULT_OP, TREE, TREE, EON,
      / DEFINE_DYNM_OP, INT, TREE, UNS, EON,
      / DEFINE_STAT_OP, INT, TREE, UNS, EON,
      / DEREF_OP, MODE, TREE, EON,
      / DIVAA_OP, MODE, TREE, TREE, EON,
      / DIV_OP, MODE, TREE, TREE, EON,
      / DO_LOOP_OP, TREE, TREE, EON,
      / EQ_OP, MODE, TREE, TREE, EON,
      / FOR_LOOP_OP, TREE, TREE, TREE, TREE, EON,
      / GE_OP, MODE, TREE, TREE, EON,
      / GOTO_OP, INT, EON,
      / GT_OP, MODE, TREE, TREE, EON,
      / IF_OP, MODE, TREE, TREE, TREE, EON,
      / INDEX_OP, MODE, TREE, TREE, UNS, EON,
      / INITIALIZER_OP, MODE, TREE, TREE, EON,
      / LABEL_OP, INT, EON,
      / LE_OP, MODE, TREE, TREE, EON,
      / LSHIFTAA_OP, MODE, TREE, TREE, EON,
      / LSHIFT_OP, MODE, TREE, TREE, EON,
      / LT_OP, MODE, TREE, TREE, EON,
      / MODULE_OP, SPECIAL, EON,
      / MULAA_OP, MODE, TREE, TREE, EON,
      / MUL_OP, MODE, TREE, TREE, EON,
      / NEG_OP, MODE, TREE, EON,
      / NEXT_OP, INT, EON,
      / NE_OP, MODE, TREE, TREE, EON,
      / NOT_OP, MODE, TREE, EON,
      / NULL_OP, SPECIAL, EON,
      / OBJECT_OP, MODE, INT, EON,
      / ORAA_OP, MODE, TREE, TREE, EON,
      / OR_OP, MODE, TREE, TREE, EON,
      / POSTDEC_OP, MODE, TREE, TREE, EON,
      / POSTINC_OP, MODE, TREE, TREE, EON,
      / PREDEC_OP, MODE, TREE, TREE, EON,
      / PREINC_OP, MODE, TREE, TREE, EON,
      / PROC_CALL_ARG_OP, MODE, TREE, TREE, EON,
      / PROC_CALL_OP, MODE, TREE, TREE, EON,
      / PROC_DEFN_ARG_OP, INT, INT, INT, INT, TREE, EON,
      / PROC_DEFN_OP, INT, INT, STRING, TREE, TREE, EON,
      / REFTO_OP, MODE, TREE, EON,
      / REMAA_OP, MODE, TREE, TREE, EON,
      / REM_OP, MODE, TREE, TREE, EON,
      / RETURN_OP, TREE, EON,
      / RSHIFTAA_OP, MODE, TREE, TREE, EON,
      / RSHIFT_OP, MODE, TREE, TREE, EON,
      / SAND_OP, MODE, TREE, TREE, EON,
      / SELECT_OP, MODE, INT, TREE, EON,
      / SEQ_OP, TREE, TREE, EON,
      / SOR_OP, MODE, TREE, TREE, EON,
      / SUBAA_OP, MODE, TREE, TREE, EON,
      / SUB_OP, MODE, TREE, TREE, EON,
      / SWITCH_OP, MODE, TREE, TREE, EON,
      / UNDEFINE_DYNM_OP, INT, EON,
      / WHILE_LOOP_OP, TREE, TREE, EON,
      / XORAA_OP, MODE, TREE, TREE, EON,
      / XOR_OP, MODE, TREE, TREE, EON,
      / ZERO_INITIALIZER_OP, UNS, TREE, EON,
      / FIELD_OP, MODE, INT, INT, TREE, EON,
      / CHECK_RANGE_OP, MODE, TREE, TREE, TREE, INT, EON,
      / CHECK_UPPER_OP, MODE, TREE, TREE, INT, EON,
      / CHECK_LOWER_OP, MODE, TREE, TREE, INT, EON

   integer op, p, p2, size, word, aval (4), i
   integer get

   character str (MAXLINE)
   save str

   must_get_node (op, file, line_num)

   if (op < 1 || op > CHECK_LOWER_OP)
      {
      call print (ERROUT, "*i*n"s, op)
      call errmsg ("bad operator in tree"p)
      return
      }

   select (op)    # handle the special cases
      when (CONST_OP)            # variable size, must be special-cased
         {
         must_get_node (word, file, line_num)
         call step
         call print (STDOUT, "constant, mode "s)
         call display_mode (word)
         must_get_node (size, file, line_num)
         call print (STDOUT, ", size *i"s, size)
         if (word == STOWED_MODE)
            {
            call print (STDOUT, ", value:*n"s)
            Indent += STEP_SIZE
            for (i = 0; i ~= size; i += 1)      # watch 2's comp arithmetic!
               {
               call step
               must_get_node (word, file, line_num)
               call print (STDOUT, "*,-8,0i*n"s, word)
               }
            Indent -= STEP_SIZE
            }
         else        # an arithmetic type
            {
            call print (STDOUT, ", value "s)
            if (size < 1 || size > 4)
               {
               call putch (NEWLINE, ERROUT)
               call errmsg ("bogus constant length"p)
               return
               }
            for (i = 1; i <= size; i += 1)
               must_get_node (aval (i), file, line_num)
            select (word)
               when (INT_MODE)
                  call print (STDOUT, "*i*n"s, aval)
               when (UNS_MODE)
                  call print (STDOUT, "*,-10i"s, aval)
               when (LONG_INT_MODE)
                  call print (STDOUT, "*l*n"s, aval)
               when (LONG_UNS_MODE)
                  call print (STDOUT, "*,-10l*n"s, aval)
               when (FLOAT_MODE)
                  call print (STDOUT, "*r*n"s, aval)
               when (LONG_FLOAT_MODE)
                  call print (STDOUT, "*d*n"s, aval)
            }
         return
         }

      when (NULL_OP)    # zero size
         {
         call step
         call display_op (NULL_OP)
         call putch (NEWLINE, STDOUT)
         return
         }

      when (SEQ_OP)        # funny indentation convention here
         {
         call step
         call display_op (SEQ_OP)
         call putch (NEWLINE, STDOUT)
         Indent += STEP_SIZE
         call display_tree (file, line_num)
         Indent -= STEP_SIZE
         call display_tree (file, line_num)
         return
         }

   # The general case:  use the operator formats in the table above
   #  to control printing of the fields

   p = posn (op + 1)
   if (info (p) ~= op)
      {
      call print (ERROUT, "interp:  table inconsistency at *i*n"p, op)
      stop
      }

   call step
   call display_op (op)
   call putch (NEWLINE, STDOUT)
   Indent += STEP_SIZE

   for (p2 = p + 1; info (p2) ~= EON; p2 += 1)
      select (info (p2))
         when (INT, UNS)
            {
            must_get_node (word, file, line_num)
            call step
            call print (STDOUT, "*i*n"s, word)
            }
         when (MODE)
            {
            must_get_node (word, file, line_num)
            call step
            call display_mode (word)
            call putch (NEWLINE, STDOUT)
            }
         when (TREE)
            call display_tree (file, line_num)
         when (STRING)
            {
            call get_string (str, file, line_num)
            call step
            call print (STDOUT, "'*s'*n"s, str)
            }
      else
         call errmsg ("bad table element in get_tree"p)

   Indent -= STEP_SIZE
   return
   end




# errmsg --- print error message, plus some useful information

   subroutine errmsg (msg)
   character msg (ARB)

   include GLOBAL_VARS

   call print (ERROUT, "interp *i/*i/*i: *p*n"p, El, Sl, Pl, msg)

   return
   end



# get --- get next word of data from a file

   integer function get (word, file, line_num)
   integer word, line_num
   file_des file

   integer readf

   if (readf (word, 1, file) == EOF)
      {
      word = NULL_OP + 1      # anything different from NULL
      return (EOF)
      }

   line_num += 1
   return (1)                 # anything different from EOF
   end



# get_string --- get length of string, then string from input file

   subroutine get_string (str, file, line_num)
   character str (MAXLINE)
   file_des file
   integer line_num

   integer length, i
   integer get

   if (get (length, file, line_num) == EOF)
      {
      call errmsg ("expected length of string"p)
      str (1) = EOS
      return
      }

   if (length < 0 || length > MAXLINE - 1)
      {
      call errmsg ("unreasonable string length"p)
      str (1) = EOS
      return
      }

   for (i = 1; i <= length; i += 1)
      if (get (str (i), file, line_num) == EOF)
         {
         call errmsg ("bogus string length or premature end of module"p)
         str (i) = EOS
         return
         }
   str (i) = EOS

   return
   end



# skipto --- skip (hopefully) to a given IMF operator in a file

   subroutine skipto (op, file, line_num)
   integer op, line_num
   file_des file

   integer val
   integer get

   while (get (val, file, line_num) ~= EOF && val ~= op)
      ;

   return
   end



# step --- print out enough blanks to get to proper indentation point

   subroutine step

   include GLOBAL_VARS

   character blanks (MAXLINE)
   data blanks /MAXCARD * ' 'c, EOS/

   integer pos

   pos = min0 (Indent, MAX_INDENT)
   call putlin (blanks (MAXLINE - pos), STDOUT)

   return
   end
