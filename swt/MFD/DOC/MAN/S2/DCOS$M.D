[cc]mc |
.hd dcos$m "calculate double precision cosine" 04/27/83
longreal function dcos$m (x)
longreal x
.sp
Library: vswtmath (Subsystem mathematical library)
.fs
This function returns the cosine of the angle whose measure
(in radians) is given by the argument.
The the absolute value of
the angle plus one-half pi must be less than 26353588.0.
The condition SWT_MATH_ERROR$ is signalled if there is an argument error.
An on-unit can be established to deal with this error; the SWT Math
Library contains a default handler named 'err$m' which the user may
utilize.
If an error is signalled, the default function return is zero.
.im
The function is implemented as minimax polynomial approximation.
It is adapted from the algorithm given in the book
.ul
Software Manual for the Elementary Functions
by William Waite and William Cody, Jr.  (Prentice-Hall, 1980).
.ca
dint$p, Primos signl$
.sa
cos$m (2), dacs$m (2), dint$p (2), dsin$m (2), err$m (2),
.br
.ul
SWT Math Library User's Guide
[cc]mc
