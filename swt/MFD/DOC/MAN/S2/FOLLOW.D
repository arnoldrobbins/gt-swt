[cc]mc |
.hd follow "path name follower" 07/08/83
[cc]mc
integer function follow (path, sethome)
character path (ARB)
integer sethome
.sp
Library:  vswtlb (standard Subsystem library)
.fs
[cc]mc |
'Follow' changes the current working directory.
'Path' is a pathname assumed to be composed of nodes
[cc]mc
that are only UFDs, with no data files or segment directories.  'Follow'
[cc]mc |
"attaches" (Primos terminology) to each of the directories and subdirectories
named in the pathname in sequence, thus "following" a path through the file
system to the last directory named.  'Sethome' is a set-home key; if zero,
the home directory remains unchanged, and the pathname specifies a new working
directory; if 'sethome' equals one, the pathname specifies a new home directory.
.sp
'Follow' returns ERR if there was a syntax error in the pathname or if a
directory could not be attached, and OK if the attach was successful.
[cc]mc
.im
[cc]mc |
'Follow' sets up an on-unit for the "BAD_PASSWORD$" condition
in order to handle errors during the attaching process.
If the pathname supplied is empty, 'follow'
[cc]mc
attaches back to the home directory by calling the Primos routine
[cc]mc |
AT$HOM.
[cc]mc
Otherwise,
'follow' calls the routine 'getto' to reach the parent directory of
[cc]mc |
the last directory in the path, and then calls the Primos routine AT$REL
[cc]mc
to take the final step in the path.
If 'getto' fails to parse the pathname or reach the parent directory
[cc]mc |
or if AT$REL encounters an error,
'follow' attaches back to the home directory and returns ERR;
if successful it returns OK.
[cc]mc
.ca
[cc]mc |
bponu$, ctov, ptoc, getto,
Primos at$hom, Primos at$rel, Primos break$, Primos mklb$f, Primos mkonu$
[cc]mc
.sa
getto (2), cd (1)
