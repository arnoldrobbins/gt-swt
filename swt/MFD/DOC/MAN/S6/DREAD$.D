.hd dread$ "read raw words from disk" 02/24/82
integer function dread$ (buf, nw, f)
integer buf (ARB), nw
file_des f
.sp
Library:  vswtlb (standard Subsystem library)
.fs
'Dread$' is an internal Subsystem routine that performs the function of
'readf' for disk files only.  The first argument specifies a string to
receive the words read; the second argument is the number of words
to be read; and, the third argument is the file descriptor of the file
from which data will be read.
'Dread$' returns the number of words placed in the receiving buffer
if the read was successful; EOF otherwise.
'Dread$' is not intended for general use; it is not protected from user
error, and may cause termination of the user's program if used incorrectly.
It should always be referenced through 'readf'.
.im
'Dread$' calls the Primos subroutine PRWF$$ to fill a buffer with words
from disk file 'f'.
.am
buf
.ca
move$, Primos prwf$$
.bu
EOF is returned if any error occurs; the user is not informed of the
actual error that occurs.
.sa
readf (2)
