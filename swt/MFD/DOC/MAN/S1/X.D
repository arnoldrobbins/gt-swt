.hd x "execute Primos commands" 02/22/82
x [-d <directory-name>] [<Primos command>]
.ds
'X' allows users to execute Primos commands without leaving
the Subsystem. The
command and its arguments may be specified as arguments to 'x', or, if
no command is so specified,
'x' reads commands from its standard input.
If arguments are present,
'x' forms a Primos command by concatenating  all arguments (other
than the "-d <directory-name>" pair) into a single Primos
command line and passes it to the Primos command interpreter
with a call to the Primos routine CP$.  If the Primos command
returns with a
positive return code, 'x' exits with a call to 'error'; otherwise,
'x' exits normally.  No change is made to the Primos command
input source.
.sp
If 'x' reads commands from standard input, it reads the first
line, connects the Primos command source to the standard input
file (either disk or terminal) and passes the line to the
Primos command interpreter through CP$.  When the command
returns, 'x' resets the Primos command input source.  Then,
if the Primos command returned with a non-positive return
code, 'x' continues to read commands from standard input
until end-of-file; otherwise 'x' terminates with a call to
'error'.
.sp
All Primos file units that are left open by a Primos command
will be automatically closed by the Subsystem when the 'x'
command returns.  Please note that this means the sequence
.sp
      x "l mylist; ftn myprog"
.sp
will correctly deposit the listing file in "mylist", but
.sp
      x l mylist
      x ftn myprog
.sp
will deposit the listing in "l_myprog", since 'x' will
close the listing file when it returns.
.sp
If the "-d" option is specified, 'x' will attach to the named directory
without changing the home directory.  This gives the user the ability to
execute Primos commands on any point in the file system from any point
in the file system.
.es
x -d //system share se2031 2031 700
x pma prog.p 1/707
x "r system>sw4000 1/1"
.me
.in +5
.ti -5
"usage..." for missing directory name after "-d".
.ti -5
"<directory-name>: bad pathname" for bad directory.
.in -5
.sa
fc (1), ld (1), primos (1), stop (1)
