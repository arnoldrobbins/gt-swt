.hd ctor "character to real conversion" 03/23/80
real function ctor (str, i)
character str (ARB)
integer i
.sp
Library:  vswtlb (standard Subsystem library)
.fs
'Ctor' is similar in function to 'ctoi', except that it
converts floating point numbers as well as integers.
The character
string in 'str' is examined starting in position 'i'.
Conversion stops when a character is encountered
that cannot correctly appear in the number.
'I' is updated to point to the first character not
included in the converted number.
The value returned by the function is the real (single precision)
value of the character string.
.sp
The number in 'str' may contain a leading sign, a
decimal point, and an exponent.  A decimal point
is not required.
.im
'Ctod' is called to convert the character string into
a double precision value.  This value is converted to
single precision format and returned as
the value of 'ctor'.
.am
i
.ca
ctod
.sa
input (2), other conversion routines ('cto?*' and '?*toc') (2)
