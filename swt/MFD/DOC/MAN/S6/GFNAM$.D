.hd gfnam$ "get the pathname for an open file" 01/05/83
integer function gfnam$ (fd, path, size)
file_des fd
character path (MAXPATH)
integer size
.sp
[cc]mc |
Library:  vswtlb (standard Subsystem library)
[cc]mc
.fs
'Gfnam$' tries to find the name of the open file unit 'fd'.  If the
unit is a terminal, it returns the name of the terminal device.
If the unit is a null device, then it returns the null device
name; otherwise, it obtains the pathname and returns it in
'path'.  If the pathname can be obtained, the length of 'path'
is the returned value; otherwise ERR is returned.
.sp
'Size' is the number of characters that can be held in 'path'
(including EOS).
.im
'Gfnam$' first tries to verify that the file unit for which a name
is desired is open and a legal file unit; if it isn't both, then
ERR is returned.  Otherwise, it checks to see what type of file is
associated with the given file descriptor.  For terminal and null
devices, the appropriate device name is returned (device names
are of the form '/dev/?*').  For disk files,
the Primos GPATH$ subroutine is called to obtain the Primos
treename for the file.  If a treename could be obtained, then
'mkpa$' is called to generate a Subsystem pathname for
the file; otherwise, ERR is returned.
.am
path
.ca
ctoc, Primos gpath$, mapsu, mkpa$, ptoc
