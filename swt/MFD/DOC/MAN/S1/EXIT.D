.hd exit "terminate execution of command files" 03/20/80
exit  [ <levels> ]
.ds
'Exit' causes execution of one or more currently active
command files to cease.
It is somewhat similar to the PL/I "return" statement in
that it simulates a normal termination of at least one
environment (scope).
.sp
When invoked, 'exit' positions the <levels> most recently
activated command files to end-of-file and dumps the command
interpreter's internal command buffer.
Thus, when the command interpreter next attempts to fetch a
command, it sees <levels> successive ends-of-file and cleans
up the associated environments.
If <levels> is omitted, only one level is terminated.
.sp
'Exit' is most often used to terminate a command file when
some error condition defined by the user occurs
(for example, an attempt to use the command file by an
unauthorized user).
.es
if [cmp [login_name] ~= SYSTEM]
   echo "Sorry, you are not allowed to use this program."
   exit
fi
.bu
May behave irrationally if <levels> is too large.
.sa
error (1), if (1), sh (1), goto (1),
.ul
User's Guide for the Software Tools Subsystem Command Interpreter
