.hd icomn$ "initialize Subsystem common areas" 03/25/82
subroutine icomn$
.sp
Library:  vswtlb (standard Subsystem library)
.fs
'Icomn$' is used to completely reinitialize all Subsystem
common areas.
At present, it is used only by the program 'swt' on Subsystem entry.
.im
'Icomn$' initializes the Subsystem
password, argument count, command interpreter status flag,
shell error code, command input unit, user template storage
area, Subsystem return label,
and linked string control words, then calls 'ioinit' to set
up the input/output common blocks.
.ca
ioinit
.sa
ioinit (6)
