.hd lsjoin "join two linked strings" 03/23/80
pointer function lsjoin (ptr1, ptr2)
pointer ptr1, ptr2
.sp
Library:  vlslb
.fs
The string specified by 'ptr2' is concatenated to the end of the
string specified by 'ptr1'. A pointer to the resulting string is
returned in 'ptr1' and as the function value. 'Ptr2' ceases to be
a valid pointer.
.im
The string specified by 'ptr1' is positioned to its end.  Then the
EOS character in the first string is replaced by 'ptr2' + 300, thus
linking the second string to the first.
.ca
lspos
.bu
Locally supported.
.sa
lscut (4), lsins (4)
