.hd stk$xs "set/read stack extension pointer" 06/25/82
subroutine stk$xs (root, ptr_to_ext)
shortcall stk$xs (4)
.sp
integer root
pointer ptr_to_ext
.sp
Library: shortlb
Also declared in =incl=/shortlb.r.i
.fs
The Prime machines support the mechanism of a stack that can be extended
into additional segments, as needed.  This routine allows you to
set the extension pointer for any stack, or read the current
extension pointer for any stack.  The function's actions depend
on the value of 'root' (segment of stack root):
.sp
.in +5
If (root == :100000) then the function returns the current extension
pointer in 'ptr_to_ext'. (:100000 == ints(-32768))
.sp
If (root > -32768 & root < 0) then the function returns in 'ptr_to_ext'
the current
extension pointer for the stack whose root is in segment abs(root).
.sp
If (root == 0) then the function sets the extension pointer of the current
stack to the value of 'ptr_to_ext'.
.sp
If (root > 0) then the function sets the extension pointer of the stack
whose root is in segment 'root' to the value in 'ptr_to_ext'.
.in -5
.im
Implemented as a simple PMA routine entered via a JSXB (shortcall).
If the operation is specified as relative to the current stack root
then the stack segment number is taken from SB% + 1 (the current
stack frame root pointer).
.sp
Note that any routine using this call must be compiled using the
"-q" option of 'fc'.
.am
ptr_to_ext
.bu
There is no validity checking done on either the 'root' parameter or
the 'ptr_to_ext' parameter.
.sp
No validation is done to make sure that 'ptr_to_ext' points to
a valid stack.
.sp
Locally supported.
.sa
fc (1),
[ul System Architecture Reference Guide] (Prime PDR 3060)
