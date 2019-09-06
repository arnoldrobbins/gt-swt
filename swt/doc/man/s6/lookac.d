[cc]mc |
.hd lookac "look up a name in the ACL common block" 09/04/84
integer function lookac (name)
character name (ARB)
.sp
Library: vswtlb (standard Subsystem library)
.fs
'Lookac' returns the index of 'name' in the ACL common block or
ERR if 'name' is not located.
.im
A linear search is used to scan the common block for the name. If
the name is found, its index is returned, otherwise the routine
returns ERR.
.ca
equal (2)
.sa
lacl (1), sacl (1), gfdata (2), sfdata (2)
[cc]mc
