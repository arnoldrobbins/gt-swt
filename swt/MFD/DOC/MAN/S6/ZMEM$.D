.hd zmem$ "clear an uninitialized part of a segment" 03/25/82
subroutine zmem$ (node)
integer node (5)
.sp
Library:  vswtlb (standard Subsystem library)
.fs
"Zmem$" zeroes a block of memory in segment "node(2)" starting
at word "node(4)" through "node(5)".
.im
Trivial.
.sa
ldseg$ (6)
