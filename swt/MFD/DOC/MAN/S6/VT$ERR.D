[cc]mc |
.hd vt$err "display a VTH error message" 07/11/84
[cc]mc
subroutine vt$err (msg)
character msg (ARB)
.sp
[cc]mc |
Library: vswtlb (standard Subsystem library)
[cc]mc
.fs
'Vt$err' prints the specified message, 'msg', in the status
line (if one exists), and resets the VTH pushback buffer
to 0.
.im
A call to 'vtmsg' is made to print the message on the status line
(if one is enabled). Then the pushback pointer in the VTH common
block is set to 0 and a BEL character is printed.
.ca
vtmsg, vtupd, Primos t1ou
.bu
Not meant to be called by the normal user.
.sa
other vt?* routines (2) and (6)
