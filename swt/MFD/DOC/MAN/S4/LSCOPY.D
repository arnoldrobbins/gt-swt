.hd lscopy "copy linked string" 01/03/83
subroutine lscopy (ptr1, pos1, ptr2, pos2)
pointer ptr1, ptr2
integer pos1, pos2
.sp
Library:  vlslb
.fs
The string specified by 'ptr1', beginning at position 'pos1' is copied
to the string specified by 'ptr2' beginning at position 'pos2'.
If 'ptr2' is zero, a string of the proper length is allocated and
the pointer to it is returned in 'ptr2' after copying.  If in copying,
the resultant string would overflow the space allocated for the second
string, no new space is allocated, and the copy terminates.
.im
The first string is positioned to position 'pos1' with a call to 'lspos'.
Then, if 'ptr2' is zero,
a string of the proper length is allocated with a call to 'lsallo'.
The second string is then
positioned to position 'pos2' and characters are copied until
the end of one string is reached by using 'lsgetc' and 'lsputc'.
.am
ptr2 (if zero)
.ca
lsallo, lsgetc, lslen, lspos, lsputc
.bu
Locally supported.
