.hd rewind "rewind a file" 02/24/82
integer function rewind (fd)
file_des fd
.sp
Library:  vswtlb (standard Subsystem library)
.fs
'Rewind' positions the file specified by 'fd' to its beginning.
All internal Subsystem status indicators are reset to indicate the new
condition of the file.
If the attempt to rewind was successful, 'rewind' returns OK; otherwise, it
returns ERR.
.im
'Rewind' calls 'seekf' to set the current position of the file to
zero.
.ca
seekf
.bu
Terminal file behavior is somewhat unpredictable, since the user may have
typed ahead of any requests for input.
.sa
wind (2), seekf (2), markf (2)
