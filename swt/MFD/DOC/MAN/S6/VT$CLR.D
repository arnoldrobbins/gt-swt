[cc]mc |
.hd vt$clr "send clear screen sequence" 07/11/84
[cc]mc
integer function vt$clr (dummy)
integer dummy
.sp
[cc]mc |
Library: vswtlb (standard Subsystem library)
[cc]mc
.fs
'Vt$clr' is used to clear the screen on the user's
terminal. The return value is OK if the screen was
cleared, and ERR otherwise.
.im
The VTH common block is checked for the existence of a clear screen
sequence. If one exists, it is written out, 'vt$del' is called
to print out a small delay sequence, and the function return
is OK. If no sequence exists, the return is ERR.
.ca
vt$del
.bu
Not meant to be called by the normal user.
.sa
other vt?* routines (2) and (6)
