.hd t$entr "profiling routine called on subprogram entry" 03/25/82
subroutine t$entr (routine)
integer routine
.sp
Library:  vswtlb (standard Subsystem library)
.fs
'T$entr' records the real, cpu, and paging times of the current
process upon subprogram entry.
This information is later modified by 't$exit' to reflect only the
time spent in the particular subprogram,
which is then added to the total for the subprogram.
.sp
'Routine' is the number of the subprogram being entered;
subprograms are numbered consecutively beginning with 1 for the
main program.
.sp
'T$entr' should be called explicitly only by those users profiling
Fortran programs with hand-inserted code, in which case
a call to 't$entr' should be the first executable statement of
any profiled routine.
.im
A call to 't$time' gathers the necessary information, which is
then stacked in a stack provided by the user
(automatically, in the case of Ratfor programs).
.ca
Primos tnou, swt, t$time
.bu
Stack overflow terminates the program.
.sa
t$exit (6), t$clup (6), t$time (6), t$trac (6), rp (1)
