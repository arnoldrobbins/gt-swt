.hd rtn$$ "return to stack frame of call$$" 01/06/83
subroutine rtn$$
.sp
Library:  vswtlb (standard Subsystem library)
.fs
'Rtn$$' unwinds the stack and returns to the routine (usually 'call$$')
indicated by 'rtlabel' in the Subsystem common block.
.im
'Rtn$$' first checks the Primos command level data flags to
see if the calling routine was DBG; if so, it immediately exits.
If it was not called by DBG, 'rtn$$' returns to the routine
indicated by 'rtlabel' via the Primos routine PL1$NL.
.ca
Primos pl1$nl
.sa
call$$ (6)
