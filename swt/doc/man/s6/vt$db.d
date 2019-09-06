[cc]mc |
.hd vt$db "dump terminal characteristics" 07/11/84
[cc]mc
subroutine vt$db
.sp
[cc]mc |
Library: vswtlb (standard Subsystem library)
[cc]mc
.fs
'Vt$db' is used to print out the values of terminal characteristics
in the VTH common block.  'Vtinit' should have been called
beforehand to set up these terminal characteristics.
.im
'Vt$db1' is called to print the mnemonics for the cursor movement
control sequences. Then the numerical terminal characteristics
(such as cursor movement delay time and screen dimensions) are
output by calls to 'print'. All output is to ERROUT.
.ca
ctomn, print, vt$db1
.bu
Not meant to be called by the normal user.
.sp
Used mainly for debugging of the VTH package.
.sa
other vt?* routines (2) and (6)
