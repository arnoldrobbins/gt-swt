[cc]mc |
.hd vtmove "move the user's cursor to row, col" 07/11/84
[cc]mc
subroutine vtmove (row, col)
integer row, col
.sp
[cc]mc |
Library: vswtlb (standard Subsystem library)
[cc]mc
.fs
'Vtmove' moves the cursor on the terminal to position 'row', 'col'
with the
least cost. 'Vtinit' should have been called beforehand
to set up the terminal characteristics in the virtual terminal
handler. If the coordinates given are off of the screen, no
positioning will be done.
.im
'Vtmove' first checks if relative movement would be faster,
and if so, relatively positions the cursor, otherwise it
calls 'vt$pos' to absolutely position the cursor.
.ca
vt$pos, vt$out
.sa
other vt?* routines (2)
