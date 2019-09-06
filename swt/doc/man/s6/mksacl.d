[cc]mc |
.hd mksacl "encode ACL information into a SWT structure" 09/04/84
integer function mksacl (path, pairs, type, sep)
character path (ARB), pairs (ARB), sep (ARB)
integer type
.sp
Library: vswtlb (standard Subsystem library)
.fs
'Mksacl' converts ACL information like that returned by 'gtacl$'
into SWT ACL information in the ACL common block. The name of the
pathname is returned in 'path', the string containing the access
pairs is returned in 'pairs', and the type is returned in 'type'.
'Sep' is a string that is to be placed between each of the access
pairs. The function return is the number of characters in 'pairs'.
.im
The ACL common block is scanned for information and encoded into
'pairs'. After each pair is entered, 'sep' is encoded into the
string. The number of characters is returned as the function return.
.ca
ctoc (2), encode (2)
.sa
lacl (1), sacl (1), gfdata (2), sfdata (2)
[cc]mc
