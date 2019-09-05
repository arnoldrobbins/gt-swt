.hd dodash "expand subrange of a set of characters" 01/07/83
subroutine dodash (valid, array, i, set, j, maxset)
character valid (ARB), array (ARB), set (maxset)
integer i, j, maxset
.sp
Library:  vswtlb (standard Subsystem library)
.fs
'Dodash' expands character ranges given in regular expressions.
'Valid' is the set of valid characters in the expansion range
(e.g. A-Z for upper case letters, 0-9 for digits, etc.).
'Array' contains the character range string, starting at position
'i'-1.
'Set' not only is the recipient of the expansion, but element
'j'-1 contains the initial character of the range.
'Maxset' is the maximum size 'set' may attain.
.im
The indices of the first and last characters in the range are
determined, and the substring of 'valid' thus selected is copied
into 'set'.
.am
i, set, j
.ca
addset, esc, index
.sa
makpat (2), tlit (1), ed (1), se (1)
