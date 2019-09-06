.hd parstm "convert time-of-day to seconds past midnight" 03/28/80
integer function parstm (str, i, val)
character str (ARB)
integer i
long_int val
.sp
Library:  vswtlb  (standard Subsystem library)
.fs
'Parstm' converts a standard textual time-of-day representation
into the number of seconds since midnight.
The argument 'str' starting at position 'i' is assumed to be
an EOS-terminated string containing the time-of-day in the format
"<hours>[:<minutes>[:<seconds>]]['am'|'pm']".
'Val' is a long integer variable which receives the result of
the conversion.
The function return is OK if the conversion succeeded, ERR
otherwise.
As with most conversion routines, the position argument 'i' is
updated to point to the first character in the input string that
is not a part of the time-of-day.
.im
'Parstm' simply scans the string accumulating the components of
the time as it goes, calculating 'val' in the process.
Errors occur if there is no leading digit or if the time specified
yields more than 86,400 seconds.
.am
i
.ca
ctoi, mapdn
.bu
Does not check the time string for legality.
Behavior at midnight and noon may not be correct.
.sa
parsdt (2)
