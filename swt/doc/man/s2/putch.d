.hd putch "put a character on a file" 03/23/80
integer function putch (c, fd)
character c
file_des fd
.sp
Library:  vswtlb (standard Subsystem library)
.fs
'Putch' places the character 'c' on the file specified by file descriptor 'fd'.
If the attempt succeeds, 'putch' returns OK; otherwise, it returns ERR.
.im
'Putch' creates an internal buffer of two characters, the first being the
argument 'c' and the second being an EOS.  This buffer is written on the
specified file by a call to 'putlin'.
.ca
putlin
.sa
putlin (2), getch (2)
