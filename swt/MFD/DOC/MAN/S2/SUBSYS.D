[cc]mc |
.hd subsys "call the Subsystem command interpreter" 08/27/84
integer function subsys (command)
character command (ARB)
.sp
Library:  vshlib (shell routine library)
.fs
'Subsys' takes an EOS terminated string as its only argument.
It then passes this string on to the shell to be executed.
.sp
'Subsys' returns ERR if it could not put the command where the
shell can get to it.
Otherwise, it passes on the return code from the shell's
execution of the command.
.im
'Subsys' first create a temporary file with 'mktemp'.
It writes the command to be executed to the file,
rewinds the open file descriptor, and then calls the 'shell'
subroutine on that descriptor.
Finally, it calls 'rmtemp' to close the temporary file.
.ca
mktemp, shell, rmtemp
.sa
mktemp (2), shell (2), rmtemp (2)
[cc]mc
