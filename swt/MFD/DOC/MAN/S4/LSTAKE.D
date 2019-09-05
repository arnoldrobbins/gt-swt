.hd lstake "take characters from a linked string" 03/23/80
pointer function lstake (ptr, len)
pointer ptr
integer len
.sp
Library:  vlslb
.fs
The value of the function is a pointer to a string
consisting of the first 'len' characters of the string
specified by 'ptr'.
.im
A string of length 'len' is allocated, and the first 'len'
characters of the string specified by 'ptr' are copied into it
using 'lsgetc' and 'lsputc'.
.ca
lsallo, lsgetc, lsputc
.bu
Locally supported.
.sa
lsdrop (4), lssubs (4)
