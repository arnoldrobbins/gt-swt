[cc]mc |
.hd vtupd "update the terminal screen with VTH screen" 07/11/84
[cc]mc
subroutine vtupd (clr)
integer clr
.sp
[cc]mc |
Library: vswtlb (standard Subsystem library)
[cc]mc
.fs
'Vtupd' is used to update the changes from the last (old) VTH screen
buffer to the new screen buffer on the terminal screen.
The argument is a flag which tells whether or not to clear the screen
and redraw, or only update the screen with the changes.  If
'clr' is YES, the entire screen is cleared and completely redrawn.
If 'clr' is NO, only the changes needed are made on the
screen.
.im
After making the changes to the screen, the new screen buffer image
is copied into the old screen buffer image for the next time around.
'Vtupd' is reasonably efficient in updating the screen and copying
the old screen to the new screen.
.ca
vt$clr, vt$out, date, vtmove, vtmsg
.sa
other vt?* routines (2)
