.hd mapstr "map case of a string" 01/07/83
integer function mapstr (str, case)
character str (ARB)
integer case
.sp
Library:  vswtlb (standard Subsystem library)
.fs
'Mapstr' is used to map the case of all the letters in a string.
'Str' is the string to be mapped;
'case' is UPPER if letters are to be mapped to upper case,
anything else for lower case (usually LOWER).
.sp
The length of the string is returned as the function's value.
.im
A loop is used to examine each character in the string;
the actual mapping is done by adding or subtracting the
difference between ASCII 'a' and ASCII 'A'.
.am
str
.sa
mapup (2), mapdn (2), tlit (1)
