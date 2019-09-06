.hd ctoi "convert ascii string to integer" 03/23/80
integer function ctoi (str, i)
character str (ARB)
integer i
.sp
Library:  vswtlb (standard Subsystem library)
.fs
'Ctoi' converts the integer in ASCII character representation at position
'i' of the given string to binary format.  'I' is incremented to point to the
position just after the integer.  If the character at position 'i' is not
numeric when 'ctoi' is entered, the value zero is returned (the exceptions
are blanks and tabs; these characters are ignored at the start of the
number). 'Ctoi' does not recognize a leading plus or minus sign.
.im
'Ctoi' scans the string, using the argument 'i' as the starting position.
Leading blanks and tabs are skipped.  If a numeric is encountered, it
is added to ten times the current value of the integer, and the scan
continues; otherwise, 'ctoi' exits with the desired value.
.am
i
.sa
itoc (2), gitoc (2), gctoi (2), other conversion routines
('cto?*' and '?*toc') (2)
