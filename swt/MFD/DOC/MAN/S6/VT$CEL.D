.hd vt$cel "send a clear to end-of-line sequence" 10/30/84
integer function vt$cel (dummy)
integer dummy
.sp
Library: vswtlb (standard Subsystem library)
.fs
'Vt$cel' is used to clear the line from where the cursor is currently
positioned to the end of the line. The return value is OK if the line
was cleared, and ERR otherwise.
.im
The VTH common block is checked for the existence of a clear to eol
sequence. If one exists, it is written out and the function return
is OK. If there is no sequence, the function return is ERR.
.bu
Not meant to be called by the normal user.
.sa
other vt?* routines (2) and (6)
