.hd lslen "compute length of linked string" 03/23/80
integer function lslen (ptr)
pointer ptr
.sp
Library:  vlslb
.fs
The length of the string specified by 'ptr' is returned as the function
value.  'Ptr' is not modified.
.im
The number of characters in the string is counted by calling 'lsgetc'
until it returns EOS.  The length is computed as the number of calls
to 'lsgetc' minus 1.
.ca
lsgetc
.bu
Locally supported.
