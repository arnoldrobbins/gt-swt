.hd gvlarg "obtain the value of a key-letter argument" 01/07/83
integer function gvlarg (str, state)
character str (ARB)
integer state (4)
.sp
Library:  vswtlb (standard Subsystem library)
.fs
'Gvlarg' returns the next argument and updates the state vector;
it is normally used in conjunction with 'gklarg' and 'gfnarg'.
If the next argument begins with a hyphen, 'gvlarg' returns
an empty string.  'Gvlarg' returns EOF if the argument list
has been exhausted; otherwise it returns OK.
.sp
'Gvlarg' exists solely to hide the structure of the state vector
when an argument must be fetched between calls to 'gklarg'
and 'gfnarg'.
.im
Trivial.
.am
str, state
.ca
error, getarg
.sa
gfnarg (2), gklarg (2)
