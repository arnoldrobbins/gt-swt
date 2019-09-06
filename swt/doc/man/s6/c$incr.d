.hd c$incr "increment count for a given statement" 03/25/82
subroutine c$incr (stmt)
integer stmt
.sp
Library:  vswtlb (standard Subsystem library)
.fs
'C$incr' is called from Ratfor programs that have been processed with
the "-c" (statement count) option.
Calls to 'c$incr' are planted before each executable statement
in the program to keep track of the number of times the corresponding
statement was executed.
.sp
The sole argument is the line number (in the Ratfor source code)
of the line containing the statement being executed.
Each call to 'c$incr' with a given line number as argument causes
the count for that line to be incremented by one.
.im
A common block ('c$stc'), created by Ratfor, contains an array of
statement counts indexed by line number.
'C$incr' simply increments the appropriate element of the array.
.sa
c$end (6), rp (1)
