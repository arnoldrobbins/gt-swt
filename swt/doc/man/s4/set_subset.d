[cc]mc |
.hd set_subset "return TRUE if set1 is a subset of set2" 07/20/84
[cc]mc
logical function set_subset (set1, set2)
pointer set1, set2
.sp
[cc]mc |
Library: vswtmath (Subsystem mathematical library)
[cc]mc
.fs
'Set_subset' returns the logical value '.true.' if and only if
its first argument points to a set that is a subset of or equal
to the set pointed to by its second argument.
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
If one set is larger than the other, it is checked to make sure
that none of the higher-order elements is present.
The subset condition is then true if and only if every element
of 'set1' is also an element of 'set2', a statement which can
be checked a word at a time with the proper logical operations.
.ca
set_element
.sa
other set routines ('set_?*') (4)
