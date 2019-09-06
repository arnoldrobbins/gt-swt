.hd t$exit "profiling routine called on subprogram exit" 03/25/82
subroutine t$exit
.sp
Library:  vswtlb (standard Subsystem library)
.fs
'T$exit' is called from profiled programs just before a "return"
statement is executed.
It records the current amount of real, cpu, and paging time used,
and determines from these the amount of time spent in the current
subprogram.
This information is added to the total time figures maintained
for each subprogram.
.im
'T$time' is called to fetch the pertinent information, which
is then subtracted from the values on the stack to obtain the
time spent in the current routine.
Adjustments are made to items remaining on the stack so that
they do not reflect time spent in subordinate subprograms.
.ca
t$time
.sa
t$entr (6), t$clup (6), t$time (6), t$trac (6), rp (1)
