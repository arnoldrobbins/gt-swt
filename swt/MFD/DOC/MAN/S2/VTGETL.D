[cc]mc |
.hd vtgetl "get a line from the VTH screen" 07/11/84
[cc]mc
integer function vtgetl (str, row, column, length)
character str (ARB)
integer row, column, length
.sp
[cc]mc |
Library: vswtlb (standard Subsystem library)
[cc]mc
.fs
'Vtgetl' transfers data from the internal screen buffer
to a string supplied by the user. 'Row' and 'column' locate
the starting position of the input field on the screen,
and the argument 'length' specifies its length. The function
return is the actual length of the of the string returned
in 'str'. Note that 'vtgetl' doesn't actually perform a
read; it simply returns what is in the internal screen buffer.
'Vtread' must be called beforehand to allow the user to enter data.
.im
A check is made to see that the 'row' argument is within
bounds, and if not, the string returned is EOS and the length
returned is 0. If the 'column' and/or 'length' arguments
cause a request that is off the screen, the string is truncated
to the edge of the screen buffer. Then a loop simply
retrieves characters from the screen buffer and places them
in 'str', and the length of the retrieved string returned.
.am
str
.sa
vtread (2), and other vt?* routines (2)
