[cc]mc |
.hd history "Software Tools Subsystem historian" 08/27/84
history
[cc]mc
.ds
'History' is a simple command file that keeps a history of changes
[cc]mc |
to the Subsystem.
It is intended for use by the Subsystem
implementors to keep a record of changes and additions.
.sp
'History' is invoked with no arguments, since they are not used.
The user invoking 'history' must be in the group '.guru'
(users who are all powerful and all knowing) in order to
be able to make changes in the Subsystem history.
Since most systems do not have the '.guru' group, the local
administrator should change =src=/std.sh/history.sh to use
an appropriate test.
Essentially, one should test if the user has permission to
modify the history file.
.sp
To see what changes have been made to the Subsystem, use the
command 'phist'.
[cc]mc
.es
[cc]mc |
history
[cc]mc
.fl
.in +5
.ti -5
=doc=/hist/history for the history of the Software Tools Subsystem.
.in -5
.me
.in +5
.ti -5
[cc]mc |
"Must be a guru to issue this command" if the user
is not allowed to change the Subsystem history.
[cc]mc
.in -5
.sa
phist (1)
