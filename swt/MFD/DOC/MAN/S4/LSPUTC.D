.hd lsputc "put character into a linked string" 02/23/82
character function lsputc (ptr, c)
pointer ptr
character c
.sp
Library:  vlslb
.fs
The character in 'c' is placed in the next position of the string
specified by 'ptr'.  'Ptr' is then updated to point to the next available
position.  The function value is the value of 'c', unless there is no
more room in the string.  In this case, EOS is returned and the pointer
is not updated.  If an EOS is put in the string before the end, the
remaining character positions are deallocated.
.im
Pointers in the string are followed until a character is
found.  If the character is not EOS, it is replaced by the
value of 'c' and 'ptr' is incremented.  If the
value of 'c' is EOS, 'lsfree' is called
to deallocate the rest of the string.
.am
ptr, c
.ca
lsfree
.bu
'Lsputc' should perhaps allocate more space if the receiving string
overflows.
.sp
Locally supported.
.sa
lsgetc (4)
