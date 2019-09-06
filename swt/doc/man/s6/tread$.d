.hd tread$ "read raw words from the terminal" 03/25/82
integer function tread$ (buf, nw, f)
integer buf(ARB), nw
file_des f
.sp
Library:  vswtlb (standard Subsystem library)
.fs
'Tread$' is the device-dependent driver for terminal line-image i/o.
The first argument is an array to
receive the words read; the second argument is the number of words
to be read; the third argument is the file descriptor of the file
from which data will be read.
'Tread$' returns the number of words placed in the receiving buffer
if the read was successful, EOF otherwise.
'Tread$' is not intended for general use; it is not protected from user
error, and may cause termination of the user's program if used incorrectly.
It should always be referenced through 'readf'.
.im
'Tread$' calls the Primos subroutine C1IN 'nw' times, or until a NEWLINE
or EOF is encountered. C1IN gets the next character from the terminal
or command input stream.
.am
buf
.ca
Primos c1in
.bu
[cc]mc |
The semantics of 'tread$' are a little shaky; since one character per
[cc]mc
word is stored in a terminal buffer, 'tread$' actually reads characters
instead of raw words.
.sa
readf (2), dread$ (6)
