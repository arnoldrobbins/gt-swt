[cc]mc |
.hd powr$m "calculate a longreal raised to a longreal power" 04/27/83
longreal function powr$m (x, y)
longreal x, y
.sp
Library: vswtmath (Subsystem mathematical library)
.fs
The 'powr$m' function raises a double precision real value to
a double precision real power.  The function return is also double
precision. It is the same as the Fortran statement "x**y".
.sp
The function is coded so as to adhere to ANSI Fortran standards
which do not allow raising negative values to a floating
point power, and which do not allow zero to be raised to a
zero or negative power.
Other inputs may trigger an error if the result of the
calculation would result in overflow.
The condition SWT_MATH_ERROR$ is signalled if there is an argument error.
An on-unit can be established to deal with this error; the SWT Math
Library contains a default handler named 'err$m' which the user may
utilize.
.sp
There are four cases where this function may signal SWT_MATH_ERROR$.
If an attempt is made to raise a negative value to a non-zero
power, then the default return value will be the absolute value
of that quantity raised to the given power.  If an attempt is
made to raise zero to a zero or negative power, the default return
is zero.  If the result would overflow then the default return
value is the largest double precision quantity that can be represented.
If the result would cause underflow, the default return is the smallest
positive value which can be represented on the machine.
.im
Adapted from the algorithm given in the book
.ul
Software Manual for the Elementary Functions
by William Waite and William Cody, Jr.  (Prentice-Hall, 1980).
.ca
Primos signl$
.sa
err$m (2),
.br
.ul
SWT Math Library User's Guide
[cc]mc
