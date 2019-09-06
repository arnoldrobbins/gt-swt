[cc]mc |
.hd seterr "set Subsystem error return code" 08/28/84
[cc]mc
subroutine seterr (stat)
integer stat
.sp
Library:  vswtlb  (standard Subsystem library)
.fs
'Seterr' is used to set the error status code variable in the
Subsystem common area.
This variable is examined by the Shell when it regains control
after the execution of a user program;
if the value of the status code is greater than or equal to
1000, then the Shell assumes a fatal error has occurred and
shuts down all currently active shell programs.
[cc]mc |
.# .sp
.# In the future, values of the status code may be used for
.# more sophisticated error handling in shell programs.
[cc]mc
.sa
error (1), error (2)
