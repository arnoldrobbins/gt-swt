[cc]mc |
.hd datn$m "calculate double precision inverse tangent" 04/27/83
longreal function datn$m (x)
longreal x
.sp
Library: vswtmath (Subsystem mathematical library)
.fs
This function calculates the inverse tangent of an angle.  The argument
to the function is the tangent of the angle, and the function returns the
measure of the angle, in radians.
The function will not signal any errors based on
input values.
.im
The function is implemented as a rational approximation
on a modified argument value.
It is adapted from the algorithm given in the book
.ul
Software Manual for the Elementary Functions
by William Waite and William Cody, Jr.  (Prentice-Hall, 1980).
.sa
atan$m (2), err$m (2),
.br
.ul
SWT Math Library User's Guide
[cc]mc
