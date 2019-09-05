[cc]mc |
.hd set_init "cause a set to be empty" 07/20/84
[cc]mc
subroutine set_init (set)
pointer set
.sp
[cc]mc |
Library: vswtmath (Subsystem mathematical library)
[cc]mc
.fs
'Set_init' initializes a set created by 'set_create'.
An initialized set is empty, i.e. contains no members.
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
'Set_init' simply clears all elements of the bit vector
portion of the data structure addressed by its first
argument.
.sa
other set routines ('set_?*') (4)
