[cc]mc |
.hd dopen$ "open a disk file" 07/04/83
[cc]mc
integer function dopen$ (path, fd, mode[, typ[, limit]])
character path (ARB)
integer mode, typ, limit
file_des fd
.sp
Library:  vswtlb (standard Subsystem library)
.fs
'Dopen$' is an internal Subsystem routine that performs the function
of 'open' for disk files only.
The first argument is the pathname of the file to be opened;
it must be an EOS terminated string (i.e. dopen$('/dir/file1's....).
The second argument is the file descriptor assigned to the file in 'open'.
The third argument is the mode, READ, WRITE or READWRITE.
The fourth argument is optional.
It specifies the type of the file.
The fifth argument is optional; it specifies the number of times
to retry the open if the file is in use.
'Dopen$' returns the value of 'fd' if the attempt to open was
successful; ERR if the attempt failed.  The user is always left in the
home directory after an attempt to open.
.sp
By default, 'dopen$' returns a file descriptor to a sequential access
method (SAM) file.  If creating a direct
access method file (DAM) is desired, the 'mode' argument may be
ORed with the KNDAM file key (i.e., 'mode' can be "READWRITE+KNDAM" to
create a DAM file opened for reading or writing).  The constant KNDAM
is contained in the "PRIMOS_KEYS" include file.
.im
'Dopen$' calls 'getto'  to reach the UFD
containing the desired file and pack the filename into an array suitable
for use with Primos routines.
If 'getto' is successful, the Primos subroutine SRCH$$ is called
to open the file.  If either 'getto' or SRCH$$ fails,
[cc]mc |
Primos AT$HOM is called to return the user to the home directory,
[cc]mc
and ERR is returned as the function value of 'dopen$'.
.am
typ
.ca
[cc]mc |
getto, Primos at$hom, Primos missin, Primos srch$$, Primos sleep$
[cc]mc
.sa
open (2)
