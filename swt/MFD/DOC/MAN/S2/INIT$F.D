.hd init$f "force Fortran i/o to recognize the Subsystem" 01/07/83
subroutine init$f
.sp
Library:  vswtlb (standard Subsystem library)
.fs
A call to 'init$f' from a Fortran 66 or Fortran 77 program
attaches Fortran unit 5 to the file open as standard input (either
disk or terminal) and attaches Fortran unit 6 to the file
open as standard output (either disk or terminal).  The attachment
of unit 1 to the terminal is not changed.
.sp
To use 'init$f', it must be called as the first executable
statement in the main program:

   call init$f

.im
First 'init$f' calls 'flush$' on standard input and standard
output to clean up any unfinished Subsystem I/O.
'Init$f' then calls the Subsystem 'mapfd' to determine the Primos
file unit attached to standard input.  If 'mapfd' returns
a file descriptor, 'init$f' calls Fortran 'attdev' to attach
unit 5 to that Primos disk unit; otherwise, 'init$f' calls
the Primos routine ATTDEV to attach unit 5 to the terminal.
The procedure
is then repeated for standard output and Fortran unit 6.
.ca
flush$, mapfd, mapsu, Primos attdev
.bu
Files redirected to /dev/null are not supported.
.sa
init$p (2), init$plg (2)
