[cc]mc |
.hd vtdlin "delete lines on the user's terminal screen" 08/16/83
integer function vtdlin (row, cnt)
integer row, cnt
.sp
Library: vswtlb (standard Subsystem library)
.fs
'Vtdlin' deletes 'cnt' lines starting at line 'row' on the screen.
If 'cnt' is not given, it defaults to 1.
Unlike other 'vth' functions, 'vtdlin' makes the changes on the user's
terminal immediately (ie - with no call to 'vtupd').
'Vtdlin' will take advantage of a terminal's hardware delete
line function, if one is available, otherwise it will simulate
it with whatever other functions the terminal possesses.
The function return is ERR if 'row' is off the screen or
'cnt' is negative and OK otherwise.
.im
'Vtdlin' first ensures that 'row' is on the screen and that 'cnt'
is positive. If a hardware delete line function is available, the
subroutine simply positions to the correct place on the screen and
outputs the appropriate number of line deletes. If hardware delete
is not available, the subroutine redraws the appropriate sections and
attempts to use a hardware clear to end-of-line function to clear
the bottom sections of the screen.
If no hardware clear to end-of-line
is available, the subroutine just redraws the screen using blanks to
clear the correct sections.
.ca
move$, vt$del, vt$out, vtmove
.am
none
.sa
Other vt?* routines (2)
[cc]mc
