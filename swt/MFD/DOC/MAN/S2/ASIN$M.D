[cc]mc |
.hd asin$m "calculate inverse sine" 04/27/83
longreal function asin$m (x)
real x
.sp
Library: vswtmath (Subsystem mathematical library)
.fs
This function calculates the inverse sine of an angle.  The argument
to the function is the sine of the angle, and the function returns the
measure of the angle, in radians.
Arguments to the function must
be in the closed interval [-1.0, 1.0].
If an error is signalled, the default function value is zero.
The condition SWT_MATH_ERROR$ is signalled if there is an argument error.
An on-unit can be established to deal with this error; the SWT Math
Library contains a default handler named 'err$m' which the user may
utilize.
.sp
This function is intended to serve as a single precision function although
it returns a double precision result.  The function has been coded so
that any value returned will not overflow or underflow a single precision
floating point value.  The double precision register overlaps the single
precision register so it is possible to declare and use this function
as simply a "real" function.
.im
The function is implemented as a rational minimax approximation
on a modified argument value.
It is adapted from the algorithm given in the book
.ul
Software Manual for the Elementary Functions
by William Waite and William Cody, Jr.  (Prentice-Hall, 1980).
.ca
dsqt$m, Primos signl$
.sa
dasn$m (2), dsqt$m (2),  err$m (2), sin$m (2),
.br
.ul
SWT Math Library User's Guide
[cc]mc
