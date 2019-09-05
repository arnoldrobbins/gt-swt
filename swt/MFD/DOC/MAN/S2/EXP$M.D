[cc]mc |
.hd exp$m "calculate exponential to the base e" 04/27/83
longreal function exp$m (x)
real x
.sp
Library: vswtmath (Subsystem mathematical library)
.fs
This function raises the constant [bf e] to the power of the argument.
Arguments to the 'exp$m' routine must be in the closed interval
[-89.415985, 88.029678].
The condition SWT_MATH_ERROR$ is signalled if there is an argument error.
An on-unit can be established to deal with this error; the SWT Math
Library contains a default handler named 'err$m' which the user may
utilize.
If an error is signalled, the default function return value is zero.
.sp
It should be noted that the function could simply return zero
for sufficiently small arguments rather than signalling an error
since the actual function value would be indistinguishable
from zero to the precision of the machine.  However, there is
no mapping to zero in the actual function, and that is
why the function signals an error in this case.
.sp
This function is intended to serve as a single precision function although
it returns a double precision result.  The function has been coded so
that any value returned will not overflow or underflow a single precision
floating point value.  The double precision register overlaps the single
precision register so it is possible to declare and use this function
as simply a "real" function.
.im
The routine is implemented as a functional approximation
performed on a reduction of the argument.
It is adapted from the algorithm given in the book
.ul
Software Manual for the Elementary Functions
by William Waite and William Cody, Jr.  (Prentice-Hall, 1980).
.ca
dint$p, Primos signl$
.sa
dexp$m (2), dint$p (2),  err$m (2), ln$m (2),
.br
.ul
SWT Math Library User's Guide
[cc]mc
