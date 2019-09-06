.hd dseek$ "seek on a disk device" 01/24/82
integer function dseek$ (pos, f, ra)
file_mark pos
file_des f
integer ra
.sp
Library:  vswtlb (standard Subsystem library)
.fs
'Dseek$' is an internal Subsystem routine that performs the function of
'seekf' for disk files only.
The first argument is  a long integer value which specifies the amount
of relative
or absolute positioning, depending on the value of the third
argument, 'ra'. If 'ra' equals ABS then positioning is from the
beginning of the file; if 'ra' equals REL then positioning is from
the current position.  The second argument is the file descriptor of the
file whose file pointer is being manipulated.
The function return is
OK if the positioning was successful, ERR if 'ra' is ABS and 'pos' is
negative, ERR if 'ra' is neither ABS nor REL, and EOF otherwise.
'Dseek$' is not intended for general use; it is not protected from user
error, and may cause termination of the user's program if used incorrectly.
It should always be referenced through 'seekf'.
.im
'Dseek$' calls the Primos subroutine PRWF$$ to set the file
pointer of a disk file.
.ca
Primos prwf$$
.bu
EOF is returned if any error occurs during disk read; the user is not
informed of the actual error that occurs.
.sa
seekf (2)
