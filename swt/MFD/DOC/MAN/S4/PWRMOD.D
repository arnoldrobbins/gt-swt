[cc]mc |
.hd pwrmod "calculate an exponential modulo a given modulus" 07/20/84
[cc]mc
long_int function pwrmod (p, e, n)
long_int p, e, n
.sp
[cc]mc |
Library: vswtmath (Subsystem mathematical library)
[cc]mc
.fs
'Pwrmod' is used to perform an integer exponentiation in the ring of
integers modulo a given modulus.
The argument 'p' is the base of the expression, 'e' is the exponent,
and 'n' the modulus.
The function return is p**E (mod n).
.im
'Pwrmod' examines the exponent a bit a time,
squaring the intermediate result accumulated so far and
multiplying it by the base whenever the selected bit is a 1.
Each operation is performed modulo 'n', so that intermediate
results don't become excessively large.
.sa
invmod (4)
