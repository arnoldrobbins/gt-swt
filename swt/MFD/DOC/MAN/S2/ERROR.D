.hd error "print fatal error message, then die" 02/24/82
subroutine error (message)
character message (ARB)
.sp
Library:  vswtlb (standard Subsystem library)
.fs
'Error' is a Kernighan/Plauger routine used to report fatal errors.
The message
passed to it is printed on ERROUT, and the program then terminates.
An error status of 1000 is passed back to the command interpreter,
which then decides whether or not shell program execution will
proceed.
.im
'Error' calls 'remark' to print the error message on file ERROUT.
Error status is set by a call to 'seterr', then
a 'stop' statement is executed
to make a normal return back to the Subsystem command interpreter.
(Note that Ratfor converts 'stop' statements into calls to the
subroutine 'swt'.)
.ca
remark, swt, seterr
.sa
remark (2), swt (2)
