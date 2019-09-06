.hd atq$xs "add an element to the top of a queue" 06/28/82
logical function atq$xs (qu, addition)
shortcall atq$xs (4)
.sp
queue_control_block qu
untyped addition
.sp
Library: shortlb
Also declared in =incl=/shortlb.r.i
.fs
This routine adds a 16 bit quantity (the contents of 'addition')
to the top of a circular queue
(deque) structure at 'qu'.
The function result is TRUE if the addition was
done, FALSE if the queue was full (before the call).
.sp
The declaration 'queue_control_block' is defined in
=incl=/shortlb.r.i; this file should be included if
this routine is used.
.im
Implemented as a simple PMA routine entered via a JSXB (shortcall).
The hardware ATQ instruction is executed on the arguments.
.sp
Note that any routine using this call must be compiled using the
"-q" option of 'fc'.
.am
qu
.bu
The routine makes no attempt to validate the argument passed as a queue
control block.
.sp
Locally supported.
.sa
abq$xs (4), fc (1), mkq$xs (4), rtq$xs (4), rbq$xs (4), tsq$xs (4),
.ul
System Architecture Reference Guide,
(Prime PDR 3060)
