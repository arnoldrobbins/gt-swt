[cc]mc |
.hd dsin$m "calculate double precision sine" 04/27/83
longreal function dsin$m (x)
longreal x
.sp
Library: vswtmath (Subsystem mathematical library)
.fs
This function returns the sine of the angle whose measure
(in radians) is given by the argument.  The absolute value of the argument
must be less than 26353588.0.
The condition SWT_MATH_ERROR$ is signalled if there is an argument error.
An on-unit can be established to deal with this error; the SWT Math
Library contains a default handler named 'err$m' which the user may
utilize.
If an error is signalled, the default return value will be zero.
.im
The function is implemented as a minimax polynomial approximation.
Note that for angles sufficiently small the value of the sine
function is equal to the measure of the angle.
Adapted from the algorithm given in the book
.ul
Software Manual for the Elementary Functions
by William Waite and William Cody, Jr.  (Prentice-Hall, 1980).
.ca
dint$p, Primos signl$
.sa
dasn$m (2), dcos$m (2), dint$p (2), err$m (2), sin$m (2),
.br
.ul
SWT Math Library User's Guide
[cc]mc
