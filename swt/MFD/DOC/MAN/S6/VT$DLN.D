.hd vt$dln "send a delete line sequence" 10/30/84
integer function vt$dln (dummy)
integer dummy
.sp
Library: vswtlb (standard Subsystem library)
.fs
'Vt$dln' is used to delete a line at the current cursor position on
the user's screen. The return value is OK if the line was deleted
and ERR otherwise.
.im
The subsystem common block is checked for the existence of a delete
line sequence. If one exists, it is written out and 'vt$del' is called
to print out a small delay sequence. If the sequence existed, the
function returns OK and if it did not exist, the function returns ERR.
.ca
vt$del
.bu
Not meant to be called by the normal user.
.sa
other vt?* routines (2) and (6)
