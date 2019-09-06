.hd first$ "check for first call" 02/24/82
integer function first$ (flag)
integer flag
.sp
Library: vswtlb (standard Subsystem library)
.fs
'First$' checks to see if this is the first call to itself.
If it is being called for the first time, then it returns
YES; otherwise, it returns NO.  'Flag' is set to the return
value, in either case.
.sp
'First$' is used by the 'swt' command to prevent further calls to
itself when a previous invocation is still active.
.im
'First$' checks the Subsystem common area variable 'first_use'
to see if it contains a special value; if it doesn't, then a YES
is returned and this special value is set.  If it finds the
special value, then it returns NO.
.am
flag
