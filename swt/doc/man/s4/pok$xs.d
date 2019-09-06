.hd pok$xs "change a location in memory" 06/25/82
subroutine pok$xs (ptr_to_word, contents)
shortcall pok$xs (4)
.sp
pointer ptr_to_word
untyped contents
.sp
Library: shortlb
Also declared in =incl=/shortlb.r.i
.fs
The subroutine changes the contents of the word at the address
'ptr_to_word'.  Effectively,
.sp
.ce
call pok$xs (loc(word), contents)
.sp
is equivalent to
.sp
.ce
word = contents
.im
Implemented as a simple PMA routine entered via a JSXB (shortcall).
.sp
Note that any routine using this call must be compiled using the
"-q" option of 'fc'.
.bu
No validity check is done on the pointer.
.sp
The user may do very peculiar things to his/her environment
if the call is not used with care.
.sp
Locally supported.
.sa
fc (1), pek$xs (4), s1c$xs (4), s2c$xs (4)
