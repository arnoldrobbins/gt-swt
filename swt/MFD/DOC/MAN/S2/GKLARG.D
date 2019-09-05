.hd gklarg "parse a single key-letter argument" 03/23/80
integer function gklarg (args, str)
integer args (26)
character str (ARB)
.sp
Library:  vswtlb (standard Subsystem library)
.fs
'Gklarg' is used to parse a key-letter argument string.
Such an argument consists of a dash ("-") followed by any number
of letters (in upper or lower case).
.sp
All elements in the array 'args' must be preset  to one of two
values before calling 'gklarg'.
Elements corresponding to allowable option letters should be
initialized to zero;
all others should contain -1.
.sp
'Gklarg' sets the elements of 'args' that correspond to any
option letters found in 'str' to the value 1.
The function return is ERR if 'str' does not begin with a dash,
or if any disallowed option letters are encountered,
OK otherwise.
.im
'Gklarg' first verifies that the string given in 'str' begins
with a dash.
If it does not, ERR is returned.
The remainder of the string is examined character-by-character.
If a letter is encountered, and the corresponding element of
'args' is nonnegative, then the element is set to one.
Otherwise the value ERR is returned immediately.
.am
args
.ca
mapdn
.sa
gfnarg (2), chkarg (2), getkwd (2)
