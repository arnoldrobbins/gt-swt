.hd itoc "convert integer to character string" 03/23/80
integer function itoc (int, str, size)
integer int, size
character str (size)
.sp
Library:  vswtlb (standard Subsystem library)
.fs
'Itoc' converts the integer given as its first parameter to a character
string that is returned as its second parameter.  The last 'size' - 1 digits
of the number, and no more, are returned.
The number is left justified, with a leading minus sign if
the number is negative.
The function return is the length of the character string
returned.
.im
'Itoc' performs a rather standard conversion by using modular arithmetic
to fetch one digit at a time from the integer value supplied.  The character
string generated is placed backward in the receiving field, then reversed
just before exit.
.am
str
.sa
other conversion routines ('cto?*' and '?*toc') (2)
