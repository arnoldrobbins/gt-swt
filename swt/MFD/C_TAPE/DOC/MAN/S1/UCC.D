[cc]mc |
.hd ucc "compile and load a C program (Unix-style)" 10/10/84
ucc { <input_files> } [ <cc_opts> ] [ <compile_opts> ]
.ds
'Ucc' is a "UNIX-style" C compiler and loader.   It does NOT,
however, behave like Unix's 'cc' or any other known Unix program!
.sp
'Ucc' compiles and loads the pathnames specified.
It assumes that all programs require C runtime support and
loads them accordingly.
.sp
'Ucc' recognizes the same set of options as 'cc'.
These are passed as C-specific options to 'compile'.
Any other options are passed on to 'compile' directly,
which does the real work of recognizing suffixes and compiling
and loading the files appropriately.
.sp
'Ucc' remains in existence mainly for compatibility
with the first release of the C compiler.
.es
ucc sort.c
ucc sort.c -ud  # the -ud is automatically passed on to 'ld'
ucc main.c lib.r lib.s -R-t
.bu
Has basically become obsolete.
.sp
.bf 100
This program is only available to licensees of Version 2.0
of the Georgia Tech C Compiler.
.bf 0
.sa
compile (1), cc (1), ccl (1), vcg (1), ld (1), bind (3),
.ul
User's Guide for the Georgia Tech C Compiler
[cc]mc
