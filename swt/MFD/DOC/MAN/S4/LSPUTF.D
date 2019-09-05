.hd lsputf "write an arbitrarily long linked string" 03/23/80
subroutine lsputf (ptr, fd)
pointer ptr
file_des fd
.sp
Library:  vlslb
.fs
The linked string specified by 'ptr' is written to the file
described by 'fd'.
.im
A section of the string no more than MAXLINE characters in length
is extracted using 'lsextr' and written to the file with 'putlin'.
The section just extracted is skipped over with a call to 'lspos'
and the process is repeated until the EOS is encountered.
.ca
lsextr, lspos, putlin
.bu
Locally supported.
.sa
lsgetf (4)
