.hd move$ "move blocks of memory around quickly" 03/28/80
subroutine move$ (from, to, count)
integer from (ARB), to (ARB), count
.sp
Library:  vswtlb  (standard Subsystem library)
.fs
'Move$' is the fastest way known to move a block of words from
one place to another in memory.
The argument 'from' is an array of words to be moved;
'to' is an array to receive a copy of the words in 'from';
'count' is the number of words to be moved.
.im
'Move$' is written in PMA, and uses multi-word load and store
instructions to move as much data as possible during each iteration
of a loop.
.am
to
.sa
scopy (2)
