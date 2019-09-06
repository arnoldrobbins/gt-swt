[cc]mc |
.hd dlog$m "calculate double precision logarithm to the base 10" 04/27/83
longreal function dlog$m (x)
longreal x
.sp
Library: vswtmath (Subsystem mathematical library)
.fs
This function implements the common logarithm (base 10) function.
Arguments should be greater than zero.
The condition SWT_MATH_ERROR$ is signalled if there is an argument error.
An on-unit can be established to deal with this error; the SWT Math
Library contains a default handler named 'err$m' which the user may
utilize. If an invalid argument is supplied to the function
the default return is the log of the absolute value of
the argument, or zero in the case of a zero argument.
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
err$m (2), log$m (2),
.br
.ul
SWT Math Library User's Guide
[cc]mc
