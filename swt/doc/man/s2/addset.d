.hd addset "put character in a set if it fits" 05/29/82
integer function addset (c, set, j, maxsiz)
character c, set (maxsiz)
integer j, maxsiz
.sp
Library:  vswtlb (standard Subsystem library)
.fs
'Addset' puts the character 'c' in the array 'set' at position 'j'
and increments 'j', provided that 'j' is not greater than 'maxsiz'.
The function return is YES if 'c' was inserted, NO otherwise.
.im
Trivial.
.am
set, j
