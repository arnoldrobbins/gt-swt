[cc]mc |
.hd set_copy "make a copy of one set in another" 07/20/84
[cc]mc
subroutine set_copy (source, destination)
pointer source, destination
.sp
[cc]mc |
Library: vswtmath (Subsystem mathematical library)
[cc]mc
.fs
'Set_copy' duplicates one set in another.
For proper operation, the source set should be larger than or
equivalent in size to the destination set.
The source set is not altered by the copy operation.
.sp
All set manipulation routines make use of dynamic storage,
which must be initialized before use.
See 'dsinit' for further information.
.sp
Note that all set manipulation routines have long names.
To avoid unique name conflicts with other routines, any Ratfor
program using the set routines should include the following
statement:
.sp
.ti +5
[cc]mc |
include "=src=/lib/math/swtmlb_link.r.i"
[cc]mc
.im
'Set_copy' uses the size field encoded in the first word of
each set to determine the number of words in the bit vector
to be copied.
A simple loop implements the copy.
.bu
Should handle sets of different sizes properly.
.sa
other set operations ('set_?*') (4)
