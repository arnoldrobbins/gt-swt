[cc]mc |
.hd set_create "generate a new, initially empty set" 07/20/84
[cc]mc
pointer function set_create (set, size)
pointer set
integer size
.sp
[cc]mc |
Library: vswtmath (Subsystem mathematical library)
[cc]mc
.fs
'Set_create' is used to create a Pascal-style bit vector representation
for a set of integers from 1 to 'size'.
The function return and the variable 'set' are set to the address
in dynamic storage of the newly-created set.
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
'Set_create' calls 'dsget' to obtain a contiguous array of 16-bit
words that is large enough to represent a bit vector with 'size'
elements.
The first word of this array is set to 'size' for use by other
set manipulation routines.
A call to 'set_init' then insures that the new set is empty.
.am
set
.ca
dsget, set_init
.sa
other set routines ('set_?*') (4)
