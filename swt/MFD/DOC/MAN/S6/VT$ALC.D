[cc]mc |
.hd vt$alc "allocate another VTH definition table" 07/11/84
[cc]mc
integer function vt$alc (tbl, c)
integer tbl
character c
.sp
[cc]mc |
Library: vswtlb (standard Subsystem library)
[cc]mc
.fs
'Vt$alc' is used to allocate another VTH definition table
for the key sequence definitions.
.im
'Vt$alc' verifies that there is room for another definition
table and then initializes the new table if there is room.
The "next table" pointer in the table 'tbl' is set to indicate
the index to the new table.
If no room is found, then ERR is returned.
.am
tbl
.bu
Not meant to be called by the normal user.
.sa
other vt?* routines (2) and (6)
