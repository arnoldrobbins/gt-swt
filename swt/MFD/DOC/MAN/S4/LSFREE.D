.hd lsfree "free linked string space" 03/23/80
subroutine lsfree (ptr, len)
pointer ptr
integer len
.sp
Library:  vlslb
.fs
The first 'len' characters of the string specified by 'ptr' are
deallocated.
'Ptr' is updated to point to the remaining characters.  If no characters
remain ('len' is longer than the string) 'ptr' is set to zero.
.im
The string is traversed, setting all visited locations to the value
UNUSED, until 'len' characters or an EOS has been passed.
.am
ptr
.bu
Space is not available for reuse until after garbage collection.
This is done to avoid pointer fragmentation.
.sp
'Lsfree' is used for returning strings to the free list.  It is not
careful with pointers, so it should usually be called only to completely
deallocate a string (i.e. "call lsfree (ptr, ALL)").
.sp
Locally supported.
.sa
lsallo (4)
