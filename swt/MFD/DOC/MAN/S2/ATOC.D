.hd atoc "convert an address to a string" 01/07/83
integer function atoc (ptr, str, size)
integer ptr (3), size
character str (ARB)
.sp
Library:  vswtlb (standard Subsystem library)
.fs
'Atoc' converts the 2 or 3 word 64V mode indirect pointer
in the address 'ptr' to a printable EOS-terminated string in
'str'.  No more than 'size' elements of 'str' will be
modified, including the trailing EOS.
.sp
The pointer is converted into the format

   [f]<ring>.<segment>.<word>[.<bit>]

<Ring>, <segment>, and <word> are positive octal integers.
The character "f" is present only if the fault bit
in the pointer is set, and <bit> is included only
if the extension bit is set.
.sp
The function return is the number characters used to represent
the address (the length of 'str').
.im
Bits are removed from the indirect pointer and converted
to character representation with calls to 'gitoc' in a
straightforward manner.
.am
str
.ca
gitoc, ctoc
.sa
atoc (2), other conversion routines (?*toc (2), cto?* (2))
