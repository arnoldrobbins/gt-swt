.hd s1c$xs "protected single-word store operation" 06/25/82
logical function s1c$xs (ptr_to_variable, old_value, new_value)
shortcall s1c$xs (4)
.sp
pointer ptr_to_variable
untyped old_value, new_value
.sp
Library: shortlb
Also declared in =incl=/shortlb.r.i
.fs
The function implements an uninterruptable form of test-and-set
operation.  The parameter 'ptr_to_variable' is a 2 word virtual memory
pointer to a 1 word location in memory to be tested and
possibly modified.
.sp
If the variable contains the same value as provided in 'old_value'
then the variable is updated to 'new_value' and the function returns
TRUE.  If the variable is not equal to 'old_value' then the function
returns FALSE and no change is made to the variable.
Effectively,
.in +12
.sp
.nf
if (variable == old_value) {
   variable = new_value
   return (TRUE)
   }
.sp
else
   return (FALSE)
.in -12
.fi
.im
Implemented as a simple PMA routine entered via a JSXB (shortcall).
The function uses the STAC instruction which is guaranteed to
be atomic (non-interruptable).
.sp
Note that any routine using this call must be compiled using the
"-q" option of 'fc'.
.bu
The pointer supplied is not checked for validity.
.sp
Locally supported.
.sa
fc (1), s2c$xs (4),
[ul System Architecture Reference Guide] (Prime PDR 3060)
