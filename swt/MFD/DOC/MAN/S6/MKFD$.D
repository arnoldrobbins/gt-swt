.hd mkfd$ "make a file descriptor from a Primos funit" 03/25/82
file_des function mkfd$ (funit, mode)
integer funit, mode
.sp
Library:  vswtlb  (standard Subsystem library)
.fs
'Mkfd$' allocates a Subsystem file descriptor for a disk file
and initializes it so that it refers to the file open on the
Primos funit number given as the argument 'funit'.
'Mode' must be READ, WRITE, or READWRITE.
The function return is a file descriptor if the allocation
succeeds, ERR otherwise.
.sp
'Mkfd$' is normally used to enable Subsystem I/O on a file that
for some reason has already been opened by a Primos routine.
.im
A Subsystem file descriptor is allocated from the available pool
(by a call to 'getfd$') and initialized as per 'open'.
The given I/O mode, file unit, and disk device status are
associated with the descriptor.
.ca
getfd$, Primos break$
.sa
getfd$ (6), mapfd (2), open (2)
