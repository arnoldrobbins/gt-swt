.hd lsgetc "get character from linked string" 03/23/80
character function lsgetc (ptr, c)
pointer ptr
character c
.sp
Library:  vlslb
.fs
The first character in the string specified by 'ptr' is extracted and
returned in 'c' and as the function value.  'Ptr' is updated to
point to the next character in the string, but is never advanced
beyond the EOS.
.im
Any pointers in the string are followed until a character is found.
The character becomes the value of the function.  If the character
was not EOS, 'ptr' is incremented, and any pointers in the string
are followed until the next character is found.
.am
ptr, c
.bu
Locally supported.
.sa
lsputc (4)
