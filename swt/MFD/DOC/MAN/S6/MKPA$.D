.hd mkpa$ "convert a treename into a pathname" 03/25/82
integer function mkpa$ (tree, path, default)
character path (MAXPATH), tree (ARB)
integer default
.sp
Library:  vswtlb (standard Subsystem library)
.fs
'Mkpa$' is used to convert a Primos treename into an equivalent
Subsystem pathname.
The first argument is the treename to be converted.
The second argument is a string to receive the equivalent pathname.
The last argument is used to resolve an ambiguity in Primos treenames;
if it equals YES, then simple names are interpreted as top-level
user file
directories, otherwise simple names are interpreted as files in the
current directory.
.sp
The function return is the length of the pathname returned in 'path'.
.sp
The following conversions are performed:
.sp
.in +5
.nf
<name>dir>subdir>file -> /name/dir/subdir/file
dir>subdir>file       -> //dir/subdir/file
*>subdir>file         -> subdir/file
simplename            -> simplename
                            (if 'default' == NO)
                      -> //simplename
                            (if 'default' == YES)
.sp
.fi
.in -5
.im
Simple checks determine which of the above cases applies,
then translation is straightforward.
.am
path
.ca
scopy, mapdn, index
.sa
mktr$ (6)
