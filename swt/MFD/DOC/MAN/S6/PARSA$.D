[cc]mc |
.hd parsa$ "parse ACL changes in the common block" 09/04/84
integer function parsa$ (str)
character str (ARB)
.sp
Library: vswtlb (standard Subsystem library)
.fs
'Parsa$' compares the protections given in 'str' with those already
in the common block and modifies the common block to reflect the
changes. If the changes are made, the function return is OK, otherwise
the function returns ERR.
.im
'Parsa$' goes through 'str' one pair at a time, calling 'lookac' to
locate a corresponding name and then comparing the differences. It
then changes the common block to reflect any modifications that have
been made and goes through and removes any deleted entries. If there
are any parse errors or erroneous attributes in 'str' the function
returns ERR.
.ca
equal (2), lookac (6), scopy (2)
.sa
lacl (1), sacl (1), gfdata (2), sfdata (2)
[cc]mc
