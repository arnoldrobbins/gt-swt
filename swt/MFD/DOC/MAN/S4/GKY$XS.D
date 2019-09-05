.hd gky$xs "get current cpu keys" 06/25/82
subroutine gky$xs (word)
shortcall gky$xs (2)
.sp
integer word
.sp
Library: shortlb
Also declared in =incl=/shortlb.r.i
.fs
This subroutine loads the current cpu keys into 'word'.
.im
Implemented as a simple PMA routine entered via a JSXB (shortcall).
The subroutine uses the TKA instruction.
.sp
Note that any routine using this call must be compiled using the
"-q" option of 'fc'.
.am
word
.bu
Locally supported.
.sa
fc (1), sky$xs (4),
[ul System Architecture Reference Guide] (Prime PDR 3060)
