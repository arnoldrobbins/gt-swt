.hd rtoc "convert real value to ASCII string" 02/24/82
integer function rtoc (v, str, w, d)
real v
character str (ARB)
integer w, d
.sp
Library:  vswtlb (standard Subsystem library)
.fs
'Rtoc' converts the (single precision) real value in 'v' to a
character string in 'str'.  The length of the string is returned
as the value of 'rtoc'.
.sp
The values of 'w' and 'd' control the format of the converted
string.
Generally speaking, 'd' controls the number of decimal positions
or significant digits, and 'w' specifies the maximum length
of the field.
The following table explains the operation of
'rtoc' for different combinations of 'w' and 'd'.
(Fortran and Basic programmers take note:  d>12 corresponds
to Basic output, 12>=d>=0 corresponds to Fortran 'F' format,
and 0>d>=12 corresponds to Fortran 'E' format)
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
converted into a
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
12>=d>=0\-\If  possible, the
value
is converted to a fixed-point format with 'd'
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
To return an error, 'rtoc' places a string consisting
of a single question mark in 'str'.
.sp
It should be noted that 'w' is roughly equivalent
to the 'size' parameter
in other conversion routines such as 'itoc' and 'ltoc';
'w' specifies
the maximum number of digits that may be produced.  Thus the
maximum number of characters returned in 'str' will never
exceed 'w + 1'.
.im
'Rtoc' converts the number to double precision and then
calls 'dtoc'.
'Rtoc' then returns whatever 'dtoc' returns.
.am
str
.ca
dtoc
.bu
Has been thoroughly tested, but has not stood the
test of time.
.sa
other conversion routines ('cto?*' and '?*toc') (2)
