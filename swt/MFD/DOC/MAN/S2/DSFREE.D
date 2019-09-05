.hd dsfree "free a block of dynamic storage" 01/07/83
subroutine dsfree (block)
pointer block
.sp
Library:  vswtlb (standard Subsystem library)
.fs
'Dsfree' returns a block of storage allocated by 'dsget' to the
available space list.
The argument must be a pointer returned by 'dsget'.
.sp
See the remarks under 'dsget' for required initialization measures.
.im
'Dsfree' is an implementation of Algorithm B on page 440 of Volume 1
of [ul The Art of Computer Programming], by Donald E. Knuth.
The reader is referred to that source for detailed information.
.sp
'Dsfree' and 'dsget' maintain a list of free storage blocks,
ordered by address.
'Dsfree' searches the list to find the proper location for the block
being returned, and inserts the block into the list at that location.
If blocks on either side of the newly-returned block are available,
they are coalesced with the new block.
If the block address does not correspond to the address of any
allocated block, 'dsfree' remarks "attempt to free unallocated
block" and waits for the user to type a letter "c" to continue.
If any other character is typed, the program is terminated.
.ca
getlin, remark
.bu
The algorithm itself is not the best.
.sa
dsget (2), dsinit (2), dsdump (2), dsdbiu (6)
