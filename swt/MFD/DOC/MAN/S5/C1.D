[cc]mc |
.hd c1 "C compiler front end" 10/10/84
c1 [-afuy] { -D<name>[=<value>] } { -I<dir> } { <file> }
.ds
'C1' is a classical recursive-descent compiler for the C
programming language, performing lexical analysis,
preprocessing and parsing.
'C1' produces an "intermediate form" which can be
used by the virtual code generator ('vcg') to produce 64V-mode
relocatable object code, or PMA.
'C1' produces three files: "<file>.ct1" contains entry points,
"<file>.ct2" contains external definitions, and "<file>.ct3" contains
the intermediate form.
.sp
The following options are available:
.sp
.in +10
.ta 6
.tc \
.ti -5
-a\Abort all active shell programs if any errors were encountered
during processing.
This option is useful in shell programs like 'ccl' that wish to
inhibit compilation and loading if processing failed.
By default, this option is not selected;
that is, errors in processing do not terminate active
shell programs.
.sp
.ti -5
-f\Suppress automatic inclusion of the standard definitions file.
Macro and common block definitions for the C Standard I/O Library
and for interfacing with the Subsystem reside in the file "=cdefs=".
'C1' will process these definitions automatically, unless the
"-f" option is specified.
.sp
.ti -5
-u\Reserved.
.sp
.ti -5
-y\Check for potential problems, e.g. type mismatches.  If this
option is selected, messages are output in "<file>.ck".
.sp
.ti -5
-D\Defines the identifier <name> with optional <value> for
program internal use (maximum of 10).
.sp
.ti -5
-I\Specifies a directory where include files reside (maximum of 10).
All "-I" directories are searched after the current directory
and before "=incl=".
.in -10
.sp
.bf
NOTE:
This command is not meant to be directly invoked by the user.
Use one of the compiler interludes, 'cc', 'ccl', 'ucc', or 'compile'.
.es
c1 file.c
c1 prog.c -af
.me
Numerous and self-explanatory.
.bu
Several known compiler bugs exist.  See the
.ul
User's Guide for the Georgia Tech C Compiler.
.sa
.sp
.bf 100
This program is only available to licensees of Version 2.0
of the Georgia Tech C Compiler.
.bf 0
cc (1), ccl (1), compile (1), ucc (1), vcg (1),
.ul
User's Guide for the Georgia Tech C Compiler
[cc]mc
