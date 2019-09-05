.hd strcmp "compare strings and return 1 2 or 3 for < = or >" 03/23/80
integer function strcmp (str1, str2)
character str1 (ARB), str2 (ARB)
.sp
Library:  vswtlb (standard Subsystem library)
.fs
'Strcmp' is a generalized string comparison routine.
The two arguments are EOS-terminated strings to be compared;
the function return is 1 if 'str1' is less than 'str2' (according
to the ordering of ASCII characters), 2 if 'str1' is equal to 'str2',
and 3 if 'str1' is greater than 'str2'.
.sp
If one string is a proper initial substring of the other, the longer
string is always found to be greater.
.im
Character-at-a-time comparison loop.
Function return depends on which string hit EOS first, or on
ASCII ordering of character codes.
.sa
equal (2), length (2)
