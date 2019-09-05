[cc]mc |
.hd vt$ndf "remove VTH macro definition" 07/11/84
[cc]mc
integer function vt$ndf (ch)
character ch
.sp
[cc]mc |
Library: vswtlb (standard Subsystem library)
[cc]mc
.fs
'Vt$ndf' removes keyboard macro definitions from the
appropriate tables.
.im
'Vt$ndf' prompts the user for the sequence which is to be
removed from the definition tables.  If the sequence is found,
then its definition is removed and its associated definition
tables are garbage collected; otherwise, ERR is returned.
.ca
vtmsg, vtupd, vt$dsw, vt$err, vt$gsq, vt$rdf, Primos c1in
.bu
Not meant to be called by the normal user.
.sa
other vt?* routines (2) and (6)
