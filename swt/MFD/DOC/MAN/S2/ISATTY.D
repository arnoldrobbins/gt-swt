.hd isatty "test if a file is connected to a terminal" 09/10/82
integer function isatty (fd)
file_des fd
.sp
Library:  vswtlb (standard Subsystem library)
.fs
'Isatty' returns YES if the file referenced by the file descriptor
in 'fd' is connected to a terminal; otherwise it returns NO.
All file descriptors, including standard ports, can be tested.
.im
'Isatty' simply looks in the Subsystem common area at the device
type in the file descriptor and returns YES or NO accordingly.
.ca
mapsu
.sa
isadsk (2), isnull (2)
