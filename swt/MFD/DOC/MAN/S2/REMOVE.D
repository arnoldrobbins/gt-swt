[cc]mc |
.hd remove "remove a file, return status" 07/04/83
[cc]mc
integer function remove (pathname)
character pathname (ARB)
.sp
Library:  vswtlb (standard Subsystem library)
.fs
'Remove' deletes the file specified by the pathname given as the first
argument.  If the deletion could not be carried out, ERR is returned;
otherwise, OK is returned.
.im
'Getto' is called to attach to the UFD containing the undesirable file.
The file is deleted by a call to 'rmfil$', and
[cc]mc |
a call to the Primos routine AT$HOM attaches
[cc]mc
the user back to his home directory.
If any call to 'rmfil$' or 'getto' fails, ERR is returned;
otherwise, OK is returned.
.ca
[cc]mc |
getto, Primos srch$$, Primos at$hom
[cc]mc
.sa
getto (2), rmtemp (2), rmfil$ (6), del (1)
