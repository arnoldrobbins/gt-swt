
# initialize --- initialize everything

   subroutine initialize

   include "link_com.i"

   integer i
   file_des create
   pointer mktabl

  # Open profile dictionary (if required):
#   if (ARG_PRESENT (p)) {
#      Prof_dict_file = create ("timer_dictionary"s, WRITE)
#      if (Prof_dict_file == ERR)
#         call remark ("timer_dictionary:  can't create*n"p)
#      }

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
   Inbuf (Ibp) = EOS

  # Outbuf buffers:
   do i = 1, MAXSTREAM
      Outp (i) = 0

  # Temporary files:
   do i = 1, MAXSTREAM
      Outfile (i) = mktemp (READWRITE)

  # Loop-stack pointer:
   Loop_sp = 0

  # Expression stack pointer
   Expr_stack_ptr = 0

  # Current label:
   Curlab = START_LAB

  # Brace nesting depth
   Brace_count = 0

  # Dispatch code suppression flag
   Dispatch_flag = NO

  # Indentation flag
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
   call enter_kw ("external"s,        EXTERNALSYM)   #changed
   call enter_kw ("dimension"s,       MISCDECLSYM)
   call enter_kw ("integer"s,         TYPESYM)
   call enter_kw ("equivalence"s,     MISCDECLSYM)
   call enter_kw ("function"s,        FUNCTIONSYM)
   call enter_kw ("subroutine"s,      SUBROUTINESYM)
   call enter_kw ("common"s,          COMMONSYM)     #changed
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

   include "link_com.i"

   untyped info (SYMINFOSIZE)

   info (SYMBOLTYPE) = KEYWD_SYMBOLTYPE
   info (SYMBOLVAL) = val
   call enter (kw, info, Idtable)

   return
   end



# cleanup --- perform housekeeping chores before shutting down

   subroutine cleanup

   include "link_com.i"

   integer i

  # Remove work files:
   do i = 1, MAXSTREAM
      call rmtemp (Outfile (i))

  # Close the profile dictionary (if used):
#   if (ARG_PRESENT (p))
#      call close (Prof_dict_file)

   return
   end



