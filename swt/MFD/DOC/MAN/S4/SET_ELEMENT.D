[cc]mc |
.hd set_element "see if a given element is in a set" 07/20/84
[cc]mc
integer function set_element (element, set)
integer element
pointer set
.sp
[cc]mc |
Library: vswtmath (Subsystem mathematical library)
[cc]mc
.fs
'Set_element' returns 1 if 'element' is a member of the set 'set',
0 otherwise.
The argument 'element' must be
an integer from 1 to the maximum size of the set, inclusive.
The argument 'set' must have been created beforehand with 'set_create'.
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
If 'element' is not in the range of allowable set elements for the
given set, the program is terminated by a call to 'error'.
Otherwise, the location of the element in the bit vector is calculated,
and the function returns the value of the bit at that position.
.ca
error
.sa
other set routines ('set_?*') (4)
