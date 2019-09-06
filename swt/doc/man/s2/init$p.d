.hd init$p "force Pascal i/o to recognize the Subsystem" 01/07/83
procedure init$p;
.sp
Library:  vswtlb (standard Subsystem library)
.fs
A call to 'init$p' from a Pascal program attaches the
Pascal file INPUT
to the file open as standard input (either
disk or terminal) and attaches the Pascal file OUTPUT to the file
open as standard output (either disk or terminal).
.sp
To use 'init$p', it must be declared as a level 1 procedure,

.nf
   procedure init$p; extern;
.fi

and then called as the first statement after the BEGIN in the
main program:

.nf
   init$p;
.fi

.im
First 'init$p' calls 'flush$' on standard input and standard output
to clean up any unfinished Subsystem I/O.
'Init$p' then calls the Subsystem 'mapfd' to determine the Primos
file unit attached to standard input.  If 'mapfd' returns
a file descriptor, 'init$p' tweaks the Pascal file control
block 'p$ainp' and calls the Primos routine ATTDEV to establish
the unit mapping.
Next 'init$p' calls 'gfnam$' to obtain the pathname of the
disk file. If 'gfnam$' returns a valid pathname, 'mktr$' is called
to convert the pathname into a Primos treename. This treename
is copied into the Pascal file control block so that Pascal
can use it when reporting I/O errors.
If 'gfnam$' returns ERR,
the message 'pathname unobtainable' is copied into the Pascal
file control block as the file name.
Otherwise, since INPUT is already
directed to the terminal, 'init$p' does nothing.
This procedure
is then repeated for standard output and the Pascal file OUTPUT.
.ca
ctop, flush$, gfnam$, mapfd, mapsu, mktr$, Primos attdev
.bu
Files redirected to /dev/null are not supported.
.sa
init$f (2), init$plg (2), file$p (2)
