.hd lsins "insert in linked string" 01/03/83
subroutine lsins (ptr1, pos1, ptr2, pos2, len)
pointer ptr1, ptr2
integer pos1, pos2, len
.sp
Library:  vlslb
.fs
The substring
specified by 'ptr2' (from position 'pos2' with length 'len') is
inserted into the string specified by 'ptr1'
after position 'pos1'.  String 2 is
.ul
not
destroyed.
A pointer to the resulting string is returned in 'ptr1'.
.im
If 'pos1' is less than or equal to zero, the string specified by 'ptr2'
(string 2)
is prepended to the string specified by 'ptr1' (string 1).
This is accomplished by
copying string 2 into a new string (string 3), pointing 'ptr1' to
string 3, and replacing the EOS of string 3
with a pointer to string 1.
.sp
If 'pos1' is greater than zero,  string 2
is inserted within string 1 (if 'pos1' is greater than
the length of string 1, it is assumed to be equal to the
length of string 1).
String 2 is copied to a new string (string 3) with an
extra position at the beginning.  String 1 is positioned
to 'pos1'.  The character at this position is placed
at the beginning of string 3, a pointer to string 3
replaces this character, and the EOS of string 3
is replaced with a pointer to 'pos1' + 1 of string 1.
.am
ptr1
.ca
lscopy, lsdel, lslen, lspos, lssubs
.bu
In appending string 2 to string 1, it is slightly less
efficient to specify a large number for 'pos1' than to
specify the exact length of string 1.
.sp
Locally supported.
.sa
lssubs (4)
