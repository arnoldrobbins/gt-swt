.hd ctoa "convert character to address" 01/07/83
long_int function ctoa (str, i)
character str (ARB)
integer i
.sp
Library:  vswtlb (standard Subsystem library)
.fs
'Ctoa' converts the address in ASCII character representation at position
'i' of the given string to binary format.  'I' is incremented to point to the
position just after the integer.  If the character at position 'i' is not
numeric when 'ctoa' is entered, the value zero is returned (the exceptions
are blanks and tabs; these characters are ignored at the start of the
number).  'Ctoa' recognizes a 32-bit address in the following
format:

      [f]<ring>.<segment>.<word>

The presence of the character "f" at the beginning of the address
indicates that the pointer fault bit is to be set.
<Ring>, <segment>, and <word> are positive octal integers.
A bit number
following the address is ignored, if present.
.im
'Ctoa' scans the string, using the argument 'i' as the starting position.
Leading blanks and tabs are skipped.
The octal integers are collected with 'gctol'.  As each element
of the address is collected, it is placed in the proper bit
positions of the long integer return value.
.am
i
.ca
gctol
.bu
Cannot return 48 bit indirect pointers.
.sa
atoc (2), other conversion routines (?*toc (2) and cto?* (2))
