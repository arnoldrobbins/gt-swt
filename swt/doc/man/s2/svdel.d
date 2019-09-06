[cc]mc |
.hd svdel "delete a shell variable at the current level" 05/27/83
subroutine svdel (name)
character name (ARB)
.sp
Library:  vshlib (shell routine library)
.fs
'Svdel' deletes a shell variable at the current lexic level of
the shell. 'Name' contains the name of the variable
to delete. 'Svdel' cannot delete a variable global to the current scope.
Changes to shell variables that control values in the
SWT common block ("_eof" for example) occur immediately. If
one of these values is deleted, the value in the common block
reverts to the value it contained in the previous scope.
.im
If the variable does not exist at the current lexic level, the
subroutine returns; otherwise, it deallocates the space in the
internal variable common block for
the name and value and then returns. If the variable is used
to control a location in the SWT common block, the current
value is replaced by the value it had when the current scope
was invoked.
.am
none
.sa
other sv?* routines (2)
[cc]mc
