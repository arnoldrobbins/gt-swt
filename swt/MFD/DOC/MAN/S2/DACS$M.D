[cc]mc |
.hd dacs$m "calculate double precision inverse cosine" 04/27/83
longreal function dacs$m (x)
longreal x
.sp
Library: vswtmath (Subsystem mathematical library)
.fs
This function calculates the inverse cosine of an angle.  The argument
to the function is the cosine of the angle, and the function returns the
measure of the angle, in radians.
Arguments to the function must
be in the closed interval [-1.0, 1.0].
The condition SWT_MATH_ERROR$ is signalled if there is an argument error.
An on-unit can be established to deal with this error; the SWT Math
Library contains a default handler named 'err$m' which the user may
utilize. In the case of an error, the default return value is zero.
.im
The function is implemented as a rational minimax approximation
on a modified argument value.
It is adapted from the algorithm given in the book
.ul
Software Manual for the Elementary Functions
by William Waite and William Cody, Jr.  (Prentice-Hall, 1980).
.ca
Primos signl$
.sa
acos$m (2), dcos$m (2), dsqt$m (2), err$m (2),
.br
.ul
SWT Math Library User's Guide
[cc]mc
