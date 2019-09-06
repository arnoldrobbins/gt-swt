.hd mkq$xs "initialize a hardware defined queue" 06/28/82
integer function mkq$xs (ptr_to_free, room, qu)
shortcall mkq$xs (4)
.sp
pointer ptr_to_free
integer room
queue_control_block qu
.sp
Library: shortlb
Also declared in =incl=/shortlb.r.i
.fs
This function initializes a queue control block so it can be used by
the other queue functions.  Queues are a machine-defined data type
on higher-level Prime machines, and operations on queues are
guaranteed "atomic" (non-interruptable).  However, queues require
special definition.
.sp
Queues must be a fixed size in length, and that length must be
2 ** k words long, with 4 <= k <= 16.  Furthermore, the queue
must start on a 2 ** k word boundary.
.sp
To make things easier for the user, this function simply requires
that the user pass a pointer to a free area in memory, and the
length of that area ('ptr_to_free' and 'room', respectively).
The function then determines the largest queue that can fit into
that free area and still meet the queue-related requirements.
The function updates the queue control block 'qu' to reflect this
placement, and then returns the number of available words in
the queue as the function value.
.sp
If no queue can be allocated in the space provided, the function
returns a zero value.  It should be noted that it is possible that
the size of the queue created may be only half of the free area
due to the address boundary restrictions.  Non-zero function returns
are always (2 ** k) - 1.
.sp
The declaration 'queue_control_block' is defined in
=incl=/shortlb.r.i; this file should be included if
this routine is used.
.im
Implemented as a  PMA routine entered via a JSXB (shortcall).
.sp
Note that any routine using this call must be compiled using the
"-q" option of 'fc'.
.am
qu
.bu
The function uses 'qu' for some temporary values; 'qu' may be partially
initialized even if no queue can be created.
.sp
Locally supported.
.sa
abq$xs (4), atq$xs (4), fc (1), rbq$xs (4), rtq$xs (4), tsq$xs (4),
[ul System Architecture Reference Guide] (Prime PDR 3060)
