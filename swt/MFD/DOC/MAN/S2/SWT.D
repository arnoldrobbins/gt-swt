.hd swt "return to Software Tools Subsystem" 03/25/82
subroutine swt
.sp
Library:  vswtlb (standard Subsystem library)
.fs
'Swt' is called by all Subsystem programs to return to the Subsystem
command interpreter.
.im
'Swt' calls 'rtn$$' to return to the Subsystem command
interpreter.
.ca
rtn$$
.sa
call$$ (6)
