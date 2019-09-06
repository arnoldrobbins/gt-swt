.hd mktemp "create a temporary file" 03/23/80
file_des function mktemp (mode)
integer mode
.sp
Library:  vswtlb (standard Subsystem library)
.fs
'Mktemp' is used to make a temporary file.  The single parameter is an
i/o mode (WRITE or READWRITE).  The temporary file is created in
directory =temp=, so write permission in the home directory is not required.
'Mktemp' returns a file descriptor if the temporary was successfully
created, ERR otherwise.
.im
'Mktemp' consists of a loop that calls 'create' to attempt the creation of
files with names of the form "=temp=/tm?*", where "?*" represents
a string of decimal digits.
If such a file can be created, 'mktemp' returns a file descriptor
that can be used to access it; otherwise, ERR is returned.
.ca
encode, create
.sa
rmtemp (2), close (2), create (2), open (2)
