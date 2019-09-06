.hd lscmpk "compare linked string with contiguous string" 03/23/80
character function lscmpk (ptr, str)
pointer ptr
character str (ARB)
.sp
Library:  vlslb
.fs
The linked string specified by 'ptr' and the contiguous string in 'str'
are compared on the basis of ASCII collating sequence.  Depending
upon the relation that the first string has to the second, a function
value of '>'c, '='c, or '<'c is returned.
.im
Characters are extracted from the linked string using 'lsgetc' and
compared with their corresponding elements in 'str' until two unequal
characters are seen or an EOS character is encountered.
The value returned is then decided from these two characters:  if one of the
characters is EOS, the longer string is considered greater; if both of the
characters are EOS, the strings are considered equal; if neither character
is EOS, the string with the largest character is considered greater.
.ca
lsgetc
.bu
Locally supported.
.sa
lscomp (4)
