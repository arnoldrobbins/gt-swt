[cc]mc |
.hd getto "get to the last file in a pathname" 08/28/84
[cc]mc
integer function getto (path, name, pwd, attach)
character path (ARB)
[cc]mc |
packedchar name (MAXPACKEDFNAME), pwd (3)
[cc]mc
integer attach
.sp
Library:  vswtlb (standard Subsystem library)
.fs
[cc]mc |
'Getto' attaches to the UFD containing the file specified in
the last node of the pathname 'path.'  In order to make further operations
on the file convenient, it packs the name of the last node
in the path (usually a file name) two characters
[cc]mc
per word, left justified, blank filled into the argument 'name',
[cc]mc |
and similarly packs the password (if any) into the argument 'pwd'.
[cc]mc
Passwords are always mapped to upper case.
.sp
'Getto' returns ERR if the UFD containing the file could not be attached;
OK otherwise.
[cc]mc |
If 'getto' returns with 'attach' set to NO, the current
[cc]mc
UFD was not changed;
if YES, then the parent directory of the last file in the path
[cc]mc |
became the current directory.
[cc]mc
.im
[cc]mc |
'Getto' sets up an on-unit for the "BAD_PASSWORD$" condition
to handle errors during the attaching process.
Then it expands any pathname templates in 'path',
converting the [ul Software Tools]-style pathname
into a Primos treename by calling 'mktr$'.
If the pathname supplied is empty, 'getto' attaches back to
the home directory by calling the Primos routine
AT$HOM.
Otherwise, it loops through the nodes in the treename until
it has attached to the parent directory of the last node.
If the treename
refers to a primary UFD (one in the master file directory of some disk),
'getto' uses the Primos routine AT$ANY to attach to the named UFD, and then
attaches to the MFD on the same disk using the Primos routine AT$ABS.
If the treename is a fully specified path including packname,
'getto' checks see to if the packname specifies a logical disk number.
If it does, the Primos routine AT$ is called
to attach to the primary UFD on the specified disk pack; otherwise
the AT$ABS is called to do the attach. Then 'getto'
attaches to the MFD on the same disk using AT$ABS.
If the last node of the treename has not been reached,
'getto' attaches down the path by calling the Primos routine AT$REL.
If any errors occur during the attaching process, 'getto' attaches
back to the home directory and returns ERR.
[cc]mc
.am
name, pwd, attach
.ca
[cc]mc |
bponu$, ctov, expand, mapstr, mktr$,
Primos at$, Primos at$abs, Primos at$any, Primos at$hom, Primos at$rel,
Primos break$, Primos mklb$f, Primos mkonu$
[cc]mc
.sa
follow (2), open (2), remove (2)
