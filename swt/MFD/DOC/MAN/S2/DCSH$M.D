[cc]mc |
.hd dcsh$m "calculate double precision hyperbolic cosine" 04/27/83
longreal function dcsh$m (x)
longreal x
.sp
Library: vswtmath (Subsystem mathematical library)
.fs
This routine calculates the hyperbolic cosine of its argument,
defined as cosh(x) = [exp(x) + exp(-x)]/2.  The absolute value of
the argument must be less than 22623.630826296.
The condition SWT_MATH_ERROR$ is signalled if there is an argument error.
An on-unit can be established to deal with this error; the SWT Math
Library contains a default handler named 'err$m' which the user may
utilize.
If an error is signalled, the default function value is zero.
.im
Adapted from the algorithm given in the book
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
