.hd dsget "obtain a block of dynamic storage" 01/07/83
pointer function dsget (w)
integer w
.sp
Library:  vswtlb (standard Subsystem library)
.fs
'Dsget' searches its available memory list for a block that is
at least as large as its first argument.
If such a block is found, its index in the memory list is returned;
otherwise, an error message is printed and the program terminates.
.sp
In order to use 'dsget', the following declarations must be present:
.sp
   integer mem (MEMSIZE)
   common /ds$mem/ mem
.sp
or the "DS_DECL" system macro can used for the declarations as follows:
.sp
   DS_DECL (mem, MEMSIZE)
.sp
where MEMSIZE is supplied by the user, and may take on any positive
value between 6 and 32767, inclusive.
Furthermore, memory must have been initialized with a call to 'dsinit':
.sp
   call dsinit (MEMSIZE)
.im
'Dsget' is an implementation of Algorithm A' on pages 437-438 of
Volume 1 of [ul The Art of Computer Programming], by Donald E. Knuth.
The reader is referred to that source for detailed information.
.sp
'Dsget' searches a linear list of available blocks for one of
sufficient size.
If none are available, a call to 'error' results;
otherwise, the block found is broken into two pieces, and the index
(in array 'mem') of the piece of the desired size is returned to
the user.
The remaining piece is left on the available space list.
Should this procedure cause a block to be left on the available
[cc]mc |
space list that is smaller than a threshold size, the few extra
[cc]mc
words are awarded to the user and the block is removed entirely,
thus speeding up the next search for space.
If insufficient space is available, 'dsget' reports "out of storage
space" and allows the user to obtain a dump of dynamic storage
space if he desires.
.ca
dsdump, error, getlin, remark
.bu
Should probably return error status to the user if space is not found.
It is also somewhat annoying for the user to have to declare
the storage area, but Fortran prevents effective use of pointers,
so this inconvenience is necessary for now.
.sa
dsfree (2), dsinit (2), dsdump (2), dsdbiu (6)
