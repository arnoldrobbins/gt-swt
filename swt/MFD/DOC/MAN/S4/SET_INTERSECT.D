[cc]mc |
.hd set_intersect "place intersection of two sets in a third" 07/20/84
[cc]mc
subroutine set_intersect (set1, set2, destination)
pointer set1, set2, destination
.sp
[cc]mc |
Library: vswtmath (Subsystem mathematical library)
[cc]mc
.fs
'Set_intersect' determines the intersection of the sets given as
its first two arguments and places that intersection in the set
specified by the third.
For proper operation, all three sets should be equal in size.
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
Does a word-by-word logical 'and' of the bit vectors for the
first two sets, placing the result in the third.
.bu
Should be fixed to work with sets of differing lengths.
.sa
other set routines ('set_?*') (4)
