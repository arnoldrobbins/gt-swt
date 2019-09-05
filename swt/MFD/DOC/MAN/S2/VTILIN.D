[cc]mc |
.hd vtilin "insert lines on the user's terminal screen" 08/16/83
integer function vtilin (row, cnt)
integer row, cnt
.sp
Library: vswtlb (standard Subsystem library)
.fs
'Vtilin' inserts 'cnt' blank lines at line 'row' on the screen.
If 'cnt' is not given, it defaults to 1.
Unlike other 'vth' functions, 'vtilin' makes the changes on the user's
terminal immediately (ie - with no call to 'vtupd').
'Vtilin' will take advantage of a terminal's hardware insert
line function, if one is available, otherwise it will simulate
it with whatever other functions the terminal possesses.
The function return is ERR if 'row' is off the screen or
'cnt' is negative and OK otherwise.
.im
'Vtilin' first ensures that 'row' is on the screen and that 'cnt'
is positive. If a hardware insert line function is available, the
subroutine simply positions to the correct place on the screen and
outputs the appropriate number of line inserts. If hardware insert
is not available the subroutine attempts to use a hardware clear
to end-of-line function to clear sections of the screen and then
redraw the rest of the screen. If no hardware clear to end-of-line
is available the subroutine just writes blanks to clear the correct
section and then redraws the rest of the screen.
.ca
move$, vt$del, vt$out, vtmove
.am
none
.sa
Other vt?* routines (2)
[cc]mc
