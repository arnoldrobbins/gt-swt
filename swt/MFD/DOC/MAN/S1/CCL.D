[cc]mc |
.hd ccl  "compile and load a C program" 10/10/84
ccl [<pathname>] [<'ld' args>] [/ <'cc' args>]
.ds
'Ccl' is a shell program that
compiles and loads the C program in <pathname>.
If 'ccl' is invoked with no <pathname> argument,
it automatically processes the last program edited,
since it shares the shell variable 'f' with the shell program 'e'.
If the source file name specified in <pathname> does not have a
".c" suffix, 'ccl' will append a ".c" and attempt to process a
file with that name.
The ".c" suffix on the source file name is not required, although
'ccl' requires that the source code reside in a file named with
a ".c" suffix.
The executable code is stored in <pathname>,
or a file named appropriately from <'ld' args>
(e.g., "-o gorf") or from <'cc' args> (e.g., "-b bonzo").
.sp
Options for 'ld' (names of libraries, for example) may follow
the name of the source file, e.g. "ccl prog -l mylib".
Special options for 'cc' may be placed after the 'ld' options,
as long as they are separated by an argument consisting only
of a slash; for example, "ccl prog -l mylib / -f".
Aberrent command syntax may produce bizarre results.
.es
ccl      # cc and ld the last file edited with 'e'
.sp
ccl profile
ccl profile.c
.sp
ccl change -l mylib
.me
"<source_file>:  can't open" for missing ".c" file
.bu
.bf 100
This program is only available to licensees of Version 2.0
of the Georgia Tech C Compiler.
.bf 0
.sa
compile (1), cc (1), vcg (1), ld (1), ucc (1), c1 (5), bind (3),
.ul
User's Guide for the Georgia Tech C Compiler
[cc]mc
