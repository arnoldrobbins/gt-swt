.hd iofl$ "initialize open file list" 03/25/82
subroutine iofl$ (state)
integer state (MAXFILESTATE)
.sp
Library:  vswtlb (standard Subsystem library)
.fs
'Iofl$' saves the Subsystem and Primos file descriptors which
correspond to closed files in 'state',
so that subsequently opened files can be closed by 'cof$'.
.im
For each Subsystem file descriptor, 'iofl$' examines the
its flag word to determine if it is closed. For
each closed file, its descriptor is saved in 'state'. After
the last closed Subsystem file descriptor entered into 'state', ERR
is entered into 'state' to mark the end of the list.
.sp
Next, for each Primos file descriptor, 'iofl$' calls the Primos
routine PRWF$$ to test whether or not the file is open and valid.
For each valid closed file, its file descriptor is entered into 'state'.
After the last valid closed Primos file descriptor has been entered,
ERR is entered into 'state' to mark the end of the list.
.ca
Primos prwf$$
.sa
cof$ (6)
