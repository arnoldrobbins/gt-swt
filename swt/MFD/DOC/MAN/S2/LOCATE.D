.hd locate "look for character in character class" 05/29/82
integer function locate (c, pat, offset)
character c, pat (MAXPAT)
integer offset
.sp
Library:  vswtlb (standard Subsystem library)
.fs
'Locate' returns YES if 'c' is a member of the character class
at 'pat(offset)', NO otherwise.
.im
A character class is stored as a size, followed by a vector of
characters in the class.
'Locate' simply checks all the characters in the vector;
if 'c' matches one, then the return value is YES.
.sa
makpat (2), omatch (2), amatch (2)
