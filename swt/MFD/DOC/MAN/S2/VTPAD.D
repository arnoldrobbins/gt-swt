[cc]mc |
.hd vtpad "pad the rest of a field with blanks" 07/11/84
[cc]mc
subroutine vtpad (len)
integer len
.sp
[cc]mc |
Library: vswtlb (standard Subsystem library)
[cc]mc
.fs
'Vtpad' simply clears the rest of a field with blanks, starting
at the current cursor position. The single argument required is
the length of the field to clear, from the current cursor position.
.im
'Vtpad' simply checks how much more room is on a line with respect
to the length to pad and the current cursor position and then
stores blanks into the new screen, making sure that padding doesn't
go past the end of the screen.
.ca
vt$put
.sa
other vt?* routines (2)
