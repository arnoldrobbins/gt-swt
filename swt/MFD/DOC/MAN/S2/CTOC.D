.hd ctoc "convert EOS-terminated string to EOS-terminated string" 03/23/80
integer function ctoc (from, to, len)
integer len
character from (ARB), to (len)
.sp
Library:  vswtlb (standard Subsystem library)
.fs
'Ctoc' copies an EOS-terminated unpacked string from one array to
another, observing a maximum-length constraint on the destination array.
The function return is the number of characters copied (i.e., the
length of the string in the parameter 'to').
.sp
Note that the other string copy routine, 'scopy', is not protected;
if the length of the source string exceeds the space available in the
destination string, some portion of memory will be garbled.
.im
A simple loop copies characters from 'from' to 'to' until
an EOS is encountered or all the space available in the destination
array is used up.
.am
to
.sa
scopy (2), other conversion routines ('cto?*' and '?*toc') (2)
