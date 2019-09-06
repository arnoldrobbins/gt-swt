.hd t$trac "trace routine for Ratfor programs" 03/25/82
subroutine t$trac (mode, name)
integer mode
integer name (ARB)
.sp
Library:  vswtlb (standard Subsystem library)
.fs
'T$trac' is called from traced Ratfor programs (those processed
with the "-t" option).
Calls to 't$trac' are planted in the Fortran output of Ratfor
as the first executable statement of each routine and before each
"return" and "stop".
.sp
'Mode' is 1 for subprogram entry, 2 for subprogram exit, and
3 for initialization of the indentation level.
'Name' is a period-terminated packed string containing the name
of the routine being traced.  It need be supplied only when 'mode'
has a value of 1 (subprogram entry).
.sp
'T$trac' produces an indented listing with vertical lines
to help connect subprogram entry and exit.
The trace is produced on ERROUT.
.im
A level counter is maintained to determine the amount of indentation;
simple output statements produce the trace.
.ca
putch, print
.sa
t$entr (6), t$exit (6), t$clup (6), t$time (6), rp (1)
