[cc]mc |
.hd tanh$m "calculate hyperbolic tangent" 04/27/83
longreal function tanh$m (x)
real x
.sp
Library: vswtmath (Subsystem mathematical library)
.fs
This routine calculates the hyperbolic tangent of its argument,
defined as tanh(x) = 2/[exp(2x) + 1].  The
function never signals an error and returns valid results for
all inputs.
.sp
This function is intended to serve as a single precision function although
it returns a double precision result.  The function has been coded so
that any value returned will not overflow or underflow a single precision
floating point value.  The double precision register overlaps the single
precision register so it is possible to declare and use this function
as simply a "real" function.
.im
Adapted from the algorithm given in the book
.ul
Software Manual for the Elementary Functions
by William Waite and William Cody, Jr.  (Prentice-Hall, 1980).
.ca
dexp$m
.sa
dexp$m (2), dtnh$m (2),
.br
.ul
SWT Math Library User's Guide
[cc]mc
