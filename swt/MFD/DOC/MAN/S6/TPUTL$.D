.hd tputl$ "put a line on the terminal" 01/06/83
integer function tputl$ (line, fd)
character line (ARB)
integer fd
.sp
Library:  vswtlb (standard Subsystem library)
.fs
'Tputl$' is the device-dependent driver called by 'putlin' to write a string
on a terminal file.  The first argument is the string to be written; the second
is the file descriptor of a terminal file.  The function return is OK if the
write was successful, ERR otherwise.
.im
'Tputl$' buffers each character in the string into a local buffer,
and outputs the string in chunks (via calls to the Primos routine
TNOUA).
If case mapping is in effect, characters not on a KSR 33 keyboard
are converted to escaped representations which are printable on a
KSR 33.
.ca
Primos tnoua
.sa
tgetl$ (6), dputl$ (6), putlin (2)
