[cc]mc |
.hd rmfil$ "remove a file, return status" 08/30/84
[cc]mc
integer function rmfil$ (name)
[cc]mc |
packed_char name (MAXPACKEDFNAME)
[cc]mc
.sp
Library:  vswtlb  (standard Subsystem library)
.fs
[cc]mc |
'Rmfil$' is used to remove files, segment directories, and
access categories by name.
[cc]mc
The sole argument is the name of a file (of either type, in the
current directory) to be deleted.
Note that the name is
.ul
not
an EOS-terminated string; it is a packed, blank-filled array
of characters.
The function return is OK if the deletion occurred, ERR otherwise.
.im
'Rmfil$' uses the Primos routine SRCH$$ to delete the file if possible.
If this attempt fails because the file is a non-empty segment
directory, it is opened and cleaned out by a call to 'rmseg$',
[cc]mc |
then deleted by SRCH$$. If it fails because the file is an
access category, it calls CAT$DL to remove it.
[cc]mc
.ca
[cc]mc |
ptov, Primos cat$dl, Primos srch$$, rmseg$
[cc]mc
.sa
remove (2), del (1), rmseg$ (6)
