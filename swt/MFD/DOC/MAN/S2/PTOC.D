.hd ptoc "convert packed string to EOS-terminated string" 03/23/80
integer function ptoc (pstr, term, str, len)
packed_char pstr (ARB)
integer len
character term, str (len)
.sp
Library:  vswtlb (standard Subsystem library)
.fs
'Ptoc' is used to convert packed character strings (e.g., Fortran
Hollerith literals) into the EOS-terminated unpacked form normally
used by all Subsystem routines.
The argument 'pstr' is the packed array to be converted.
'Term' is a "termination character"; if the termination character
appears unescaped in the packed string, then the unpacking operation
will be terminated.
(For example, most uses of packed strings in
.ul
Software Tools
included a period as a termination character, since in general
there is no other way for a subprogram to tell where a Hollerith
literal ends.)
The argument 'str' is an array to receive the unpacked string;
its maximum length is specified by the argument 'len'.
.sp
The function return is the length of the string in 'str'
(as usual, excluding the EOS character).
.sp
A note on a rather common use of 'ptoc':
Many Primos routines return packed character strings that do
not have a termination character, but do have a maximum
length.
When using 'ptoc' to convert the output of these routines, one
may use EOS as the termination character to obtain a fixed-length
result.
.im
'Ptoc' uses the standard Subsystem macro 'fpchar' to pull
successive characters from the packed array.
These are simply copied into the receiving string until the
string is full or an unescaped instance of the termination
character is found.
.am
str
.sa
other conversion routines ('cto?*' and '?*toc'), particularly
'ctop' (2), 'vtoc' (2), and 'ctov' (2)
