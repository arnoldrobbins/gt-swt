[cc]mc |
.hd vt$rdf "remove macro definition of a DFA entry" 07/11/84
[cc]mc
subroutine vt$rdf (c, tbl)
character c
integer tbl
.sp
[cc]mc |
Library: vswtlb (standard Subsystem library)
[cc]mc
.fs
'Vt$rdf' removes a keyboard macro definition sequence from
the definition tables.
.im
'Vt$rdf' locates the definition sequence in the definition
tables and "packs" the table to remove the definition.
.ca
length
.bu
Not meant to be called by the normal user.
.sa
other vt?* routines (2) and (6)
