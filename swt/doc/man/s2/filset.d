.hd filset "expand character set, stop at delimiter" 05/29/82
subroutine filset (delim, array, i, set, j, maxset)
character delim, array (ARB), set (maxset)
integer i, j, maxset
.sp
Library:  vswtlb (standard Subsystem library)
.fs
'Filset' expands a character class specification in 'array'
into a list of characters in 'set'.
'I' specifies the starting position in 'array', 'j' gives the
starting position in 'set', and 'maxset' gives the maximum size
of 'set'.
Expansion stops when there is insufficient room in 'set' or when
the character contained in 'delim' is encountered in 'array'.
.sp
Character sets consist of arbitrary characters,
two lower-case letters separated by a hyphen, two upper-case
letters separated by a hyphen, or two digits separated by a hyphen.
The last three cases represent a range of characters, including
the endpoints.
.im
Ordinary characters are simply stuffed into 'set' with calls
to 'addset'.
The range notation is expanded by 'dodash'.
.am
i, set, j
.ca
addset, esc, index, dodash
.sa
dodash (2), makpat (2)
