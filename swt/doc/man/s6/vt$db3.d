[cc]mc |
.hd vt$db3 "dump macro definition table" 07/11/84
[cc]mc
subroutine vt$db3
.sp
[cc]mc |
Library: vswtlb (standard Subsystem library)
[cc]mc
.fs
'Vt$db3' prints the actual definition sequences for the
keyboard macros.
.im
After printing out a heading, 'vt$db3' prints out each
character in the macro definition sequence, mapping
unprintable characters to their corresponding mnemonic.
.ca
ctomn, print
.bu
Not meant to be called by the normal user.
.sa
other vt?* routines (2) and (6)
