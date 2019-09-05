.hd mktr$ "convert a pathname into a treename" 03/25/82
integer function mktr$ (path, tree)
character path (ARB), tree (MAXPATH)
.sp
Library:  vswtlb (standard Subsystem library)
.fs
'Mktr$' is used to convert a Subsystem pathname into an equivalent
Primos treename.
The argument 'path' is an EOS-terminated string containing
the pathname to be converted.
The argument 'tree' is a string that will receive the equivalent
Primos treename.
The function return is the length of the treename returned in 'tree'.
.sp
The pathname may begin with a series of backslashes ("\"), each of
which indicates a one-level ascension in the directory hierarchy.
For example, the pathname "\" means the directory which is the parent
of the current directory, and "\\file2" means the file named "file2"
in the grandparent of the current directory.
.sp
Slashes in the input pathname that are preceded by an at-sign ("@")
are passed through to the treename unchanged; they are not interpreted
as separator characters.
.sp
Multiple slashes (except at the beginning of the path) are ignored.
.im
The first characters in the pathname determine the initial portion
of the treename.
If there are two leading slashes, then the treename begins with
"mfd".
If there is only one leading slash, then a packname was specified
and the treename begins with "<packname>mfd".
If there are leading backslashes, then the Primos routine
GPATH$ is called to get the name of the current directory,
and the appropriate portion becomes the start of the treename.
The remainder of the conversion consists mostly of substituting
slashes for greater-than signs and handling escape sequences.
.am
tree
.ca
scopy, Primos gpath$, ptoc, mapstr
.sa
mkpa$ (6), follow (2), getto (2)
