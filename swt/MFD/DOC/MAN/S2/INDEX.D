.hd index "find index of a character in a string" 02/24/82
integer function index (str, c)
character str (ARB)
character c
.sp
Library:  vswtlb (standard Subsystem library)
.fs
'Index' searches the string given as its first argument for the character
given as its second argument.  If the character is found, its index in the
string is returned; if it is not found, zero is returned.
.im
A simple loop checks for the character in the string; if found, an
immediate return takes place.  If the loop terminates normally, the value
zero is returned.
.bu
The arguments should be reversed.
