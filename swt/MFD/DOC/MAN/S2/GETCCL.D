.hd getccl "expand character class into pattern" 05/29/82
integer function getccl (arg, i, pat, j)
character arg (ARB), pat (MAXPAT)
integer i, j
.sp
Library:  vswtlb (standard Subsystem library)
.fs
'Getccl' converts the character class specification starting at
'arg(i)' into a pattern element starting at 'pat(j)'.
The pattern element consists of a character count followed by
a list of all characters in the class.
The function return is OK if the character class was successfully
converted, ERR otherwise.
.sp
For a discussion of character classes, see either
.ul
Introduction to the Software Tools Text Editor
or
.ul
Software Tools.
.im
If the first character in the class specification is a tilde,
the class generated is a negated class rather than the standard
class.
Room is then reserved for the character count,
and 'filset' is called to expand the specification into the
vector of characters.
.am
i, pat, j
.ca
addset, filset
.sa
makpat (2), addset (2), filset (2),
.ul 2
Introduction to the Software Tools Text Editor,
Software Tools
