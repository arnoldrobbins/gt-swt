.hd lopen$ "open a disk file in the spool queue" 01/06/83
file_des function lopen$ (path, fd, mode)
character path (ARB)
file_des fd
integer mode
.sp
Library:  vswtlb (standard Subsystem library)
.fs
'Lopen$' is an internal Subsystem routine that performs the function
of 'open' for disk files in the spool queue only.
The first argument is the pathname of the file to be opened;
it must be an EOS terminated string specifying a spooler device
file (e.g. "/dev/lps"s).
The second argument is the file descriptor assigned to the file in
'open'.
The third argument is the mode, READ, WRITE or READWRITE.
'Lopen$' returns the value of 'fd' if the attempt to open was
successful; ERR if the attempt failed.
The user is always left in the
home directory.
.im
'Lopen$' examines the pathname for line printer spooler options (see
'open').  The Subsystem printer form and printer destination shell
variables are used
as the spool file's form type and destination, respectively, if they
are defined; otherwise, the default installation form and printer
destination are used.
The Primos routine SPOOL$ is then called to open a spool file on
disk,
which may be written by the standard Subsystem disk I/O routines.
.ca
ctop, mapdn, mapup, ctoi, Primos srch$$,
Primos spool$, putch, parstm, mapstr, ctoc
.sa
open (2), dopen$ (6), sp (1), pr (1)
