[cc]mc |
.hd vt$ier "report error in VTH initialization file" 07/11/84
[cc]mc
integer function vt$ier (msg, name, line, fd)
character msg (ARB), name (ARB), line (ARB)
file_des fd
.sp
[cc]mc |
Library: vswtlb (standard Subsystem library)
[cc]mc
.fs
'Vt$ier' is used to report an error in the contents of the
terminal characteristics file (=vth=/?*). The file name 'name',
a message 'msg' explaining the error, and the line 'line' from the
file which caused the error are printed to ERROUT.
.im
'Vt$ier' calls 'print' to output the file name, the error message,
and the erroneous line from the file to ERROUT. The VTH initialization
file indicated by 'fd' is closed, and the function returns ERR.
.ca
close, print
.bu
Not meant to be called by the normal user.
.sa
other vt?* routines (2) and (6)
