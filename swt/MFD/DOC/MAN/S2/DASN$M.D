[cc]mc |
.hd dasn$m "calculate double precision inverse sine" 04/27/83
longreal function dasn$m (x)
longreal x
.sp
Library: vswtmath (Subsystem mathematical library)
.fs
This function calculates the inverse sine of an angle.  The argument
to the function is the sine of the angle, and the function returns the
measure of the angle, in radians.
Arguments to the function must
be in the closed interval [-1.0, 1.0].
The condition SWT_MATH_ERROR$ is signalled if there is an argument error.
An on-unit can be established to deal with this error; the SWT Math
Library contains a default handler named 'err$m' which the user may
utilize.
If an error is signalled, the default function value is zero.
.im
The function is implemented as a rational minimax approximations
on a modified argument value.
It is adapted from the algorithm given in the book
.ul
Software Manual for the Elementary Functions
by William Waite and William Cody, Jr.  (Prentice-Hall, 1980).
.ca
dsqt$m, Primos signl$
.sa
asin$m (2), dsin$m (2), dsqt$m (2), err$m (2),
.br
.ul
SWT Math Library User's Guide
[cc]mc
