[cc]mc |
.hd vt$dsw "perform garbage collection on DFA tables" 07/11/84
[cc]mc
subroutine vt$dsw
.sp
[cc]mc |
Library: vswtlb (standard Subsystem library)
[cc]mc
.fs
'Vt$dsw' reclaims the space occupied by unused definition tables
for use in storing other definitions.
.im
'Vt$dsw' looks for tables whose entries have all been
undefined; their "in use" indicators are reset, and all references
to them by other tables are removed.
.ca
vtprt
.bu
Not meant to be called by the normal user.
.sa
other vt?* routines (2) and (6)
