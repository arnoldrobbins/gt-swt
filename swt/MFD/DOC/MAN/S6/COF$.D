.hd cof$ "close files opened by the last user program" 03/25/82
subroutine cof$ (state)
integer state (MAXFILESTATE)
.sp
Library:  vswtlb (standard Subsystem library)
.fs
When called, 'cof$' closes all open files that were opened
after the last call to 'iofl$'. 'Cof$' also resets the
terminal input buffer pointer and character count in the
Subsystem common block.
.im
'Cof$' checks the flag word of each of the file descriptors
in 'state' up to the ERR marker. If the file is currently open,
'cof$' calls 'close' to close it.
.sp
Next, 'cof$' skips the ERR marker, and calls the Primos routine
SRCH$$ to close all of the Primos files indicated by the second
list in 'state' (up to the next ERR marker).
.sp
Lastly, 'cof$' resets the terminal input buffer pointer to 1 and the
terminal buffer character count to 0.
.ca
close, Primos srch$$
.sa
iofl$ (6), close (2), open (2)
