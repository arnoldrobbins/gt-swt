.hd tsq$xs "return the number of entries in a queue" 06/28/82
logical function tsq$xs (qu, count)
shortcall tsq$xs (4)
.sp
queue_control_block qu
integer count
.sp
Library: shortlb
Also declared in =incl=/shortlb.r.i
.fs
This function sets the variable 'count' to the number of entries
in the queue at 'qu'.  The function value is TRUE if the queue
is non-empty, FALSE if the queue has no entries.
.sp
The declaration 'queue_control_block' is defined in
=incl=/shortlb.r.i; this file should be included if
this routine is used.
.im
Implemented as a simple PMA routine entered via a JSXB (shortcall).
The hardware TSTQ instruction is executed on the arguments.
.sp
Note that any routine using this call must be compiled using the
"-q" option of 'fc'.
.am
count
.bu
The routine makes no attempt to validate the argument passed as a queue
control block.
.sp
Locally supported.
.sa
abq$xs (4), atq$xs (4), fc (1), mkq$xs (4), rtq$xs (4), rbq$xs (4),
.ul
System Architecture Reference Guide,
(Prime PDR 3060)
