[cc]mc |
.hd shell "run the Subsystem command interpreter" 09/11/84
integer function shell (fd)
file_des fd
.sp
Library:  vshlib (shell routine library)
.fs
'Shell' takes an open file descriptor as its only argument.
The shell reads command lines from this file descriptor, and
attempts to execute the commands.
.sp
This is the main routine for the user level shell as well.
For details on how to use the shell, see
.ul
The User's Guide for the Software Tools Subsystem Command Interpreter.
.sp
Having the shell as a subroutine opens up many possibilities not
previously available to the programmer.  However, care must be
exercised when using the shell.
In particular, since EPF's are not currently supported,
it is quite possible for two user programs called from different
invocations of the shell to destroy each other's code and/or data.
For example, if you run 'se' on one file, and then from 'se' you
run the shell, and from the new shell you run 'se' on a second file,
the second 'se' will overwrite the data of the first 'se' (effectively
destroying your first editing session).
This is because the data for both instances of 'se' are
loaded into the same area of (virtual) memory.
There is currently no safe way to get around this, other than to
be careful about what programs you run from subsidiary invocations
of the shell.
(The screen editor should be relatively safe from
most programs (besides another 'se'),
since its data is not loaded into the default segment
(segment 4000), and the code is in a shared segment.)
.sp
When EPF's are supported, it is recommended that everything then
be reloaded in EPF format.  This will allow you to invoke programs
from subsidiary shells without having to worry about what segment
a program loads in.
.# if and when all SWT is loaded as EPF's, remove the rest of
.# this paragraph.
Until then, it is recommended that you do not use this subroutine
for programs that will be loaded in segment 4000, since as soon
as you run another external program which also loads in 4000,
the first program will be destroyed.
(When the second program exits, you will end up back in the lowest
level of the shell.)
.sp
'Shell' returns OK if everything went well, otherwise it returns ERR.
.im
Too complicated to describe here.
.am
None
.sa
.ul
The User's Guide for the Software Tools Subsystem Command Interpreter,
sh (1),
subsys (2)
[cc]mc
