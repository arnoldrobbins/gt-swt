.hd markf "get the current position of a file" 03/25/82
file_mark function markf (fd)
file_des fd
.sp
Library:  vswtlb (standard Subsystem library)
.fs
'Markf' is used to determine the current position of an open file.
The position is normally recorded and later reused by 'seekf'
for random I/O.
.sp
The single argument specifies a file whose position is desired.
The function return is ERR if the position could not be determined
or if "position" has no meaning for the device currently
associated with the given file descriptor.
.im
If necessary, 'markf' calls 'flush$' to empty the Subsystem
buffer belonging to the file.
If the file is associated with a terminal device, 'tmark$' is
called to get the position.
Similarly, 'dmark$' is called if the file is a disk file.
The null device is always at position zero.
.ca
mapsu, flush$, tmark$, dmark$
.bu
'Markf' may fail between two characters in a line, because files
under Primos are word-addressed, rather than byte-addressed.
'Markf' should only be used at word boundaries (for binary files)
or line boundaries (for standard character files).
.sa
dmark$ (6), tmark$ (6), seekf (2)
