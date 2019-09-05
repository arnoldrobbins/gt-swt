.hd mapfd "convert fd to Primos funit" 01/07/83
integer function mapfd (fd)
file_des fd
.sp
Library:  vswtlb (standard Subsystem library)
.fs
Certain applications require the Primos funit number associated
with a given open disk file.
'Mapfd' retrieves the funit number corresponding to a file descriptor.
If the file open on the given file descriptor is not a disk file,
the function return is ERR;
otherwise, it is the desired funit number.
.im
The Primos funit associated with each file descriptor is available
in the Subsystem I/O common area.
'Mapfd' simply checks to make sure the specified file descriptor
corresponds to a disk file, then returns the funit.
.ca
mapsu
.sa
mapsu (2)
