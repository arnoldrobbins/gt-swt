.hd fcopy "copy one file to another" 01/07/83
subroutine fcopy (in, out)
file_des in, out
.sp
Library:  vswtlb (standard Subsystem library)
.fs
'Fcopy' is a routine that copies the contents of
one file to another.  The two arguments specify the file descriptors of
the source and destination files, respectively.  Both files must be
open with the proper access modes (i.e., READ or READWRITE access
for the source, and WRITE or READWRITE access for the destination);
neither is rewound before or after the copy.
.im
'Fcopy's strategy depends on the types of devices represented by the
source and destination files; if both are disk files, the
routines 'readf' and 'writef' are called repeatedly to transfer
large blocks of data.
For all other combinations of source and destination
device types, 'getlin' and 'putlin' are called repeatedly to
transfer one line at a time.
Even for disk files, 'getlin' may be called, to insure that the buffer
state is consistent.
.ca
getlin, mapsu, putlin, readf, writef
.bu
There is no provision for an error return of any sort; no status is passed
back to the calling program to indicate success or failure of the copy.
.sa
getlin (2), putlin (2), readf (2), writef (2)
