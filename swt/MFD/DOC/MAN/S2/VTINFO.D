.hd vtinfo "return VTH common block information" 07/11/84
integer function vtinfo (key, info)
integer key, info (ARB)
.sp
Library: vswtlb (standard Subsystem library)
.fs
'Vtinfo' is used to return certain needed information from
the VTH common blocks. The first argument is a key to tell
'vtinfo' what set of information to return. The second
argument is an array to return the information.
The function return is OK if a correct key is given, and ERR
otherwise.
.sp
'Vtinfo' currently supports the following value(s) for 'key':
.sp
.tc \
.ta 16
.in +15
.ti -15
VT_MAXRC\returns the maximum row and col values for the user's
terminal in the first two words of 'info'.
.sp
.ti -15
VT_WRAP\returns YES in 'info' if the terminal wraps to the next line
after putting a character in the last column and NO otherwise.
.sp
.ti -15
VT_HWINS\returns YES in 'info' if the terminal has hardware
insert capabilities.
.sp
.ti -15
VT_HWDEL\returns YES in 'info' if the terminal has hardware
delete capabilities.
.sp
.ti -15
VT_HWCEL\returns YES in 'info' if the terminal has hardware
clear to end-of-line capabilities.
.in -15
.tc
.ta
.im
The key is checked as being legal, and then the requested
information is simply copied from the VTH common blocks.
.am
info
.sa
other vt?* routines (2)
