.hd clock "digital time-of-day clock for CRTs" 02/22/82
clock
.ds
'Clock' generates the display for a digital clock, in the form
"hh:mm:ss".  It can be used on any CRT terminal that supports the
"backspace" function.  Time-of-day is guaranteed to be as accurate
as the wristwatch of whoever last set the system time.
.sp
'Clock' is terminated by typing control-P or by pressing the
BREAK key.
.es
clock
.bu
Works only on CRT terminals.
.sa
date (1), day (1), time (1), date (2)
