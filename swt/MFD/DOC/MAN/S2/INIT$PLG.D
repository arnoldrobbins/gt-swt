.hd init$plg "force PL/I G i/o to recognize the Subsystem" 01/07/83
init$plg:  procedure;
.sp
Library:  vswtlb (standard Subsystem library)
.fs
A call to 'init$plg' from a PL/I G program attaches the
PL/I G file SYSIN
to the file open as standard input (either
disk or terminal) and attaches the PL/I G file SYSPRINT to the file
open as standard output (either disk or terminal).
.sp
To use 'init$plg', it must be declared in the main program,

.nf
   declare init$plg entry;
.fi

and then called before any executable statements:

.nf
   call init$plg;
.fi

.im
First 'init$plg' calls 'flush$' on standard input and standard output
to clean up any unfinished Subsystem I/O.
'Init$plg' then calls the Subsystem 'mapfd' to determine the Primos
file unit attached to standard input.  If 'mapfd' returns
a file descriptor, 'init$plg' opens SYSIN using that file
descriptor; otherwise, it opens SYSIN on the terminal.
The procedure
is then repeated for standard output and the PL/I G file SYSPRINT.
.ca
flush$, mapfd, mapsu, Primos p$open
.bu
Files redirected to /dev/null are not supported.

Output on SYSPRINT not followed by a line boundary (e.g. PUT SKIP)
will be ignored when the file is directed to disk.
It is usually best to terminate all programs
with a PUT SKIP to insure that this line boundary is present.
.sa
init$p (2), init$f (2)
