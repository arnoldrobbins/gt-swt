.hd vtbaud "set vth's concept of the terminal speed" 11/06/84
subroutine vtbaud (rate)
integer rate
.sp
Library: vswtlb (standard Subsystem library)
.fs
'Vtbaud' is used to set the terminal baud rate for other VTH routines.
'Rate' can be from 50 to 19200. A number lower than 50 will be set
to 50 and one higher than 19200 will be set to 19200. This value is used
to determine the delay times for special functions such as screen
clearing and cursor positioning.
.im
After truncating 'rate' to the boundary conditions, the value is
saved in the SWT common blocks for later use.
.sa
other vt?* routines (2)
