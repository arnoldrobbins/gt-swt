.hd vt$pos "position the cursor to row, col" 11/06/84
integer function vt$pos (row, col, crow, ccol)
integer row, col, crow, ccol
.sp
Library: vswtlb (standard Subsystem library)
.fs
'Vt$pos' positions the cursor on the terminal screen to 'row', 'col'
from 'Crow', 'ccol'. If the positioning can be done faster relatively,
a relative position is output, otherwise the positioning is done
absolutely. 'Vtinit' or 'vtterm' should have been called beforehand
to set up the terminal characteristics in the virtual terminal
handler.  If the positioning can be done, 'vt$pos' returns OK. If the
positioning can't be done, or the row and column are out of the
terminal's screen boundary, ERR is returned.
.im
'Vt$pos' after checking to make sure the coordinates given are actually
on the terminal's screen, computes a 'row-coordinate' and a
'column-coordinate' that are output after the lead-in absolute
cursor positioning sequence for the terminal.  There are only a few
different standard ways to compute this character. Based on how the
terminal does absolute addressing, 'vt$pos' then outputs the characters
in the correct sequence to do the positioning.
A small delay (usually nulls) is output
for terminals that need it.
Interested users should look at the code for more information.
.ca
print, vt$del
.bu
Not meant to be called by the normal user.
.sa
other vt?* routines (2) and (6)
