[cc]mc |
.hd cc "compile a C program" 10/10/84
cc [<pathname>] [-afy]
                {-D<name>[=<val>] | -I<dir>}
                [-b[<b_pathname>]]
                [-s[<s_pathname>]]
                [-u<u_number>]
.ds
'Cc' compiles the C program in <pathname>.
It is an error to invoke 'cc' without a path name.
The ".c" suffix on the source file name is optional, although
'cc' requires that the source code reside in a file named with
a ".c" suffix.
If the source file name specified in <pathname> does not have a
".c" suffix, 'cc' will append a ".c" and attempt to process a
file with that name.
The object code is stored in "<pathname>.b".
.sp
A full description of the C language is beyond the scope of this
document.  For complete information, refer to [ul The C Programming Language]
by Brian W. Kernighan and Dennis M. Ritchie (Prentice-Hall, 1978).
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
-b\Compile the source code into the object file named "<b_pathname>".
'Cc' effectively ignores this option if <b_pathname> is
unspecified.
.sp
.ti -5
-f\Suppress automatic inclusion of standard definitions file.
Macro and common block definitions for the C Standard I/O Library
and interfacing with the Subsystem reside in the file "=cdefs=".
'Cc' will process these definitions automatically, unless the
"-f" option is specified.
.sp
.ti -5
-s\Compile the source code into a PMA file named "<s_pathname>".
The object code will be left in a file named
"<s_pathname>.b" (".s" suffix replaced by ".b").
If <s_pathname> is not specified, 'cc' places the compiler output
in "<pathname>.s" and the object module in "<pathname>.b".
The "<s_pathname>" will over-ride any path name given to the "-b" option.
In addition, 'cc' will [ul always] use 'vcg' to generate binary.
.sp
.ti -5
-u\Reserved.
.sp
.ti -5
-y\Check for potential problems, e.g. type mismatches.
(This is similar in purpose to the Unix 'lint' program.)
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
.es
cc file.c
cc prog.c -af
.me
Numerous and self-explanatory.
.bu
The "-a" flag doesn't always work yet.
.sp
The "-y" option complains about many things that are not problems.
For instance, it does not know about the run-time library.
.sp
.bf 100
This program is only available to licensees of Version 2.0
of the Georgia Tech C Compiler.
.bf 0
.sa
compile (1), ccl (1), ld (1), ucc (1), vcg (1), bind (3), c1 (5),
.ul
User's Guide for the Georgia Tech C Compiler
[cc]mc
