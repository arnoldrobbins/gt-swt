.hd to "send messages to a logged-in user" 09/16/82
to (<login-name> | <user-number>) [<message>]
.ds
'To' is used to send messages to another logged-in user.
The first argument is the login name or user number of the user to
whom the message is to be sent.
If any other arguments are present, they are assumed
to be message text and are sent to the named user.
If the login name, or user number, is the only argument specified,
'to' copies the text of the message from standard input.
.sp
The message, preceded by the sender's name and user number and the
current day and time, will appear on the
named user's terminal when he is next prompted for a command by
the Subsystem command interpreter.
.es
to jack There seems to be a problem with se on the tvt...
to 16 Why is the system so slow?
message> to perry
.fl
=gossip=/<login-name> to hold the message
.br
=gossip=/*<user-number> to hold the message
.me
.in +5
.ti -5
"Usage: to ..." if no arguments are specified.
.ti -5
"bad user number" if the user number is not in the range 1..128.
.ti -5
"bad user name" if the user name is not that of a valid user.
.ti -5
"User is busy. Try later." if message file is in use.
.in -5
.bu
Gossip messages are neither secure nor private.
.sa
mail (1)
