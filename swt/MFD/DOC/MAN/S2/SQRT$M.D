[cc]mc |
.hd sqrt$m "calculate square root" 04/27/83
longreal function sqrt$m (x)
real x
.sp
Library: vswtmath (Subsystem mathematical library)
.fs
This function calculates the square root of a floating
point value.
Attempts to take the square root
of negative values will result in an error.
The default return in this case will
be the square root of the absolute value of the argument.
All other arguments are in range and return valid results.
The condition SWT_MATH_ERROR$ is signalled if there is an argument error.
An on-unit can be established to deal with this error; the SWT Math
Library contains a default handler named 'err$m' which the user may
utilize.
.sp
This function is intended to serve as a single precision function although
it returns a double precision result.  The function has been coded so
that any value returned will not overflow or underflow a single precision
floating point value.  The double precision register overlaps the single
precision register so it is possible to declare and use this function
as simply a "real" function.
.im
The algorithm involved is based on Newton's approximation
method with an initial multiplicative approximation.  The
argument is scaled to within the range [0.5, 2.0) and then
the algorithm is iterated to a solution.
Adapted from the algorithm given in the book
.ul
Software Manual for the Elementary Functions
by William Waite and William Cody, Jr.  (Prentice-Hall, 1980).
.ca
Primos signl$
.sa
dsqt$m (2), err$m (2),
.br
.ul
SWT Math Library User's Guide
[cc]mc
