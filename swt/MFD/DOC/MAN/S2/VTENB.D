[cc]mc |
.hd vtenb "enable input on a particular screen line" 07/11/84
[cc]mc
subroutine vtenb (row, column, length)
integer row, column, length
.sp
[cc]mc |
Library: vswtlb (standard Subsystem library)
[cc]mc
.fs
'Vtenb' enables input in a field with a particular length,
starting at the given (row, column) on the screen. Any
areas of the screen that are not enabled by 'vtenb' cannot
be used for entry of data; therefore 'vtenb' must be called
before 'vtread' can be used.
.im
'Row' is checked as being on the screen, and if not, an
immediate return is executed and input is not enabled at
that location.  'Column' and 'length' are checked as being
on the screen, and if the values specified "run off" the screen,
the length is truncated to the border of the screen. Input
is then enabled starting at (row, column) for 'length' characters,
or to the border of the screen.
.bu
Allows only one input area per line.
.sa
other vt?* routines (2)
