.hd exec "execute pathname" 02/24/82
subroutine exec (path_name)
character path_name (ARB)
.sp
Library:  vswtlb (standard Subsystem library)
.fs
'Exec' is a means of chaining execution to another program.
The argument is a pathname specifying the Primos run file of the program
to be executed.  'Exec' returns if an error was encountered, otherwise
control is passed to the called program and no return is possible.
.im
'Exec' calls the Subsystem routine 'getto' to get to the UFD in which
the file to be executed exists.  The existence of the file is checked
with the function 'findf$'; if the file exists, it is executed via
a call to the Primos routine RESU$$.  If the file is not found, or
could not be reached by 'getto', 'exec' returns to the calling program.
Note that since a call to RESU$$ is used, 'exec' can be used to
execute P300 run-file format programs only.
.ca
getto, findf$, Primos resu$$
.bu
Since Primos provides no way to tell if a file is executable object code,
there is always a strong possibility that resuming a file of unknown type
will cause an unrecoverable error.
.sa
execn (2), getto (2), findf$ (2)
