[cc]mc |
.hd set_union "place union of two sets in a third" 07/20/84
[cc]mc
subroutine set_union (set1, set2, destination)
pointer set1, set2, destination
.sp
[cc]mc |
Library: vswtmath (Subsystem mathematical library)
[cc]mc
.fs
'Set_union' computes the union of 'set1' and 'set2', placing
the result in 'destination'.
For proper operation, all three sets should be the same size.
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
The set union is computed by logically 'or'ing the bit vectors
associated with 'set1' and 'set2'.
.bu
Should work with sets of differing sizes.
.sa
other set routines ('set_?*') (4)
