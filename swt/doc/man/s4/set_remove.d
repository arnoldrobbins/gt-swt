[cc]mc |
.hd set_remove "remove a set that is no longer needed" 07/20/84
[cc]mc
subroutine set_remove (set)
pointer set
.sp
[cc]mc |
Library: vswtmath (Subsystem mathematical library)
[cc]mc
.fs
'Set_remove' reclaims the dynamic storage space used by
a set data structure.
It is the inverse of 'set_create'.
To prevent dynamic storage space from becoming irretrievably lost,
sets should always be removed by a call to 'set_remove' when they
are no longer needed.
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
Calls 'dsfree' to throw away the storage space used by the
internal data structure.
.ca
dsfree
.sa
other set routines ('set_?*') (4), dsinit (2), dsget (2), dsfree (2)
