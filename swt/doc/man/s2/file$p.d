.hd file$p "connect Pascal file variables to Subsystem files" 11/19/82
type file_name = array @[1..7] of char;
procedure file$p (file: text; name: file_name); extern;
.sp
Library:  vswtlb (standard Subsystem library)
.fs
'File$p' may be called from a Pascal program to allow that program
to access the redirection and pipe features of Subsystem I/O.  Each
call to 'file$p' can connect any Pascal file variable to any Subsystem
file.  The call to 'file$p' is equivalent to, and is used instead of,
the Pascal "reset" and "rewrite" statements.
.sp
To use 'file$p', it should be declared as a level 1 procedure:

.nf
   procedure file$p(var f: text; n: file_name); extern;
.fi

It may then be called to connect input and output, for example:

.nf
   file$p(input,'STDIN  ');
   file$p(output,'STDOUT ');
.fi

The name of the Subsystem file to be connected must be in upper
case and space filled.  It may be any of the following:  STDIN,
STDIN1, STDIN2, STDIN3, ERRIN, STDOUT, STDOUT1, STDOUT2, STDOUT3,
or ERROUT.
.im
'File$p' searches a table of Subsystem file names to determine the
standard unit number for the requested file.  If the name is not in
the table, 'file$p' calls the Primos routine ERRPR$ to signal a
bad file name error.  If the name is in the table, a call to 'mapsu'
is made to map the standard unit number into the Subsystem unit number,
and 'flush$' is called to ensure that the file has been written to
disk.  Then 'mapfd' is called to determine the Primos file unit
associated with the file, if there is one.  If there is no associated
file unit, the file is on the terminal and 'file$p' initializes the
Pascal file control block for a terminal file.  Otherwise, the Primos
routine ATTDEV is called to connect the requested file, and the Pascal
file control block is initialized.
[cc]mc |
After the type of file is determined (disk or terminal) the appropriate
[cc]mc
name is copied into the Pascal file control block; 'TTY' for terminal
files and for /dev/null, and the Primos treename for disk files.
.am
file
.ca
ctop, equal, flush$, gfnam$, mapfd, mapsu,
mktr$, move$, ptoc, Primos attdev, Primos errpr$
.bu
Files redirected to /dev/null are not supported.
.sp
Pascal terminal input does not behave correctly, the backspace key
cannot be used to erase previously entered characters.
.sa
init$p (2)
