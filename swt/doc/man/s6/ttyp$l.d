[cc]mc |
.hd ttyp$l "list the available terminal types" 08/30/84
[cc]mc
subroutine ttyp$l
.sp
Library:  vswtlb (standard Subsystem library)
.fs
'Ttyp$l' will list all of the terminal types that are
supported by the Subsystem and its associated software
packages (such as VTH).
.im
'Ttyp$l' opens the "=ttypes=" (nominally "//extra/terms") file,
if it can, and lists the
terminal types available in a readable format to the terminal.
.ca
close, input, length, open, print
[cc]mc |
.bu
Some might consider it a bug that the output is always
written to the terminal.
[cc]mc
.sa
se (1), term (1), term_type (1), other ttyp$?* routines (6)
