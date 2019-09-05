[cc]mc |
.hd t$init "initialize for a subroutine trace run" 09/05/84
subroutine t$init
.fs
'T$init' is called at the beginning of the main program in
Ratfor programs that have been processed with the "-p"
(profiling) option of 'rp'.  It initializes the profiling common
blocks with the number of routines in the program.
.sp
'T$init' is inserted into the Fortran output as inline code,
rather than being referenced from the standard Subsystem library.
As such, it can never be accessed by the user unless the "-p"
option is specified (even then, it should not be called by the
user, since it has no effect on the profiling information).
.im
A simple assignment statement initializes a variable in the
common blocks produced by 'rp' and used by the profiling subroutines.
.sa
rp (1) t$clup (6), t$entr (6), t$exit (6), t$time (6), t$trac (6)
[cc]mc
