.hd lsdel "delete characters from a linked string" 03/23/80
subroutine lsdel (ptr, pos, len)
pointer ptr
integer pos, len
.sp
Library:  vlslb
.fs
Characters are deleted from the string specified by 'ptr' starting from
position 'pos' and continuing for 'len' characters. 'Len' may be
specified as a huge number to delete all remaining characters in the
string.  Even if all
characters in the string are deleted, the pointer that remains in 'ptr'
is still valid and points to a string containing EOS.
.im
The string is positioned to position 'pos' with 'lspos'.  'Lsfree' is called to
free 'len' characters.  If 'lsfree' returns 0 as a pointer value (meaning
it ran past the EOS), EOS is placed is position 'pos'; otherwise,
the pointer returned by 'lsfree' is placed in position 'pos'.
.ca
lsfree, lspos
.bu
Locally supported.
.sa
lsdrop (4), lssubs (4), lstake (4)
