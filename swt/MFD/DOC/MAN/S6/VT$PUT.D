[cc]mc |
.hd vt$put "copy string into terminal buffer" 07/11/84
[cc]mc
subroutine vt$put (str, row, col, len)
character str (ARB)
integer row, col, len
.sp
[cc]mc |
Library: vswtlb (standard Subsystem library)
[cc]mc
.fs
'Vt$put' takes the string given in 'str' and copies it to the
screen buffers so that when the screen is next updated, the
string appears starting at row 'row' and column 'col'.  'Len'
indicates how long the string is.
.im
'Vt$put' first verifies that a legal location on the screen
is given by the coordinates ('row', 'col'); if they are off the
screen, then internal buffer variables are set to defaults
which will prevent strange updating of the screen.  Otherwise,
the line is "fitted" to the screen; as much of it as possible
will be displayed without overstepping the screen boundaries.
The string in 'str' is then packed into the screen buffer,
ready for the next screen update to occur.
.ca
print
.bu
Not meant to be called by the normal user.
.sa
other vt?* routines (2) and (6)
