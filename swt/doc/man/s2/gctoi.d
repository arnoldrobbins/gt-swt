.hd gctoi "generalized character to integer conversion" 03/23/80
integer function gctoi (str, i, radix)
character str (ARB)
integer radix, i
.sp
Library:  vswtlb (standard Subsystem library)
.fs
'Gctoi' is  similar to the routine 'ctoi', except that it
accepts base indicators and signs.
Conversion begins on the string 'str' at position
'i'.
The converted integer is returned as the value of the
function.
'I' will be updated to indicate the first position
not used in the conversion.
.sp
Input to 'gctoi' consists of a number containing
an optional plus or minus sign, an optional base indicator,
and a string of digits allowable for the input base.
The base indicator consists of the (decimal) radix of the
desired base followed by the letter "r"
(in the style of Algol 68).
The digits corresponding to the
numbers 10 through 15 are entered as the letters "a" through
"f".
If no base indicator occurs in the string, the number in 'radix'
is used as the default base.
Conversion stops when a character not allowable in the number
is encountered.
.im
'Gctoi' first checks for a leading sign, and records it if found.
If the first one or two digits of the number are numeric and
if they are followed by a lower case "r", then they are converted
to binary and used as the radix of the remaining digits;
otherwise, the 'radix' argument is used.
The remaining digits of the number are converted by a simple
multiply-and-add-successive-digits algorithm.
.am
i
.ca
index
.sa
gctol (2), ctoi (2), other conversion routines ('cto?*' and '?*toc') (2)
