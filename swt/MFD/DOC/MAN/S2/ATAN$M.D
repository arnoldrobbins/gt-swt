[cc]mc |
.hd atan$m "calculate inverse tangent" 04/27/83
longreal function atan$m (x)
real x
.sp
Library: vswtmath (Subsystem mathematical library)
.fs
This function calculates the inverse tangent of an angle.  The argument
to the function is the tangent of the angle, and the function returns the
measure of the angle, in radians.
The function will not signal any errors based on
input values.
.sp
This function is intended to serve as a single precision function although
it returns a double precision result.  The function has been coded so
that any value returned will not overflow or underflow a single precision
floating point value.  The double precision register overlaps the single
precision register so it is possible to declare and use this function
as simply a "real" function.
.im
The function is implemented as a rational approximation
on a modified argument value.
It is adapted from the algorithm given in the book
.ul
Software Manual for the Elementary Functions
by William Waite and William Cody, Jr.  (Prentice-Hall, 1980).
.sa
datn$m (2), err$m (2),
.br
.ul
SWT Math Library User's Guide
[cc]mc
