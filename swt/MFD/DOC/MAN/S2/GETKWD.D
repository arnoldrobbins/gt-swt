.hd getkwd "look for keyword/value arguments" 03/23/80
integer function getkwd (keyword, value, length, default)
character keyword (ARB), value (ARB), default (ARB)
integer length
.sp
Library:  vswtlb (standard Subsystem library)
.fs
'Getkwd' searches the list of arguments supplied on the command
line for a string that matches the contents of 'keyword'. 'Keyword'
must contain an EOS-terminated string. If a matching argument is
found, the argument string that immediately follows it in the
argument list is returned in the array 'value'; otherwise, the
string contained in 'default' is copied into 'value'.  In either
case, the length of the string returned in 'value' (excluding
EOS) is returned as the result of the function.
'Length' gives the size of the 'value' array in words; no more than
'length'-1 characters will be copied.
.im
'Getarg' is called to access each successive argument string.
Each is compared to the supplied keyword, and if a match is found,
'getarg' is called again to retrieve the immediately following
argument.  If that argument doesn't exist or if the keyword is not
found, as much of the default string as will fit is copied
into the 'value' array, one character at a time.
.am
value
.ca
equal, getarg
.sa
chkarg (2), getarg (2)
