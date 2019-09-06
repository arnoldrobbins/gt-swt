.hd execn "execute program named by a quoted string" 03/23/80
subroutine execn (path_name)
packedchar path_name (ARB)
.sp
Library:  vswtlb (standard Subsystem library)
.fs
The function of 'execn' is almost identical to that of 'exec'.  The only
difference is in the form of the argument passed to the two routines.
'Exec' expects an EOS terminated string; 'execn' expects a string of characters
packed two per word, terminated with a period.  Like 'exec', 'execn'
executes the program whose location is specified by the given pathname if
that is possible; if an error occurs, control returns to the calling program.
On a successful call, control passes to the called program, and the calling
program is lost.
.im
'Execn' calls 'ptoc' to unpack its argument into a temporary area;
this temporary area is then passed as an argument to 'exec', which does
all the real work.
.ca
ptoc, exec
.bu
Same as 'exec'.
.sa
exec (2), ptoc (2)
