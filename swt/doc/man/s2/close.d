.hd close "close out an open file" 03/25/82
integer function close (fd)
file_des fd
.sp
Library:  vswtlb (standard Subsystem library)
.fs
'Close' closes the file associated with the given file descriptor
(the value returned by a call to 'open', 'create', or 'mktemp')
and releases its buffer areas.  If the file was open for
writing, any data still buffered is written to the file.  After a file
is closed, its file descriptor becomes available for future use.
'Close' returns OK if the attempt to close was successful, ERR otherwise.
.sp
If an attempt is made to close a standard port (STDIN, STDOUT, etc.)
'close' will return OK, but it will
.ul
not
close the file associated with the port.
.im
'Close' first checks to see if the given file descriptor is a standard
port descriptor.
If so, the attempt to close is ignored.
If the file descriptor is illegal or corresponds to an already closed
file, ERR is returned.
'Flush$' is then called to force any pending writes on the file to be
performed.
The Primos routine SRCH$$ is used to close disk files;
other file types are closed simply by updating Subsystem status
areas.
.ca
flush, Primos srch$$
.bu
Some consider the behavior on standard ports unreasonable,
but it definitely seems useful.
.sa
open (2), create (2), mktemp (2), flush$ (6)
