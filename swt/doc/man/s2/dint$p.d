[cc]mc |
.hd dint$p "get integer part of a longreal (PMA only)" 04/27/83
DFLD  VALUE
EXT   DINT$P
JSXB  DINT$P
DFST  IVALUE
.sp
Library: vswtmath (Subsystem mathematical library)
.fs
The 'dint$p' function implements the Fortran 'dint' function.
It is part of the SWT Math Library 'dint$m' routine and is a special
shortcall entrance that can only be used by PMA code.
It takes one double precision value and resets bits
in the mantissa to remove any fractional part of the value.
The return value is a double precision real.
.im
The algorithm involved was developed from known register structure;
see the source code for specifics.
.sa
dint$m (2),
.br
.ul
SWT Math Library User's Guide
[cc]mc
