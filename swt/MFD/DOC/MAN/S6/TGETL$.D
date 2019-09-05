.hd tgetl$ "read a line from the terminal" 03/25/82
integer function tgetl$ (buf, size, f)
character buf (ARB)
integer size
file_des f
.sp
Library:  vswtlb (standard Subsystem library)
.fs
'Tgetl$' is the device-dependent driver for terminal line-image i/o.
The first argument is a string to receive the line read; the second
argument is the maximum number of characters to be placed in the
string;
the third argument is the file descriptor of a terminal file.
The function return is either zero (when EOF is detected)
or the length of the string read in.
.im
'Tgetl$' first checks to see if the terminal buffer is empty.
If it is, then 'tcook$' is called to refill the buffer.
The characters in the terminal buffer are copied to the user
buffer 'buf' until either 'size' characters have been copied
or the terminal buffer has been exhausted.  The return value
is the number of characters that were copied into 'buf'.
.am
buf
.ca
tcook$
.sa
getlin (2), tputl$ (6), tcook$ (6)
