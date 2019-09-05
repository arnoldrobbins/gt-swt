.hd lsgetf "read an arbitrarily long linked string" 01/03/83
integer function lsgetf (ptr, fd)
pointer ptr
file_des fd
.sp
Library:  vlslb
.fs
'Lsgetf' reads characters from the file specified by 'fd' into a
linked string until a NEWLINE character is read. A pointer to the
string is returned in 'ptr'. The function value is the number of
characters read, or EOF if end-of-file was encountered before a
NEWLINE was seen.
.im
A new string of zero length is allocated with a call to 'lsallo'
and 'ptr' is set to point to it.  Subroutine 'getlin' is then
called repeatedly until a line whose last character (before the
EOS) is a NEWLINE is returned, or end-of-file is encountered.
Each line returned is then joined to the end of the linked string
with a call to 'lsjoin'.  If EOF is encountered before a NEWLINE
is seen, the entire string is deallocated with a call to 'lsfree'.
.am
ptr
.ca
getlin, lsallo, lsjoin, lsmake, lspos
.bu
Locally supported.
.sa
lsputf (4)
