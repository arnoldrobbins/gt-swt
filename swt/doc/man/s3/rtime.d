.hd rtime "determine run-time of a command" 01/15/83
rtime <command>
.ds
'Rtime' is a shell program that will determine the CPU time
used by the execution of a particular command.
The command to be timed should be specified as the set of
arguments to 'rtime';
quoting of the command to prevent premature evaluation of
any command-language metacharacters is recommended.
.sp
The given command is used in a function call, and its output
on standard output one redirected to /dev/tty if no other i/o
redirection for standard output one is specified.
This may cause problems if the command uses all three standard
output ports.
.es
rtime rp rp.r
rtime "stuff> filter >nonsense"
.me
"Usage: rtime ..." for improper command syntax.
.bu
Redirection problem mentioned above.
.sa
hp (1), ctime (1)
