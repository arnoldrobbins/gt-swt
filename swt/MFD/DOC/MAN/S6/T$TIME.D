.hd t$time "obtain clock readings for profiling" 03/25/82
subroutine t$time (reel, cpu, diskio)
long_int reel, cpu, diskio
.sp
Library:  vswtlb (standard Subsystem library)
.fs
'T$time' is called by 't$entr' and 't$exit' to fetch the amounts of
real time, cpu time, and disk I/O time accumulated so far during
this run.
.im
The Primos routine TIMDAT is called to fetch the information,
which is converted uniformly to timer ticks.
.am
reel, cpu, diskio
.ca
Primos timdat
.bu
Timer resolution is not good.
.sa
t$entr (6), t$exit (6), t$clup (6), rp (1)
