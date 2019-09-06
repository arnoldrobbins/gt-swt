.hd equal "compare two strings for equality" 03/23/80
integer function equal (str1, str2)
character str1 (ARB), str2 (ARB)
.sp
Library:  vswtlb (standard Subsystem library)
.fs
'Equal' is used to compare EOS-terminated strings.   The two arguments are
the strings to be compared; the function return is YES if they are equal
(on a character-by-character basis), NO if they are not.
.im
'Equal' simply loops through each of the two strings, comparing characters.
If a mismatch occurs, NO is returned; otherwise, YES is returned.  Comparison
stops when an EOS is encountered.  To be equal, strings must be of equal
length (EOS's must match).
.sa
strcmp (2)
