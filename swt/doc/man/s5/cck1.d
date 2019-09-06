[cc]mc |
.hd cck1 "First phase of C program checker" 10/10/84
cck1
.ds
'Cck1' is the first phase of the UNIX (tm) 'lint' like
facility provided by the Georgia Tech Software Tools C compiler.
This program is normally not called directly by the user, but
instead via one of the C compiler interludes, with the '-y' option.
.sp
'Cck1' reads a '.ck' file on its first standard input, and produces
output which should be sorted and passed on to the second phase,
'cck2'.
.sp
The '.ck' file is produced automatically by 'c1' when the '-y'
option is passed on to it from one of the compiler interludes.
.es
prog.ck> cck1 | sort | cck2
.fl
?*.ck   file output by 'c1' with the '-y' option, used as input
to 'cck1'.
.me
"Too many nesting levels"
.sp
"Nesting stack overflow"
.# beats me what they mean....  A.D.R.
.bu
.sp
.bf 100
This program is only available to licensees of Version 2.0
of the Georgia Tech C Compiler.
.bf 0
.sa
cc (1), ccl (1), ucc (1), c1 (5), cck2 (5),
.ul
User's Guide to the Georgia Tech C Compiler
[cc]mc
