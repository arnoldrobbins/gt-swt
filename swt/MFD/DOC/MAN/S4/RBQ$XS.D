.hd rbq$xs "remove an element from the bottom of a queue" 06/28/82
logical function rbq$xs (qu, item)
shortcall rbq$xs (4)
.sp
queue_control_block qu
untyped item
.sp
Library: shortlb
Also declared in =incl=/shortlb.r.i
.fs
This routine removes a 16 bit quantity (into the variable 'item')
from the bottom of a circular queue
(deque) structure at 'qu'.  The function result is TRUE if the
removal was done, FALSE if the queue was empty (before the call).
.sp
The declaration 'queue_control_block' is defined in
=incl=/shortlb.r.i; this file should be included if
this routine is used.
.im
Implemented as a simple PMA routine entered via a JSXB (shortcall).
The function executes the RBQ machine instruction.
.sp
Note that any routine using this call must be compiled using the
"-q" option of 'fc'.
.am
qu, item
.bu
The routine makes no attempt to validate the argument passed as a queue
control block.
.sp
Locally supported.
.sa
abq$xs (4), atq$xs (4), fc (1), mkq$xs (4), rtq$xs (4), tsq$xs (4),
[ul System Architecture Reference Guide] (Prime PDR 3060)
