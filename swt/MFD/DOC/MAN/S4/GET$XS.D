.hd get$xs "get a character (byte) from an array" 06/25/82
character function get$xs (array, position)
shortcall get$xs (4)
.sp
untyped array (ARB)
integer position
.sp
Library: shortlb
Also declared in =incl=/shortlb.r.i
.fs
This routine extracts a byte quantity from the specified array
using highly efficient indexing and byte swapping operations.
.im
Implemented as a simple PMA routine entered via a JSXB (shortcall).
.sp
Note that any routine using this call must be compiled using the
"-q" option of 'fc'.
.bu
Does no bounds checking on the array (standard FTN problem),
but this may also be seen as a good point.
.sp
Locally supported.
.sa
fc (1), put$xs (4)
