[cc]mc |
.hd cck2 "Second phase of C program checker" 10/10/84
cck2
.ds
'Cck2' is the second phase of the UNIX (tm) 'lint' like
facility provided by the Georgia Tech Software Tools C compiler.
This program is normally not called directly by the user, but
instead via one of the C compiler interludes, with the '-y' option.
.sp
'Cck2' reads the (hopefully) sorted output of 'cck1', the first
phase of the C program checker.
It then prints messages detailing possible syntactic and semantic
errors in the given C program.
.es
prog.ck> cck1 | sort | cck2
.fl
?*.ck   file output by 'c1' with the '-y' option, used as input
to 'cck1'.
.me
Numerous and self explanatory.
.bu
.sp
.bf 100
This program is only available to licensees of Version 2.0
of the Georgia Tech C Compiler.
.bf 0
.sa
cc (1), ccl (1), ucc (1), c1 (5), cck1 (5),
.ul
User's Guide to the Georgia Tech C Compiler
[cc]mc
