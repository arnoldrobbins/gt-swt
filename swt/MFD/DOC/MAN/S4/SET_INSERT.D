[cc]mc |
.hd set_insert "place given element in a set" 07/20/84
[cc]mc
subroutine set_insert (element, set)
integer element
pointer set
.sp
[cc]mc |
Library: vswtmath (Subsystem mathematical library)
[cc]mc
.fs
'Set_insert' is the primary means of placing a given element
in a set.
'Element' must be an integer between one and the maximum size
of the set, inclusive;
'set' must be a pointer to a set data structure created by
'set_create'.
If it is within range, the given element is marked "present"
in the bit vector associated with the set.
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
If the element is out of range, a call to 'error' is made to
inform the user and terminate the program.
Otherwise, the location of the element in the bit vector is determined
and a few logical operations are employed to set the selected bit.
.ca
error
.sa
other set routines ('set_?*') (4)
