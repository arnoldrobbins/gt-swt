.hd parsdt "parse a date in mm/dd/yy format" 03/20/80
integer function parsdt (str, i, month, day, year)
character str (ARB)
integer i, month, day, year

Library: vswtlb (standard Subsystem library)
.fs
'Parsdt' examines the string passed to it in 'str', starting
at position 'i' and attempts to interpret it as a Gregorian
date.  The string being examined is expected to be in any of
three formats: a single integer, which is interpreted as
a day in the current month of the current year; a pair of
integers separated by a slash (/), which is interpreted as
a month of the current year followed by a day within that month;
or three integers separated by slashes, which is interpreted
in the obvious way.
.sp
If the string is found to be a valid date (both syntactically
and semantically), the arguments 'month', 'day' and 'year' are
set appropriately, and OK is returned as the function value.
Otherwise, the contents of 'month', 'day' and 'year' are
unpredictable and ERR is returned as the function value.
In all cases, the string index 'i' is advanced beyond
the last character examined in the string.
.im
After skipping leading blanks and checking the first
non-blank character to be sure it is a digit, 'parsdt' calls
'ctoi' to convert the string to an integer.  As long as there
are trailing slashes, 'ctoi' is called repeatedly until
a month, day and year have been parsed.  If at any point
a trailing slash is not encountered, 'parsdt' calls 'date'
to retrieve the current date and parses the remaining items
from that string.
.ca
ctoi, date
.am
i, month, day, year
.sa
parstm (2)
