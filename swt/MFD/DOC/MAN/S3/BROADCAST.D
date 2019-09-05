[cc]mc |
.hd broadcast "send a Primos message to a user on all machines" 07/20/83
broadcast [(<user> | all) [<message>]]
.ds
The 'broadcast' command allows users to send a Primos message on all
systems that are running the SWT process 'ring'.  If the first argument
is "all", 'ring' broadcasts the message to all users on each machine in
the ring, otherwise <user> is the user name of the recipient of the
message.  The remaining arguments constitute the text of the 80 character
message to be broadcast.  If omitted, 'broadcast' reads one line from
standard input (STDIN) and broadcasts it.  If no arguments are given,
'broadcast' reads one line from STDIN and broadcasts it to all users.
.es
broadcast all System going down in 5 minutes.  Please log off.
.sp
broadcast jeff Your wife called.  The house burned down.
.me
.in +5
.ne 2
.ti -5
Cannot transmit BROADCAST request
.br
Something interfered with the transmission of the BROADCAST
command to the 'ring' process.  This should never happen.
.sp
.ne 2
.ti -5
Message complete
.br
The BROADCAST command has been successfully attempted on all
systems in the ring.
.sp
.ne 2
.ti -5
Message has been transmitted
.br
The BROADCAST command has been transmitted to the 'ring' process.
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
You are not validated to BROADCAST
.br
Your user number is not allowed to use the BROADCAST
command.
.in -5
.bu
Will not work if the current system is not running 'ring'.
.sp
Message is sent by the 'ring' process because that is the
process which actually executes the Primos 'message' command.
.sa
execute (3), setime (3), terminate (3)
[cc]mc
