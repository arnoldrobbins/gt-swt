[cc]mc |
.hd log$m "calculate logarithm to the base 10" 04/27/83
longreal function log$m (x)
real x
.sp
Library: vswtmath (Subsystem mathematical library)
.fs
This function implements the common logarithm (base 10) function.
Arguments must be greater than zero.
The condition SWT_MATH_ERROR$ is signalled if there is an argument error.
An on-unit can be established to deal with this error; the SWT Math
Library contains a default handler named 'err$m' which the user may
utilize. If an error is signalled due to an invalid argument
the default return is the log of the absolute value of
the argument, or zero in the case of a zero argument.
.sp
This function is intended to serve as a single precision function although
it returns a double precision result.  The function has been coded so
that any value returned will not overflow or underflow a single precision
floating point value.  The double precision register overlaps the single
precision register so it is possible to declare and use this function
as simply a "real" function.
.im
The algorithm involved uses a minimax rational approximation
on a reduction of the argument.  All positive inputs will return
a valid result.
It is adapted from the algorithm given in the book
.ul
Software Manual for the Elementary Functions
by William Waite and William Cody, Jr.  (Prentice-Hall, 1980).
.ca
Primos signl$
.sa
dlog$m (2), err$m (2),
.br
.ul
SWT Math Library User's Guide
[cc]mc
