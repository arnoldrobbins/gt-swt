[cc]mc |
.hd dsqt$m "calculate double precision square root" 04/27/83
longreal function dsqt$m (x)
longreal x
.sp
Library: vswtmath (Subsystem mathematical library)
.fs
This function calculates the square root of a double precision floating
point value.
Attempts to take the square root
of negative values will result in an error.
The condition SWT_MATH_ERROR$ is signalled if there is an argument error.
An on-unit can be established to deal with this error; the SWT Math
Library contains a default handler named 'err$m' which the user may
utilize.
The default return in this case will
be the square root of the absolute value of the argument.
.im
The algorithm involved is based on Newton's approximation
method with an initial multiplicative approximation.  The
argument is scaled to within the range [0.5, 2.0) and then
the algorithm is iterated to a solution.
It is adapted from the algorithm given in the book
.ul
Software Manual for the Elementary Functions
by William Waite and William Cody, Jr.  (Prentice-Hall, 1980).
.ca
Primos signl$
.sa
err$m (2), sqrt$m (2),
.br
.ul
SWT Math Library User's Guide
[cc]mc
