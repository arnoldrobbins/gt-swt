.hd lsallo "allocate space for a linked string" 01/03/83
pointer function lsallo (ptr, len)
pointer ptr
integer len
.sp
Library:  vlslb
.fs
A string of length 'len' (not counting the EOS) is allocated.
The pointer
to the string is returned in 'ptr' and as the function value.
If all attempts to find sufficient space fail, an error diagnostic
("Too many linked strings")
is issued and the program is aborted.
.im
First, a test is made to see if there are 'len' characters available
between the highest used location and the top of the string space
to allocate the string.  If not, the available space list
is followed to find space.  If both fail, storage is reclaimed by
calling 'lsfree' to deallocate the available space list,
decrementing the highest open pointer to the first allocated
location, and rebuilding the available space list.  If a second search
then fails,  'error' is called to print the diagnostic and
abort the program.
.am
ptr
.ca
error, lsdump, lsfree, remark
.bu
There is no way for the user to intercept a 'string space full' condition.
.sp
If not enough space is available in either the available space list
or highest open list, but enough is available in both, an error
is still signalled.
.sp
Locally supported.
.sa
lsfree (4)
