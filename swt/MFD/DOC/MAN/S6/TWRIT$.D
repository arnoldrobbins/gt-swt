.hd twrit$ "write raw words to terminal" 03/25/82
integer function twrit$ (buf, nw, f)
integer buf (ARB), nw
file_des f
.sp
Library:  vswtlb (standard Subsystem library)
.fs
'Twrit$' is the device-dependent driver for terminal line-image i/o.
The first argument is a string  of words to be written;
the second argument is the number of words
to be written; and, the third argument is the file descriptor of the file
to which data will be written.
'Twrit$' returns the number of words written (which should always equal
'nw').
'Twrit$' is not intended for general use; it is not protected from user
error, and may cause termination of the user's program if used incorrectly.
It should always be referenced through 'writef'.
.im
'Twrit$' calls the Primos subroutine T1OU 'nw' times, once per word
in 'buf'.
T1OU outputs one character to the user terminal.
.ca
Primos t1ou
.sa
writef (2), tread$ (6), readf (2)
