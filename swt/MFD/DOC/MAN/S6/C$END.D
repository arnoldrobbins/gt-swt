.hd c$end "clean up after statement count run" 03/25/82
subroutine c$end
.sp
Library:  vswtlb (standard Subsystem library)
.fs
'C$end' is called from Ratfor programs that have been processed with
the "-c" (statement count) option.
Calls to 'c$end' are planted before each 'stop' statement in the
program.
.sp
'C$end' simply writes out the statement count array to the file
"_st_count" for later processing.
.im
The statement count array in common block 'c$stc' is written
(by repeated calls to 'print') to the file "_st_count".
.ca
create, cant, print, close
.sa
c$incr (6), rp (1)
