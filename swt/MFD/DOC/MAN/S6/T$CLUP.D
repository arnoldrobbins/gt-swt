[cc]mc |
.hd t$clup "profiling routine called on program exit" 07/04/83
[cc]mc
subroutine t$clup
.sp
Library:  vswtlb (standard Subsystem library)
.fs
A call to 't$clup' is inserted before each "call swt" in a Subsystem
program that is to be profiled.
When used with the "-p" option, Ratfor inserts this call automatically
before a "stop" statement, and converts the "stop" to a "call swt".
.sp
The purpose of 't$clup' is to write to the file "_profile"
a summary of the amount of real, cpu, and paging time spent in each
subroutine of the profiled program.
This summary is then read by the program 'profile' and formatted
into a report.
.sp
Since no profiling information is written by any of the other profiling
routines, 't$clup' must be called if a profile is to be made.
.sp
'T$clup' should be called explicitly only by those users wishing to profile
Fortran programs by hand;
Ratfor users should always profile with the "-p" option of the
preprocessor.
.im
'T$clup' repeatedly calls 't$exit' until all subprogram calls
have been cleaned up from the internal call stack.
The file "_profile" is opened via a call to 'create'
and filled by repeated calls to 'writef'.
A final call to 'close' closes the file, leaving it ready for
analysis by 'profile'.
.ca
[cc]mc |
cant, close, create, t$exit, writef, Primos at$hom
[cc]mc
.bu
This code should be invoked by 'swt', if necessary and possible.
.sa
t$entr (6), t$exit (6), t$time (6), t$trac (6), rp (1)
