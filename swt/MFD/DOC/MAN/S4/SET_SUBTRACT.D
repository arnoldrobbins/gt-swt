[cc]mc |
.hd set_subtract "place difference of two sets in a third" 07/20/84
[cc]mc
subroutine set_subtract (set1, set2, destination)
pointer set1, set2, destination
.sp
[cc]mc |
Library: vswtmath (Subsystem mathematical library)
[cc]mc
.fs
'Set_subtract' performs the set subtraction operation, i.e.
places in the set 'destination' those elements of 'set1' that are
not in 'set2'.
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
Since sets are represented as bit vectors, the subtraction operation
is performed by logically 'and'ing the elements of the first set
with the negation of the elements of the second set.
.bu
Should work with sets of differing sizes.
.sa
other set routines ('set_?*') (4)
