.hd tquit$ "check for pending terminal interrupt" 02/24/82
logical function tquit$ (flag)
logical flag
.sp
Library:  vswtlb (standard Subsystem library)
.fs
'Tquit$' checks to see if there is a pending program interrupt
as a result of the user having entered a BREAK or CTRL-P.  If
there is, a value of .true. is returned in 'flag' and as the
function's result; otherwise, a value of .false. is returned.
.sp
Before 'tquit$' can be used, the Primos system call BREAK$
must have been called with an argument of .true..
Before a program exits, BREAK$ should be called with an
argument of .false..
.im
'Tquit$' calls the Primos routine QUIT$ to detect the
interrupt.  If one has occurred, it also calls the Primos
routine TTY$RS to clear the terminal output buffer
and T1OU to echo a NEWLINE.
.am
flag
.ca
Primos quit$, Primos tty$rs, Primos t1ou
