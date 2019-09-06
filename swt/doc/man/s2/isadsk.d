.hd isadsk "test if a file is a disk file" 09/10/82
integer function isadsk (fd)
file_des fd
.sp
Library:  vswtlb (standard Subsystem library)
.fs
'Isadsk' returns YES if the file referenced by the file descriptor
in 'fd' is a disk file; otherwise it returns NO.
All file descriptors, including standard ports, can be tested.
.im
'Isadsk' simply looks in the Subsystem common area at the device
type in the file descriptor and returns YES or NO accordingly.
.ca
mapsu
.sa
isatty (2), isnull (2)
