
# initialize --- initialize everything

   subroutine initialize

   include "rp_com.i"

   integer i
   file_des fd
   file_des create, open, mktemp
   pointer mktabl

  # Open profile dictionary (if required):
   if (ARG_PRESENT (p)) {
      Prof_dict_file = create ("timer_dictionary"s, WRITE)
      if (Prof_dict_file == ERR)
         call remark ("timer_dictionary:  can't create*n"p)
      }

  # Initialize the translation table:
   Tlit_eos = EOS
   for (i = 1; i <= MAXCHARVAL; i += 1)
      Tlit_char (i) = i - 1

  # Load the translation table if necessary:
   if (ARG_PRESENT (x)) {
      fd = open (ARG_TEXT (x), READ)
      if (fd == ERR)
         call print (ERROUT, "*s: can't open trans table*n"s, ARG_TEXT (x))
      else {
         call load_trans_table (fd)
         call close (fd)
         }
      }

  # Reset the first statement flag:
   First_stmt = NO

  # Procedure table indices:
   Scope_sp = 0
   Proc_table = 0

  # Subprogram number:
   Spnum = 0

  # Error context area:
   Error_sym (1) = EOS

  # Input buffer:
   Ibp = PBLIMIT
   Inbuf (PBLIMIT) = EOS

  # Outbuf buffers:
   do i = 1, MAXSTREAM
      Outp (i) = 0

  # Temporary files (but not temporary #1):
   do i = 2, MAXSTREAM
      Outfile (i) = mktemp (READWRITE)

  # Loop-stack pointer:
   Loop_sp = 0

  # Expression stack pointer
   Expr_stack_ptr = 0

  # Current label:
   Curlab = START_LAB

  # Brace nesting depth
   Brace_count = 0

  # Dispatch code suppression flag:
   Dispatch_flag = NO
   Last_dispatch_flag = NO

  # Goto management tables:
   if (ARG_PRESENT (g))
      do i = 1, MAXGOHASH; {
         Xgo_from (i) = 0
         Xgo_to (i) = 0
         }
   Lgo_lp = 1

  # Indentation flag:
   Indent = 0

  # Module name:
   call scopy (".main."s, 1, Module_name, 1)
   call scopy (".main."s, 1, Module_long_name, 1)

  # Dynamic storage area:
   call dsinit (MEMSIZE)

  # Identifier table:
   Id_table = mktabl (SYMINFOSIZE)

  # Unique name table:
   Uname_table = mktabl (0)

  # Last generated variable name:
   Last_var (1) = EOS

  # Line number of current code line:
   Code_line_num = 1

  # Ratfor reserved words:
   call enter_kw ("string"s,          STRINGSYM)
   call enter_kw ("stringtable"s,     STRINGTABLESYM)
   call enter_kw ("linkage"s,         LINKAGESYM)
   call enter_kw ("procedure"s,       PROCEDURESYM)
   call enter_kw ("recursive"s,       RECURSIVESYM)
   call enter_kw ("forward"s,         FORWARDSYM)
   call enter_kw ("local"s,           LOCALSYM)
   call enter_kw ("if"s,              IFSYM)
   call enter_kw ("else"s,            ELSESYM)
   call enter_kw ("for"s,             FORSYM)
   call enter_kw ("while"s,           WHILESYM)
   call enter_kw ("repeat"s,          REPEATSYM)
   call enter_kw ("until"s,           UNTILSYM)
   call enter_kw ("case"s,            CASESYM)
   call enter_kw ("do"s,              DOSYM)
   call enter_kw ("return"s,          RETURNSYM)
   call enter_kw ("break"s,           BREAKSYM)
   call enter_kw ("next"s,            NEXTSYM)
   call enter_kw ("stop"s,            STOPSYM)
   call enter_kw ("goto"s,            GOTOSYM)
   call enter_kw ("call"s,            CALLSYM)
   call enter_kw ("end"s,             ENDSYM)
   call enter_kw ("include"s,         INCLUDESYM)
   call enter_kw ("define"s,          DEFINESYM)
   call enter_kw ("undefine"s,        UNDEFINESYM)
   call enter_kw ("select"s,          SELECTSYM)
   call enter_kw ("when"s,            WHENSYM)
   call enter_kw ("ifany"s,           IFANYSYM)

  # Fortran keywords:
   call enter_kw ("continue"s,        FORTSYM)
   call enter_kw ("complex"s,         TYPESYM)
   call enter_kw ("logical"s,         TYPESYM)
   call enter_kw ("implicit"s,        MISCDECLSYM)
   call enter_kw ("parameter"s,       MISCDECLSYM)
   call enter_kw ("external"s,        MISCDECLSYM)
   call enter_kw ("dimension"s,       MISCDECLSYM)
   call enter_kw ("integer"s,         TYPESYM)
   call enter_kw ("equivalence"s,     EQUIVALENCESYM)
   call enter_kw ("function"s,        FUNCTIONSYM)
   call enter_kw ("subroutine"s,      SUBROUTINESYM)
   call enter_kw ("common"s,          MISCDECLSYM)
   call enter_kw ("data"s,            DATASYM)
   call enter_kw ("trace"s,           FORTSYM)
   call enter_kw ("save"s,            MISCDECLSYM)
   call enter_kw ("real"s,            TYPESYM)
   call enter_kw ("doubleprecision"s, TYPESYM)
   call enter_kw ("blockdata"s,       BLOCKDATASYM)
   call enter_kw ("stackheader"s,     MISCDECLSYM)
   call enter_kw ("shortcall"s,       MISCDECLSYM)
   call enter_kw ("stmtfunc"s,        STMTFUNCSYM)

   return
   end



# enter_kw --- place key word in identifier table

   subroutine enter_kw (kw, val)
   packed_char kw (ARB)
   integer val

   include "rp_com.i"

   untyped info (SYMINFOSIZE)

   info (SYMBOLTYPE) = KEYWD_SYMBOLTYPE
   info (SYMBOLVAL) = val
   call enter (kw, info, Idtable)

   return
   end



# cleanup --- perform housekeeping chores before shutting down

   subroutine cleanup

   include "rp_com.i"

   integer i

  # Remove work files (but not #1):
   do i = 2, MAXSTREAM
      call rmtemp (Outfile (i))

  # Close the profile dictionary (if used):
   if (ARG_PRESENT (p))
      call close (Prof_dict_file)

   return
   end



# load_trans_table --- load the character translation table

   subroutine load_trans_table (fd)
   file_des fd

   include "rp_com.i"

   integer i
   integer getlin, equal
   character c1, c2
   character str (MAXLINE), word (MAXLINE)
   character get_trans_char

   while (getlin (str, fd) ~= EOF) {

      i = 1
      call getwrd (str, i, word)
      if (equal (word, "EOS"s) == YES || equal (word, "eos"s) == YES) {
         call getwrd (str, i, word)
         Tlit_eos = get_trans_char (word)
         }
      else {
         c1 = get_trans_char (word)
         call getwrd (str, i, word)
         c2 = get_trans_char (word)

         if (c1 < 0 || c1 >= MAXCHARVAL || c2 < 0 || c2 >= MAXCHARVAL)
            call print (ERROUT, "bad trans table entry: *s"s, str)
         else
            Tlit_char (c1 + 1) = c2
         }
      }

   return
   end



# get_trans_char --- look a character, mnemonic, or integer for trans table

   character function get_trans_char (word)
   character word (ARB)

   integer i
   integer mntoc, gctoi
   character c

   i = 1
   c = mntoc (word, i, MAXCHARVAL)
   if (c == MAXCHARVAL) {
      i = 1
      c = gctoi (word, i, 10)
      if (word (i) ~= EOS)
         c = MAXCHARVAL
      }

   return (c)
   end
