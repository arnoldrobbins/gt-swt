[cc]mc |
.hd cosh$m "calculate hyperbolic cosine" 04/27/83
longreal function cosh$m (x)
real x
.sp
Library: vswtmath (Subsystem mathematical library)
.fs
This routine calculates the hyperbolic cosine of its argument,
defined as cosh(x) = [exp(x) + exp(-x)]/2.
Arguments which produce a value
too large for single precision storage will signal the
error condition.
The condition SWT_MATH_ERROR$ is signalled if there is an argument error.
An on-unit can be established to deal with this error; the SWT Math
Library contains a default handler named 'err$m' which the user may
utilize.
If an error is signalled, the default function value is zero.
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
dcsh$m (2), dexp$m (2), err$m (2), sinh$m (2),
.br
.ul
SWT Math Library User's Guide
[cc]mc
