[cc]mc |
.hd dtnh$m "calculate double precision hyperbolic tangent" 04/27/83
longreal function dtnh$m (x)
longreal x
.sp
Library: vswtmath (Subsystem mathematical library)
.fs
This routine calculates the hyperbolic tangent of their argument,
defined as tanh(x) = 2/[exp(2x) + 1].  The function
never signals an error and returns valid results for
all inputs.
.im
Adapted from the algorithm given in the book
.ul
Software Manual for the Elementary Functions
by William Waite and William Cody, Jr.  (Prentice-Hall, 1980).
.ca
dexp$m
.sa
dexp$m (2), tanh$m (2),
.br
.ul
SWT Math Library User's Guide
[cc]mc
