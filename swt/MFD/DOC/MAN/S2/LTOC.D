.hd ltoc "convert long integer to character string" 03/23/80
integer function ltoc (int, str, size)
long_int int
integer size
character str (size)
.sp
Library:  vswtlb (standard Subsystem library)
.fs
'Ltoc' is used to convert long integers to decimal character
representation.
.sp
'Int' is the long integer to be converted;
'str' is the string to receive the ASCII representation;
'size' is the size of 'str'.
The function return is the number of characters required to represent
'int'.
.sp
'Ltoc' duplicates the function of 'itoc' for long integers.
.im
Standard modular-arithmetic conversion.
See 'itoc' for details.
.am
str
.sa
other conversion routines ('cto?*' and '?*toc') (2)
