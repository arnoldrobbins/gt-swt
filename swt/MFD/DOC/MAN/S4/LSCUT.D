.hd lscut "divide a linked string into two linked strings" 02/25/80
pointer function lscut (ptr1, pos, ptr2)
pointer ptr1, ptr2
integer pos
.sp
Library:  vlslb
.fs
The string specified by 'ptr1' is divided following position 'pos'.  The
first half of the string is returned in 'ptr1', and the second half is
returned in 'ptr2' and as the value of the function.
.im
The string specified by 'ptr1' is positioned with 'lspos'
to position 'pos'.
A new string of length 1 is allocated, and the character at position
'pos' is placed in the new string.  A pointer is placed in position 'pos'
to the new string.  'Ptr2' and the function are given the value of the
string position after position 'pos'.
.am
ptr1, ptr2
.ca
lsallo, lsgetc, lspos, lsputc
.bu
Locally supported.
.sa
lsjoin (4), lssubs (4)
