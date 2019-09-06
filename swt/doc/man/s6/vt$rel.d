.hd vt$rel "position relatively to row, col" 11/06/84
subroutine vt$rel (row, col, crow, ccol)
integer row, col, crow, ccol
.sp
Library: vswtlb (standard Subsystem library)
.fs
'Vt$rel' positions the cursor on the terminal screen to 'row', 'col'
from position 'crow', 'ccol' using only relative cursor positioning.
'Vtinit' or 'vtterm' should have been called previously to set up
the terminal characteristics. 'Vt$rel' is called as a last resort to
position the cursor by 'vt$pos'. If it is impossible to position the
cursor with what knowlege it has, 'vtterm' will have already returned
an error.
.im
'Vt$rel' uses whatever capabilities are available to position the cursor.
If the terminal lacks a cursor_up sequence, the cursor is homed to the
upper left hand side of the screen and moved down using the cursor_down
sequence, or issuing LF characters (which is relatively universal). It
moves the cursor to the right my issuing the cursor_right sequence
and to the left by issuing the cursor_left sequence, or by issuing a
CR character and issuing the cursor_right sequence.
.bu
Not meant to be called by the normal user.
.sa
other vt?* routines (2) and (6)
