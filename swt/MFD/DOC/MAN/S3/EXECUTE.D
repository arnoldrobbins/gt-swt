[cc]mc |
.hd execute "execute a SWT command on another machine" 07/20/83
execute [(<system> | all) [<command>]]
.ds
The 'execute' command interfaces to the SWT 'ring' process to allow
users to execute a SWT command on any system that is running 'ring'.
If the first argument is "all", 'ring' executes the command on all
machines in the ring; otherwise it specifies the system name of the
machine on which to execute the command.  Any remaining arguments
comprise the text of the commands to be executed.  If these arguments
are omitted, 'execute' reads one line from standard input (STDIN) and
executes it.  If no arguments are given, 'execute' reads one line
from STDIN and executes it on all systems.
.sp
In order to execute a command on another system, the 'ring' process on
the target system starts up a phantom with the requesting user's name.
This phantom has the same home and current directories as the 'ring'
process, and therefore the command line should contain a 'cd' command
to attach to the correct directory.  'Ring' has no way to determine if
a user is validated to log on to a system.  It simply creates a phantom,
and the 'swt' command will kill the process if it finds no "vars"
directory.
.sp
Note that the output from the phantom that 'ring' creates is not
transmitted back to the user who requested the service.  In order
to save that output, it must be written to a file and delivered
to the user in some other fashion (e.g. 'mail').
.es
execute gt.a sema drain -32
.sp
execute all "cd; lf | mail roy"
.me
.in +5
.ne 2
.ti -5
Cannot transmit EXECUTE request
.br
Something interfered with the transmission of the EXECUTE
command to the 'ring' process.  This should never happen.
.sp
.ne 2
.ti -5
Command complete
.br
The EXECUTE command has been successfully attempted on all
systems in the ring.
.sp
.ne 2
.ti -5
Command has been transmitted
.br
The EXECUTE command has been transmitted to the 'ring' process.
.sp
.ne 2
.ti -5
Networks are not configured
.br
The system is not configured to support PRIMENET.
.sp
.ne 2
.ti -5
Request to <system> failed
.br
The attempt to execute the command on system
<system> failed.
.sp
.ne 2
.ti -5
Request to <system> succeeded
.br
The attempt to execute the command on system
<system> succeeded.
.sp
.ne 2
.ti -5
Requested system is not in the ring
.br
The system on which the commands were supposed to
execute is not in the ring.
.sp
.ne 2
.ti -5
Ring connection has been terminated
.br
The connection to the 'ring' process has been cleared.
.sp
.ne 2
.ti -5
Unable to connect to ring node
.br
The current system is not running a 'ring' process.
.sp
.ne 2
.ti -5
You are not validated to EXECUTE
.br
Your user number is not allowed to use the EXECUTE
command.
.in -5
.bu
Will not work if the current system is not running 'ring'.
.sp
Cannot determine whether or not user is validated to log
on to the requested system(s).
.sp
Starts up phantoms in the 'ring' directory rather than in
the user's directory.
.sa
broadcast (3), setime (3), terminate (3)
[cc]mc
