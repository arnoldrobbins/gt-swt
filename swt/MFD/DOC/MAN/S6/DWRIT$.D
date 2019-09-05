.hd dwrit$ "write raw characters to disk" 02/24/82
integer function dwrit$ (buf, nwx, f)
integer buf (ARB), nwx, f
.sp
Library:  vswtlb (standard Subsystem library)
.fs
'Dwrit$' is an internal Subsystem routine that performs the function of
'writef' for disk files only.  The first argument is the array of words
to be written to the file; the second argument is the number of words
to be written; the third argument is the file descriptor of the file
to which data will be written.
'Dwrit$' returns the number of words written (which should always equal
'nwx'), or EOF.
'Dwrit$' is not intended for general use; it is not protected from user
error, and may cause termination of the user's program if used incorrectly.
It should always be referenced through 'writef'.
.im
'Dwrit$' calls the Primos subroutine PRWF$$ to write words to disk.
.ca
Primos prwf$$, move$
.bu
.in +5
.ti -5
EOF is returned if any error occurs; the user is not informed of the
actual error that occurs.
.in -5
.sa
writef (2)
