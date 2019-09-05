.hd vtoc "convert PL/I varying string to EOS-terminated string" 03/23/80
integer function vtoc (var, str, len)
integer var (ARB), len
character str (ARB)
.sp
Library:  vswtlb (standard Subsystem library)
.fs
'Vtoc' is used to convert a PL/I character-varying string into a
standard Subsystem EOS-terminated string.
The first argument is the character-varying string to be converted;
the second is a string to receive the result;
the third is the maximum length of the result string.
The function return is the number of characters in the result string
after the conversion.
.im
'Vtoc' uses the standard Subsystem macro 'fpchar' to pull characters
from the PL/I string one at a time, and place them in the result
string.
Conversion stops when the result string fills or when all the
characters in the PL/I string have been moved.
.am
str
.sa
other conversion routines ('cto?*' and '?*toc') (2)
