.hd vt$del "delay the terminal with nulls" 07/11/84
subroutine vt$del (delay)
integer delay
.sp 1
Library: vswtlb (standard Subsystem library)
.fs
'Vt$del' is used to delay the terminal for 'delay' milliseconds after
certain operations.
.im
The VTH common block is checked for the current baud rate of the
terminal. 'Delay' is then used to calculate the number of nulls to
write to the terminal.
.ca
Primos t1ou
.bu
Not meant to be called by the normal user.
.sa
other vt?* routines (2) and (6)
