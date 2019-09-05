.hd sky$xs "set current cpu keys" 06/25/82
subroutine sky$xs (word)
shortcall sky$xs (2)
.sp
integer word
.sp
Library: shortlb
Also declared in =incl=/shortlb.r.i
.fs
This routine loads bits 1 - 14 of the cpu keys with the corresponding bits
of 'word'.
This can change the processor addressing mode (for the current process),
set or clear the carry and link bits and the condition codes, and change
the system's response to integer, real and decimal exceptions.
.im
Implemented as a simple PMA routine entered via a JSXB (shortcall).
The subroutine uses the TAK instruction.
.sp
Note that any routine using this call must be compiled using the
"-q" option of 'fc'.
.bu
The user can possibly change the current program addressing mode
in a manner that cannot be recovered by this routine.
.sp
Locally supported.
.sa
fc (1), gky$xs (4),
[ul System Architecture Reference Guide] (Prime PDR 3060)
