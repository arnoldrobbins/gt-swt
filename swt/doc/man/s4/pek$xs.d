.hd pek$xs "look at a location in memory" 06/25/82
subroutine pek$xs (ptr_to_word, contents)
shortcall pek$xs (4)
.sp
pointer ptr_to_word
untyped contents
.sp
Library: shortlb
Also declared in =incl=/shortlb.r.i
.fs
The subroutine returns the contents of the word at the address
'ptr_to_word'.  Effectively,
.sp
.ce
call pek$xs (loc(word), contents)
.sp
is equivalent to
.sp
.ce
contents = word
.im
Implemented as a simple PMA routine entered via a JSXB (shortcall).
.sp
Note that any routine using this call must be compiled using the
"-q" option of 'fc'.
.am
contents
.bu
No validity check is done on the pointer.
.sp
Locally supported.
.sa
fc (1), pok$xs (4)
