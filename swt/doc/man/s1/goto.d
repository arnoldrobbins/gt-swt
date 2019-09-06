.hd goto "command file flow-of-control statement" 03/20/80
goto <label>
.ds
'Goto' provides a means of altering the flow of control in
command files.
After the execution of a 'goto' command, the command interpreter
will resume processing of the command file at the first
command (network, to be precise) labelled with the given identifier.
A node (and thus a network) may be labelled by preceding it with
a colon and an identifier, e.g.
.sp
.in +5
:exit echo Done.
.sp
.in -5
'Goto' is normally used only within command files;
however, it may be used from the terminal, with the restriction
that control can only be transferred forward, never back.
.es
goto exit
.me
"goto could not find target label" for a missing label.
.br
"Usage: goto <label>" if used without an argument.
.bu
'Goto' does not understand compound nodes, so jumping into the
middle of one may have unpredictable results.
If the target label is preceded by any I/O redirectors, it will
not be recognized.
.sa
if (1), case (1),
.ul
User's Guide for the Software Tools Subsystem Command Interpreter
