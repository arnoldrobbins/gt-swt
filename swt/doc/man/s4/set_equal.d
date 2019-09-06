[cc]mc |
.hd set_equal "return TRUE if two sets contain the same members" 07/20/84
[cc]mc
logical function set_equal (set1, set2)
pointer set1, set2
.sp
[cc]mc |
Library: vswtmath (Subsystem mathematical library)
[cc]mc
.fs
'Set_equal' determines if two sets contain the same members.
The sets need not be of equal length.
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
'Set_equal' makes two calls on 'set_subset'.
The function return is true if 'set1' is a subset of 'set2'
and 'set2' is a subset of 'set1', false otherwise.
.ca
set_subset
.sa
other set routines ('set_?*') (4)
