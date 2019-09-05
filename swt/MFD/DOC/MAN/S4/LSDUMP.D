.hd lsdump "dump linked string space for debugging" 01/03/83
subroutine lsdump
.sp
Library:  vlslb
.fs
The linked string space is dumped in semi-readable format to ERROUT.
.im
The string space is printed with various calls to 'print' and 'putch'.
Long sequences of 'empty' space are compressed.  Unprintable
characters are printed as octal values enclosed in angle brackets.
.ca
print, putch
.bu
Locally supported.
.sa
dump (1)
