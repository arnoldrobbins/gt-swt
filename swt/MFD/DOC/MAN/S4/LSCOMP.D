.hd lscomp "compare two linked strings" 02/23/82
character function lscomp (ptr1, ptr2)
pointer ptr1, ptr2
.sp
Library:  vlslb
.fs
The linked strings specified by 'ptr1' and 'ptr2' are compared
on the basis
[cc]mc |
of ASCII collating sequence. The value of the function is '>'c,
[cc]mc
'='c, or '<'c, depending upon the relation that the first string
has to the second.
.im
Characters are extracted from the strings using 'lsgetc' until
two unequal characters are found or an EOS character is seen.
The returned value is then decided from these two characters:
if one of the characters is EOS, the longer string is considered
greater; if both of the characters are EOS, the strings are
considered equal; if neither character is EOS, the string with the
larger character is considered greater.
.ca
lsgetc
.bu
Locally supported.
.sa
lscmpk (4)
