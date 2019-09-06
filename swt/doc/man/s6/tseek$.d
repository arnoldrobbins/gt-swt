.hd tseek$ "seek on a terminal device" 01/06/83
integer function tseek$ (pos, f, ra)
longint pos
file_des f
integer ra
.sp
Library:  vswtlb (standard Subsystem library)
.fs
'Tseek$' is an internal Subsystem routine that performs the function of
'seekf' for terminal files only.
The first argument is a long integer value which specifies the amount of
positioning relative to the current position (negative and absolute
positioning
are not allowed on terminal devices).
The second argument is the file descriptor of the
file whose file pointer is being manipulated.
The third argument must equal REL.
The function return is
OK if the positioning was successful, ERR if 'ra' is ABS or if 'pos' is
negative.
'Tseek$' is not intended for general use; it is not protected from user
error, and may cause termination of the user's program if used incorrectly.
It should always be referenced through 'seekf'.
.im
'Tseek$' calls the Primos subroutine C1IN 'pos' times to "skip over"
'pos' characters.
.ca
Primos c1in
.sa
seekf (2)
