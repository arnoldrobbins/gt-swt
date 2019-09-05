.hd gfnarg "get next file name argument from argument list" 01/07/83
integer function gfnarg (name, state)
character name (MAXPATH)
integer state (4)
.sp
Library:  vswtlb (standard Subsystem library)
.fs
'Gfnarg' is used to fetch "file name" arguments (those not beginning
with a dash) from the command line.
More importantly, it observes the convention that a "-n" argument
implies that file names are to be read from an input file until
EOF is reached, rather than simply from the argument list.
.sp
In summary, each time 'gfnarg' is called, it returns a file name in 'name'.
From its initial state, 'gfnarg' will fetch the next argument from
the command line.
If the argument is a file name, then it is passed back in 'name',
'state' is updated (in ways to be discussed later), and the function
return is OK.
If the argument begins with "-n", it indicates that file names are
to be take from a file.
("-n" implies the standard port STDIN, "-n2" implies STDIN2,
"-n3" implies STDIN3, and "-nfilename" implies the named file.)
Successive calls of 'gfnarg' then return successive lines of the
named file (sans newline at the end of each line).
When EOF is reached, 'gfnarg' resumes its scan of the command
line arguments.
Whenever a non-filename, non-"-n" argument is encountered,
'gfnarg' returns ERR.
When no more filename arguments are available, 'gfnarg' returns
EOF.
.sp
As a boundary condition, if there are no arguments on the command
line, 'gfnarg' returns the name "/dev/stdin1", reflecting the
convention that programs invoked without arguments take their
input from their standard ports.
.sp
Use of 'gfnarg' requires one initialization step.
The first element of the state vector must be set to 1,
then the first call to 'gfnarg' may be issued.
For example:
.sp
.nf
.in +5
state (1) = 1
call gfnarg (argument, state)
.in -5
.fi
.sp
'Gfnarg' will maintain the state vector internally after the
initialization.
.im
The four elements of the state vector have the following
interpretations:
state(1) is the current state of 'gfnarg', which may be
(1) uninitialized, (2) reading arguments from the command line,
(3) reading from an input file, (4) end of command line reached,
or (5) no more file arguments are available (EOF);
state(2) is the index of the next argument in the command line;
state(3) is the file descriptor for the current "-n" input file;
state(4) is a count of the number of file name arguments returned
so far.
The initial state is used by 'gfnarg' to set up the other elements
of the state vector.
From that point on, the contents of the argument list cause changes
in state.
As a special case, if the end of the command line is reached
without finding any file names, "/dev/stdin1" is returned
and state(1) is altered to cause an EOF return on the next call
to 'gfnarg'.
.am
name, state
.ca
close, error, getarg, getlin, open, print, scopy
.bu
Should probably return argument length, like 'getarg' does,
whenever it finds a filename.
.sa
getarg (2)
