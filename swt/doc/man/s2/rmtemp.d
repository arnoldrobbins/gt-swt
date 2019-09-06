.hd rmtemp "remove a temporary file" 03/23/80
integer function rmtemp (fd)
file_des fd
.sp
Library:  vswtlb (standard Subsystem library)
.fs
'Rmtemp' is used to remove a temporary file created by 'mktemp'.  The file
specified by 'fd' is rewound, truncated to zero length, and closed.  This action
is as close as possible to actually deleting the file.  If the attempt to
close the file is successful, 'rmtemp' returns OK; otherwise, it returns ERR.
.im
'Rmtemp' simply calls 'rewind', 'trunc', and 'close', in that order,
on the given file descriptor.
If the call to 'close' fails, ERR is returned; otherwise,
OK is returned.
.ca
rewind, trunc, close
.sa
mktemp (2), rewind (2), trunc (2), close (2)
