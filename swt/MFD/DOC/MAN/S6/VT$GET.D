[cc]mc |
.hd vt$get "get and edit a single line from input" 07/11/84
[cc]mc
integer function vt$get (row, col, start, len)
integer row, col, start, len
.sp
[cc]mc |
Library: vswtlb (standard Subsystem library)
[cc]mc
.fs
'Vt$get' is responsible for reading characters from the terminal
and interpreting the special characters. The first two arguments
are the
'row' and 'column' at which to start accepting input. The third
argument is the start of the input area on the current row,
and the fourth argument is the length of the input area.
'Vt$get' will continue reading from the terminal until a
line termination character is input (RETURN, KILL_RIGHT_AND_RETURN,
MOVE_UP, or MOVE_DOWN). The function return is the termination
code. Any macros are expanded by a call to 'vt$idf'.
.ca
vt$def, vt$err, vt$idf, vt$ndf, vt$out, vt$put,
vtmove, vtmsg, vtupd, Primos c1in
.bu
Not meant to be called by the normal user.
.sa
other vt?* routines (2) and (6), se (1), and the
[ul Introduction to the Software Tools Text Editor] (Se section)
for a list of available special characters.
