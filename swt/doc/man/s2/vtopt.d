[cc]mc |
.hd vtopt "set options for the virtual terminal handler" 07/11/84
[cc]mc
subroutine vtopt (option, str)
integer option, str (ARB)
.sp
[cc]mc |
Library: vswtlb (standard Subsystem library)
[cc]mc
.fs
'Vtopt' sets a number of optional parameters for the VTH
screen. The currently available values for 'option' are:
.sp
.tc \
.ta 15
.in +15
.ti -15
STATUS_ROW\ enable a "status row"; 'str' should be the row number
on which the "status[bl]row" is to be displayed.
.sp
.ti -15
DISPLAY_TIME\ enable/disable the time display in the "status[bl]row";
'str' should be YES to enable the display and it should be NO to
disable the display.
.sp
.ti -15
UNPRINTABLE_CHARS\display a printable representation of normally
unprintable characters; 'str (1)' should contain the replacement
character (as a character variable).
.sp
.ti -15
SET_TABS\set tab stops for input; 'str' should contain an EOS
string containing non-blank characters where tab stops are to be set.
.in -15
.sp
.tc
.ta
.im
'Vtopt' simply sets certain variables in the VTH common block to
allow the rest of the routines to keep up with the attributes.
For STATUS_ROW, the "status row" is written out and a flag
indicating that there is a status row, is set. For the rest
of the options, though, flags are set to indicate each option.
.ca
vt$put
.sa
other vt?* routines (2)
