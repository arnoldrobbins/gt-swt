.hd rmseg$ "remove a segment directory" 03/25/82
subroutine rmseg$ (funit)
integer funit
.sp
Library:  vswtlb  (standard Subsystem library)
.fs
'Rmseg$' cleans out the segment directory open on the Primos file
unit given as its sole argument.
.im
'Rmseg$' deletes successive entries in the directory using the Primos
routine SRCH$$.
When 'rmseg$' comes across an entry that is itself a non-empty
segment directory, it opens that directory then calls itself
recursively to clean it out.
When all entries have been removed, the directory itself is
set to zero length.
.ca
Primos sgdr$$, Primos srch$$, rmseg$
.sa
del (1), remove (2), rmfil$ (6)
