[cc]mc |
.hd invmod "find inverse of an integer modulo another integer" 07/20/84
[cc]mc
long_int function invmod (x1, x0)
long_int x1, x0
.sp
[cc]mc |
Library: vswtmath (Subsystem mathematical library)
[cc]mc
.fs
'Invmod' is used to find the inverse of 'x1' in the ring of
integers modulo 'x0'.
The function return is the inverse if it could be found, or
ERR if 'x1' and 'x0' are not relatively prime.
.im
'Invmod' uses a variant of Euclid's greatest common divisor
algorithm.
.bu
Rational behavior for nonpositive arguments has not been established.
.sp
Locally supported.
.sa
gcd (4)
