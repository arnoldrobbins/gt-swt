.hd put$xs "put a character (byte) into an array" 06/25/82
subroutine put$xs (array, position, char)
shortcall put$xs (4)
.sp
untyped array (ARB)
integer position
character char
.sp
Library: shortlb
Also declared in =incl=/shortlb.r.i
.fs
This routine inserts a byte quantity into 'array' at 'position',
using highly efficient indexing and byte swapping operations.
The byte is assumed to be the least significant byte of 'char'.
.im
Implemented as a simple PMA routine entered via a JSXB (shortcall).
.sp
Note that any routine using this call must be compiled using the
"-q" option of 'fc'.
.am
array
.bu
Does no bounds checking on the array (standard FTN problem),
but this may also be seen as a good point.
.sp
Locally supported.
.sa
fc (1), get$xs (4)
