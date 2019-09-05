.hd reonu$ "on-unit for the REENTER$ condition" 02/24/82
subroutine reonu$ (ptr)
pointer ptr
.sp
Library:  vswtlb (standard Subsystem library)
.fs
'Reonu$' is called from the Primos condition mechanism when
the Primos internal command REN is given.  'Reonu$' returns
to the caller who most recently declared 'reonu$' as its
on-unit for the "REENTER$" condition.
.im
Using information passed by the condition mechanism, 'reonu$'
finds the stack frame of the declarer of its on-unit and
unwinds the stack with a call to the Primos routine PL1$NL.
.ca
Primos pl1$nl
.sa
sys$$ (2)
