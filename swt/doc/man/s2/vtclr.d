[cc]mc |
.hd vtclr "clear a rectangle on the screen" 07/11/84
[cc]mc
subroutine vtclr (srow, scol, erow, ecol)
integer srow, scol, erow, ecol
.sp
[cc]mc |
Library: vswtlb (standard Subsystem library)
[cc]mc
.fs
'Vtclr' is used to clear a rectangle on the users terminal.
The arguments are the starting row 'srow', starting column 'scol',
ending row 'erow', and ending column 'ecol'.
.im
After boundaries are checked and truncated (to 1 for values
less than 1, and MAXCOL and MAXROW for values greater than
their respective dimension) a small loop simply writes sequences
of blanks on the screen using 'vt$put'.
.ca
vt$put
.sa
other vt?* routines (2)
