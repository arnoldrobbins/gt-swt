.hd gcdir$ "get current directory pathname" 01/05/83
integer function gcdir$ (path)
character path (ARB)
.sp
Library:  vswtlb (standard Subsystem library)
.fs
'Gcdir$' is used to determine the full pathname of the current
working directory.
The sole argument is a character array to receive the pathname.
The function return is OK if the name could be found,
ERR otherwise.
.im
'Gcdir$' first obtains the treename of the current directory
using the Primos routine GPATH$.
This treename is then unpacked by 'ptoc' and passed to 'mkpa$',
which converts it into a SWT pathname.
.am
path
.ca
mkpa$, ptoc, Primos gpath$
.bu
Be warned that because of Prime's password protection scheme,
it is not always possible to obtain a pathname that can later
be used to attach to the home directory with the same access
rights.
.sa
mktr$ (6), mkpa$ (6), follow (2), getto (2)
