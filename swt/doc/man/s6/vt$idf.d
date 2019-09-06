[cc]mc |
.hd vt$idf "invoke user-defined key definition" 07/11/84
[cc]mc
integer function vt$idf (c)
character c
.sp
[cc]mc |
Library: vswtlb (standard Subsystem library)
[cc]mc
.fs
'Vt$idf' is invoked to expand the definition of a keyboard
macro which is encountered in user input; the definition is
pushed back into the input stream.
.im
'Vt$idf' first checks for infinite recursive definition expansion.
If it detects too high a nesting level, it returns ERR; otherwise,
it locates the definition sequence, and copies it into the input
pushback buffer.  If the definition exceeds the capacity of the
pushback buffer, ERR is returned; otherwise, OK is returned.
.ca
vt$err
.bu
Not meant to be called by the normal user.
.sa
other vt?* routines (2) and (6)
