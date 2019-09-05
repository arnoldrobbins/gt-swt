[cc]mc |
.hd sinh$m "calculate hyperbolic sine" 04/27/83
longreal function sinh$m (x)
real x
.sp
Library: vswtmath (Subsystem mathematical library)
.fs
This routine calculates the hyperbolic sine of its argument,
defined as sinh(x) = [exp(x) - exp(-x)]/2.
The argument must be smaller than 22623.630826296.
The condition SWT_MATH_ERROR$ is signalled if there is an argument error.
An on-unit can be established to deal with this error; the SWT Math
Library contains a default handler named 'err$m' which the user may
utilize.
If an error is signalled, the default return value will be zero.
.sp
This function is intended to serve as a single precision function although
it returns a double precision result.  The function has been coded so
that any value returned will not overflow or underflow a single precision
floating point value.  The double precision register overlaps the single
precision register so it is possible to declare and use this function
as simply a "real" function.
.im
The algorithm was adapted from the algorithm given in the book
.ul
Software Manual for the Elementary Functions
by William Waite and William Cody, Jr.  (Prentice-Hall, 1980).
.ca
dexp$m, Primos signl$
.sa
cosh$m (2), dexp$m (2), dsnh$m (2), err$m (2),
.br
.ul
SWT Math Library User's Guide
[cc]mc
