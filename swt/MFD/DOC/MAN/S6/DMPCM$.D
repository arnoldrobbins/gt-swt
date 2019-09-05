.hd dmpcm$ "dump Subsystem common areas" 02/24/82
subroutine dmpcm$ (fd)
file_des fd
.sp
Library:  vswtlb (standard Subsystem library)
.fs
'Dmpcm$' outputs the contents of the Subsystem's common blocks
in a printable format.  Unprintable characters are mapped into
a mnemonic format, and output is appropriately titled.
.sp
'Fd' is the file descriptor of the file unit which should
receive the information.
.im
The common area values which may be unprintable are mapped into
mnemonic strings by calls to the routine 'ctomn'.  Then, the value
of each variable in the common area is printed, with the
appropriate headings.
.ca
ctomn, print
.sa
dump (1)
