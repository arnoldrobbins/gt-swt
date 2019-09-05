[cc]mc |
.hd makpat "make pattern, terminate at delimiter" 08/17/84
[cc]mc
integer function makpat (arg, from, delim, pat)
character arg (ARB), delim, pat (MAXPAT)
integer from
.sp
Library:  vswtlb (standard Subsystem library)
.fs
'Makpat' converts the standard character-string form of a regular
expression into the internal form used by the remainder of the
pattern matching routines.
The argument 'arg' is the regular expression to be converted;
'from' specifies the starting position of the pattern in 'arg';
'delim' contains a termination character which, when encountered,
causes conversion to stop;
'pat' receives the internal form of the regular expression.
[cc]mc |
The function returns the index of the delimiter in 'arg' if
[cc]mc
the conversion succeeded, ERR otherwise.
.sp
For a full discussion of patterns and pattern matching,
see
.ul
Introduction to the Software Tools Text Editor
or, of course,
.ul
Software Tools.
.im
'Makpat' traverses the regular expression a character at a time,
building the internal pattern with calls to 'addset'.
[cc]mc |
To build character classes, 'makpat' calls 'getccl';
to build closures it calls 'stclos'.
Calls to 'esc' handle escape sequences in the regular expression.
'Makpat' treats the special cases of "*" at beginning-of-line,
"%" not at BOL, and "$" not at end-of-line as regular characters.
.sp
'Makpat' takes an error return if the internal form becomes too large,
if an attempt is made to use closure on an illegal pattern element,
if there are too many tagged subpatterns,
if not all tagged subpatterns are properly closed,
or if 'delim' is never encountered.
[cc]mc
.am
pat
.ca
addset, esc, getccl, stclos
.sa
match (2), amatch (2), find (1), change (1), ed (1), se (1),
.ul 2
Introduction to the Software Tools Text Editor,
Software Tools
