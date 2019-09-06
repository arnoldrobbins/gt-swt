[cc]mc |
.hd dint$m "get integer part of an longreal" 04/27/83
longreal function dint$m (x)
longreal x
.sp
Library: vswtmath (Subsystem mathematical library)
.fs
The 'dint$m' function implements the Fortran 'dint' function.
That is, it takes one double precision value and resets bits
in the mantissa to remove any fractional part of the value.
The return value is a double precision real.
.sp
The 'dint$m' of 1.5 is 1.0, the 'dint$m' of -1.5 is -1.0, and the 'dint$m'
of anything less than 1.0 and greater than -1.0 is equal to zero.
.sp
The 'dint$m' function has no single precision counterpart in the SWT Math
library.  The routine, as defined, does not recognize or signal
any error conditions.  It is written so as to work of both
550 and 750 style machines, despite the internal difference
in register structure.
.im
The algorithm involved was developed from known register structure;
see the source code for specifics.
.sa
.ul
SWT Math Library User's Guide
[cc]mc
