[cc]mc |
.hd gcd "determine greatest common divisor of two integers" 07/20/84
[cc]mc
long_int function gcd (x0, x1)
long_int x0, x1
.sp
[cc]mc |
Library: vswtmath (Subsystem mathematical library)
[cc]mc
.fs
'Gcd' determines the greatest common divisor of the two long integers
specified as arguments.
The function return is the GCD (always positive).
.im
'Gcd' is a straightforward implementation of Euclid's algorithm.
.bu
Behavior with nonpositive arguments may be considered irrational
by some.
.sa
invmod (4)
