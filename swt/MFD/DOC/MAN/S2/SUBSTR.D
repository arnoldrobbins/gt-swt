.hd substr "take a substring from a string" 03/23/80
integer function substr (from, to, first, length)
character from (ARB), to (ARB)
integer first, length
.sp
Library:  vswtlb (standard Subsystem library)
.fs
'Substr' copies the portion of the 'from' string specified by
the 'first' and 'length' arguments into the 'to' string and
returns the length of 'to' string as its result.  'First' specifies
the starting character position in 'from'; if it is positive, it
indicates a position relative to the beginning of the string, whereas
if it is negative, the indicated position is relative to the end
of the string.
'Length' specifies the number of characters to be copied; if positive,
[cc]mc |
'length' characters [ul starting]
[cc]mc
with the one selected by 'first' are copied; if negative, 'length'
[cc]mc |
characters [ul ending]
[cc]mc
with the one selected by 'first' are copied.  If the specified
substring overlaps either the beginning or the end of 'from',
'to' will be shorter than 'length' characters.
.am
to
.ca
length
.sa
stake (2), sdrop (2), strim (2), take (1), drop (1), substr (1)
