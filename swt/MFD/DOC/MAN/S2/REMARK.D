.hd remark "print diagnostic message" 01/07/83
subroutine remark (message)
packed_char message (ARB)
.sp
Library:  vswtlb (standard Subsystem library)
.fs
'Remark' is a routine from
.ul
Software Tools
that is used to print messages on the error output file (ERROUT).
The single argument is either a packed, period-terminated character
string (e.g. a Fortran Hollerith literal), or an unpacked,
EOS-terminated string (the standard Subsystem variety).
In either case, the given string is printed on ERROUT, followed by
a NEWLINE.
.im
If the high-order byte of the first word of the string is non-zero,
then the string must be packed;
'remark' uses 'putlit' to write the string to ERROUT.
Otherwise, 'remark' uses 'putlin' to write the string.
Finally, 'putch' is called to print the trailing NEWLINE.
.ca
putlit, putch, putlin
.sa
putlit (2), putch (2), error (2), putlin (2)
