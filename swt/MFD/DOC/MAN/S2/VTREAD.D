[cc]mc |
.hd vtread "read characters from a user's terminal" 07/11/84
[cc]mc
integer function vtread (crow, ccol, clr)
integer crow, ccol, clr
.sp
[cc]mc |
Library: vswtlb (standard Subsystem library)
[cc]mc
.fs
'Vtread' starts reading characters from the user's terminal into
the screen buffers. 'Vtenb' must be called before 'vtread' to
enable input areas. 'Crow' and 'ccol' are the places at which
to start reading. 'Clr' is a flag to let 'vtread' know if the user
wants the input areas cleared before reading. If 'clr' is YES,
then the input areas are cleared before reading, otherwise they
are left as they are.
.im
'Clr' is checked to decide whether or not to clear the input areas, and
[cc]mc |
if so, proceeds to call 'vt$put' to place blanks in these areas, and
[cc]mc
calls 'vtupd' to update these changes. It then positions to the
input area at the given row and column. If there is no input area
defined there, it positions to the next one defined.
If there are no input areas defined, the function return is set to
zero and 'vtread' returns. If an input area has been defined, it calls
'vt$get' to read characters from the terminal and place them on
the screen, until a termination character is typed
(RETURN, KILL_RIGHT_AND_RETURN, MOVE_UP, MOVE_DOWN)
and then returns the termination code as the function return.
.ca
vt$put, vt$get, vtupd
.am
none
.sa
[ul Introduction to the Software Tools Text Editor] (Se section),
and other vt?* routines (2)
