.hd dsinit "initialize dynamic storage space" 03/25/82
subroutine dsinit (w)
integer w
.sp
Library:  vswtlb (standard Subsystem library)
.fs
'Dsinit' initializes an area of storage in the common block DS$MEM
so that the routines 'dsget' and 'dsfree' can be used for dynamic
storage allocation.
The memory to be managed must be supplied by the user, by two
declarations of the form:
.sp
   integer mem (MEMSIZE)
   common /ds$mem/ mem
.sp
or the "DS_DECL" system macro can be used for the declarations as follows:
.sp
   DS_DECL (mem, MEMSIZE)
.sp
The memory size (supplied by the user) must then be passed to
'dsinit' as its argument:
.sp
   call dsinit (MEMSIZE)
.im
'Dsinit' sets up an available space list consisting of two blocks,
the first empty and the second containing all remaining memory.
The first word of memory (below the available space list) is set
to the total size of memory; this information is used only by the
dump routines 'dsdump' and 'dsdbiu'.
.ca
error
.sa
dsget (2), dsfree (2), dsdump (2), dsdbiu (6)
