.hd ctod "convert string to double precision real" 01/07/83
long_real function ctod (str, i)
character str (ARB)
integer i
.sp
Library:  vswtlb (standard Subsystem library)
.fs
'Ctod' converts the character string in the array 'str',
starting at position 'i', to double precision floating point
representation and returns this value as the result of the
function. The variable 'i' is incremented to a point one character
beyond the string that was converted; the array 'str' is not
modified.
'Str' must be an EOS-terminated unpacked character string.
.sp
'Ctod' recognizes any valid Fortran constant;
in particular, leading signs are handled.
Leading blanks and tabs are ignored.
.im
'Ctod' accumulates the integer and fractional parts of the
number, throwing away leading zeros and insignificant digits
and computing scaling factors if necessary.
A straightforward Horner's method conversion translates each
portion of the constant to binary, and finally all portions
are combined and appropriately scaled.
Scaling is aided by using tables of powers-of-two exponents,
to preserve as much accuracy as possible.
.am
i
.ca
gctoi
.sa
dtoc (2), ctor (2), rtoc (2), other conversion routines
('cto?*' and '?*toc') (2)
