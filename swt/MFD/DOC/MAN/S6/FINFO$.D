[cc]mc |
.hd finfo$ "return directory information about a file" 09/10/84
[cc]mc
integer function finfo$ (path, entry, attach)
character path (ARB)
[cc]mc |
integer entry (MAXDIRENTRY), attach
[cc]mc
.sp
Library:  vswtlb  (standard Subsystem library)
.fs
'Finfo$' is an internal Subsystem routine used to return the
Primos directory entry associated with a named file.
The 'path' argument is the pathname of the file whose entry is
desired;
'entry' is a buffer to receive the entry itself;
'attach' is set to YES if the user's attach point changed as a
side effect of obtaining the directory entry, NO otherwise.
The function return is OK if the directory entry was obtained,
ERR otherwise.
.sp
See Prime's File Management System guide for information on the
[cc]mc |
structure of directory entries as returned by the Primos routines
DIR$RD and ENT$RD.
[cc]mc
.im
'Getto' is called to attach to the parent directory of the named
file.
The 'attach' parameter is set as a side effect of this action.
The Primos routine SRCH$$ is then used to open the current
[cc]mc |
directory for reading, and the Primos routine ENT$RD to fetch the
[cc]mc
entry for the named file.
The current directory is then closed by SRCH$$ and 'finfo$'
returns.
.am
entry, attach
.ca
[cc]mc |
getto, Primos srch$$, Primos ent$rd
[cc]mc
.sa
filtst (2), file (1), lf (1)
