.hd maksub "make substitution string" 01/07/83
integer function maksub (arg, from, delim, sub)
character arg (ARB), delim, sub (MAXPAT)
integer from
.sp
Library:  vswtlb (standard Subsystem library)
.fs
'Maksub' converts the character representation of a substitution
string starting at "arg(from)" into an internal form in 'sub'.
Conversion proceeds until there is insufficient room in 'sub'
to proceed or until the character in 'delim' is encountered.
The function return is the next unexamined position in 'arg'.
.sp
For a full discussion of the syntax of substitution strings,
see either
.ul
Introduction to the Software Tools Text Editor
or
.ul
Software Tools.
.im
Straightforward scan of the substitution string.
At present, the metacharacter sequences in a substitution string
are "&" (meaning the string matched) and "@<digit>" (meaning the
<digit>th tagged subpattern matched).
'Esc' is used to handle escape sequences;
all other characters are substituted literally.
.am
sub
.ca
addset, esc, type
.sa
makpat (2), addset (2), change (1), ed (1), se (1),
.ul 2
Introduction to the Software Tools Text Editor,
Software Tools.
