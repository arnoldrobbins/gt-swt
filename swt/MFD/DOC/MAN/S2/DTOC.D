.hd dtoc "convert double precision value to ASCII string" 02/25/82
integer function dtoc (val, out, w, d)
long_real val
character out (ARB)
integer w, d
.sp
Library:  vswtlb (standard Subsystem library)
.fs
'Dtoc' converts the double precision floating point value in 'val' to a
character string in 'out'.  The length of the string is returned
as the value of 'dtoc'.
.sp
The values of 'w' and 'd' control the format of the converted
string.
Generally speaking, 'd' controls the number of decimal positions
or significant digits, and 'w' specifies the maximum length
of the field.
The following table  explains the operation of
'dtoc' for different combinations of 'w' and 'd'.
(Fortran and Basic programmers take note:  d>12 corresponds
to Basic output, 12>=d>=0 corresponds to Fortran 'F' format,
and 0>d>=-12 corresponds to Fortran 'E' format)
.sp
.in +18
.ta 12 19
.tc \
.ti -18
.ul
'd'\  'w'\       Result
.sp
.ti -18
d>12\w>16\If the value is in the range 1e7>v>=1e-2, it is
converted
into a
BASIC-like fixed-point
with no trailing zeroes
after the decimal point.
Otherwise, it is converted into a
BASIC-like exponential format
with no trailing zeroes after the decimal point.
.sp
.ti -18
\w<=16\An error is returned.
.sp
.ti -18
12>=d>=0\-\If possible, the
value is converted to a fixed-point format with 'd'
positions after the decimal point.
Otherwise, it is converted to an exponential
format with as many significant digits as possible.
If 'w' is less than 8, an exponential conversion
is not possible and an error will be returned.
.sp
.ti -18
0>d>-12\w>d+6\The number is converted to an exponential
format with 'd' significant digits.
.sp
.ti -18
\w<=d+6\An error is returned.
.sp
.in -18
To return an error, 'dtoc' places a string consisting
of a single question mark in 'out'.
.sp
It should be noted that 'w' is roughly equivalent to the
'size' parameter in other conversion routines such as
'itoc' and 'ltoc'; 'w' specifies the maximum number of
digits that may be produced.  Thus, the maximum number
of characters returned in 'out' will never exceed
'w + 1'.
.im
'Dtoc' first scales the number into the range 1 > v >= .1.  It
then determines the format in which the number is to be printed
and rounds the value to the proper number of digits.  The
digits are then extracted in character form.  One of several
conversion routines is then entered to take the extracted
digits and add decimal points, signs, and exponents as
required by the 'd' and 'w' specifications.
.am
out
.ca
itoc
.bu
.in +5
.ti -5
Has been thoroughly debugged, but has not stood the
test of time.
.in -5
.sa
ctod (2), other conversion routines ('cto?*' and '?*toc') (2)
