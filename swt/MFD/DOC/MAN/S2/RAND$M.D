[cc]mc |
.hd rand$m "generate a random number" 04/27/83
longreal function rand$m (l)
longint l
.sp
Library: vswtmath (Subsystem mathematical library)
.fs
The 'rand$m' function returns a double precision floating value
in the open interval (0.0, 1.0).  The argument to the function
is set to a 32 bit integer in the range (0, 2**31 - 1).  The generator
is a linear congruential generator with multiplier 764261123.
The values returned seem to be very well distributed, both
from the standpoint of spectral tests and lattice tests.
.sp
The 'rand$m' routine does not detect or signal any errors.
The first time the 'rand$m' function is called, if
the generator has not been initialized with the 'seed$m'
procedure, a seed is derived based on the current time of day
and cpu utilization.
This seed is returned in the integer argument variable.
.sp
This function can  serve as a single precision function although
it returns a double precision result.  The function has been coded so
that any value returned will not overflow or underflow a single precision
floating point value.  The double precision register overlaps the single
precision register so it is possible to declare and use this function
as simply a "real" function.
.im
Derived from information presented in
"A Statistical Evaluation of Multiplicative Congruential Random
Number Generators with Modulus 2^32 -1" by George S. Fishman and
Louis R. Moore, in the Journal of the American Statistical Association,
volume 77, number 377, March 1982.
.ca
dble$m, Primos timdat
.sa
dble$m (2), seed$m (2),
.br
.ul
SWT Math Library User's Guide
[cc]mc
