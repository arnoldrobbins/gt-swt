.hd stake "take characters from a string APL-style" 03/23/80
integer function stake (from, to, length)
character from (ARB), to (ARB)
integer length
.sp
Library:  vswtlb (standard Subsystem library)
.fs
'Stake' copies the number of characters specified by 'length'
from the 'from' string into the 'to' string and returns
as its result the number of characters copied.  If 'length' is
positive, the characters are copied from the beginning of
'from'; if it is negative, they are copied from the end of 'from'.
.am
to
.ca
ctoc, length, scopy
.sa
sdrop (2), index (2), substr (2), take (1)
