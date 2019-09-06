.hd lsextr "extract contiguous string from linked string" 02/25/80
integer function lsextr (ptr, str, max)
pointer ptr
character str (ARB)
integer max
.sp
Library:  vlslb
.fs
The linked string specified by 'ptr' is copied
into 'str'.  No more than 'max' positions of 'str' will be used.
.im
Characters from the linked string are extracted using 'lsgetc' and
placed in consecutive positions of 'str'.
.am
str
.ca
lsgetc
.bu
Locally supported.
.sa
lsmake (4)
