[cc]mc |
.hd set_delete "remove given element from a set" 07/20/84
[cc]mc
subroutine set_delete (element, set)
integer element
pointer set
.sp
[cc]mc |
Library: vswtmath (Subsystem mathematical library)
[cc]mc
.fs
'Set_delete' is used to remove a given element from a set.
The first argument is the element (an integer between one and
the maximum set size, inclusive), and the second is the set
from which it is to be removed.
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
The element selected is compared to the size field of the set;
if invalid, 'set_delete' prints an error message and terminates
the program.
Otherwise, the position of the element in the bit vector is calculated,
and the bit is reset by straightforward logical operations.
.ca
error
.sa
other set operations ('set_?*') (4)
