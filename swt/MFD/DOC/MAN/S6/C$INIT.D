.# subprogram documentation header
.# format "
.#    .hd <name> "<short description>" <date doc written>
.hd c$init "initialize for a statement count run" 04/06/82
.# subprogram declarations (if any)
subroutine c$init
.# function of subprogram
.fs
'C$init' is called at the beginning of the main program in
Ratfor programs that have been processed with the "-c"
(statement count) option of 'rp'.  It initializes the statement
count array for statement count processing.
.sp
'C$init' is inserted into the Fortran output as inline code,
rather than being referenced from the standard Subsystem library.
As such, it can never be accessed by the user unless the "-c"
option is specified (even then, it should not be called by the
user, since the statement counts will be erroneously modified).
.# subprogram implementation
.im
A Fortran [bf do loop] is used to initialize all of the elements
in the statement count array to zero.
.# other documentation
.sa
c$end (6), c$incr (6), rp (1)
