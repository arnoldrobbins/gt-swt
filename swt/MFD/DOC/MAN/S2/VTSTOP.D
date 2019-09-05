[cc]mc |
.hd vtstop "reset a user's terminal attributes" 07/11/84
[cc]mc
subroutine vtstop
.sp 2
[cc]mc |
Library: vswtlb (standard Subsystem library)
[cc]mc
.fs
'Vtstop' resets terminal attributes when terminating
the VTH portion of a program.
.im
'Vtstop' first positions to the first column of the last row on the
user's terminal.
'Vtstop' then retrieves the previous terminal attributes from the VTH
common block (where they are saved by 'vtinit') and restores
the attributes by a call to the Primos routine DUPLX$.
.ca
vtmove, Primos duplx$
.sa
other vt?* routines (2)
