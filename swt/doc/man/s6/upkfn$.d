.hd upkfn$ "unpack a Primos file name; escape slashes" 01/06/83
integer function upkfn$ (name, len, str, max)
packed_char name (ARB)
integer len, max
character str (ARB)
.sp
Library:  vswtlb (standard Subsystem library)
.fs
'Upkfn$' operates on the packed Primos file name or password
of length 'len' in 'name'.  It converts it
to an EOS-terminated string in 'str'
by unpacking it and placing the escape character ("@@") in
front of all slashes.  Thus, the name in 'str' is acceptable to
all Subsystem routines expecting a file or path name.
.sp
The function value is the number of characters placed
in 'str'.  In no case will more than 'max' elements of
'str' be disturbed.
.im
'Upkfn$' uses the Subsystem macro 'fpchar' to take successive
characters from the packed name.  Each character is copied into
the receiving string (preceded by an escape character, if it
is a slash) after being mapped to lower case
until the string is full or the end of the name
is reached.
.am
str
.ca
mapdn
.sa
follow (2), getto (2), open (2), ptoc (2)
