.hd lsmake "convert contiguous string to linked string" 01/03/83
pointer function lsmake (ptr, str)
pointer ptr
character str (ARB)
.sp
Library:  vlslb
.fs
The contiguous string in 'str' is copied into the linked string space
and a pointer to the string is returned both in 'ptr' and as the function
value.
.im
A new string is allocated with the same length as 'str' via a call to
'lsallo'.
Characters are then copied into the string using 'lsputc'.
.am
ptr
.ca
length, lsallo, lsputc
.bu
Locally supported.
.sa
lsextr (4)
