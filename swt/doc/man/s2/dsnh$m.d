[cc]mc |
.hd dsnh$m "calculate double precision hyperbolic sine" 04/27/83
longreal function dsnh$m (x)
longreal x
.sp
Library: vswtmath (Subsystem mathematical library)
.fs
This routine calculates the hyperbolic sine of its argument,
defined as sinh(x) = [exp(x) - exp(-x)]/2.  The argument
must be less than 22623.630826296.
The condition SWT_MATH_ERROR$ is signalled if there is an argument error.
An on-unit can be established to deal with this error; the SWT Math
Library contains a default handler named 'err$m' which the user may
utilize.
If an error is signalled, the default return value will be zero.
.im
The algorithm involved was adapted from the algorithm given in the book
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
