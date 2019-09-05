[cc]mc |
.hd terminate "terminate currently executing 'ring' process" 07/20/83
terminate [<system>]
.ds
The 'terminate' command is an interface to the SWT 'ring' process which
allows validated users to terminate the currently executing ring process
on a system.  The specified 'ring' process clears all of its connections
and terminates.  However, since a 'ring' process must always be running
on each system in the ring to ensure the security of the ring, the shell
file executing 'ring' will immediately re-execute it.  'Terminate' allows
the 'ring' comoutput file to be reinitialized, and can be used to execute
a new version of the 'ring' process.  If <system> is specified, 'ring'
terminates on the machine with that system name, otherwise all 'ring'
processes terminate.
.es
terminate gt.a
.sp
terminate
.me
.in +5
.ne 2
.ti -5
Cannot transmit TERMINATE request
.br
Something interfered with the transmission of the TERMINATE
command to the 'ring' process.  This should never happen.
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
The attempt to broadcast the message on system
<system> failed.
.sp
.ne 2
.ti -5
Request to <system> succeeded
.br
The attempt to broadcast the message on system
<system> succeeded.
.sp
.ne 2
.ti -5
Requested system is not in the ring
.br
The system which was to be terminated is not in
the ring.
.sp
.ne 2
.ti -5
Ring connection has been terminated
.br
The connection to the 'ring' process has been cleared.
.sp
.ne 2
.ti -5
Termination complete
.br
The TERMINATE command has been successfully attempted on all
requested systems.
.sp
.ne 2
.ti -5
TERMINATE request initiated
.br
The TERMINATE command has been transmitted to the 'ring' process.
.sp
.ne 2
.ti -5
Unable to connect to ring node
.br
The current system is not running a 'ring' process.
.sp
.ne 2
.ti -5
You are not validated to TERMINATE
.br
Your user number is not allowed to use the TERMINATE
command.
.in -5
.bu
Will not work if the current system is not running 'ring'.
.sa
broadcast (3), execute (3), setime (3)
[cc]mc
