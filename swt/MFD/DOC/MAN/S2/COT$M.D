[cc]mc |
.hd cot$m "calculate cotangent" 04/27/83
longreal function cot$m (x)
real x
.sp
Library: vswtmath (Subsystem mathematical library)
.fs
This function calculates the cotangent of the angle whose
measure is given (in radians) as the argument to the function.
The argument must have an absolute value greater than
7.064835966E-9865 and less than 13176794.0.
The condition SWT_MATH_ERROR$ is signalled if there is an argument error.
An on-unit can be established to deal with this error; the SWT Math
Library contains a default handler named 'err$m' which the user may
utilize.
If an error is signalled, the default function return is zero.
.sp
This function is intended to serve as a single precision function although
it returns a double precision result.  The function has been coded so
that any value returned will not overflow or underflow a single precision
floating point value.  The double precision register overlaps the single
precision register so it is possible to declare and use this function
as simply a "real" function.
.im
The function is calculated based on a minimax polynomial approximation
over a reduced argument.
It is adapted from the algorithm given in the book
.ul
Software Manual for the Elementary Functions
by William Waite and William Cody, Jr.  (Prentice-Hall, 1980).
.ca
dint$p, Primos signl$
.sa
dcot$m (2), dint$p (2), err$m (2), tan$m (2),
.br
.ul
SWT Math Library User's Guide
[cc]mc
