.hd cant "print cant open file message" 02/24/82
subroutine cant (file_name)
character file_name (ARB)
.sp
Library:  vswtlb (standard Subsystem library)
.fs
'Cant' is a Kernighan/Plauger subroutine normally used to report errors
after an attempt to open a file.
The 'file_name' supplied (which must be an EOS-terminated string) is
printed on ERROUT, followed by the message "can't open", and an
immediate return to the shell is taken.
.im
'Cant' calls 'putlin' to print the filename supplied, and 'error' to print
the "can't open" message and return to the Subsystem command interpreter.
.ca
putlin, error
.sa
open (2), create (2), remark (2)
