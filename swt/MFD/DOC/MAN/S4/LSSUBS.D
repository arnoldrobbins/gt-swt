.hd lssubs "take a substring of a linked string" 03/23/80
pointer function lssubs (ptr, pos, len)
pointer ptr
integer pos, len
.sp
Library:  vlslb
.fs
The value of the function is a pointer to a string containing
'len' characters from the string specified by 'ptr', starting at position
'pos'.
.im
A new string of length 'len' is allocated, the string specified by
'ptr' is positioned to 'pos', and 'len' characters are then copied
to the new string with calls to 'lsgetc' and 'lsputc'.
.ca
lsallo, lsgetc, lslen, lspos, lsputc
.bu
Locally supported.
.sa
lscut (4), lsdel (4), lsdrop (4), lstake (4)
