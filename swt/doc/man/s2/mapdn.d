.hd mapdn "fold character to lower case" 03/23/80
character function mapdn (c)
character c
.sp
Library:  vswtlb (standard Subsystem library)
.fs
'Mapdn' determines if the character passed as its parameter is an upper case
letter or not.  If not, the function return is equal to the character;
otherwise, the function return is the value of the character mapped to lower
case.
.im
'Mapdn' expects all upper case letters to be contiguous and arranged in
a collating sequence with capital A low and capital Z high (internal
ASCII satisfies these requirements).  If the character lies between
'A'c and 'Z'c, it is mapped to lower case by adding 'a'c - 'A'c.
The function return is the mapped value.  The parameter is left unchanged.
.bu
Depends heavily on ASCII character code, in exchange for speed.
.sa
mapup (2), mapstr (2)
