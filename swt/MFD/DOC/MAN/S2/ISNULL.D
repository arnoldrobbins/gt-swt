.hd isnull "see if a file is connected to the bit bucket" 09/10/82
integer function isnull (fd)
file_des fd
.sp
Library:  vswtlb (standard Subsystem library)
.fs
'Isnull' returns YES if the file referenced by the file descriptor
in 'fd' is connected to the null device; otherwise it returns NO.
All file descriptors, including standard ports, can be tested.
.im
'Isnull' simply looks in the Subsystem common area at the device
type in the file descriptor and returns YES or NO accordingly.
.ca
mapsu
.sa
isadsk (2), isatty (2)
