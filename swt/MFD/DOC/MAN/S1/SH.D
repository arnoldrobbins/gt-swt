[cc]mc |
.hd sh "Subsystem Command Interpreter (Shell)" 07/18/84
[cc]mc
sh
.ds
'Sh' is an entry into the Subsystem command interpreter.
When invoked, it reads commands from standard input one until
it encounters end-of-file, thus making it useful in pipelines.
.sp
The functions of the command interpreter are far
too complex to describe here; see the
.ul
User's Guide for the Software Tools Subsystem Command Interpreter
for a tutorial and more detailed information.
.es
files .r$ | change % "ar -u arch " | sh
command_file> sh >command_output
.fl
.in +5
.ti -5
=temp=/t?* for pipe temporaries, function returns, etc.
.ti -5
=gossip=/<login_name> for 'to' messages
.ti -5
=temp=/cn<line><sequence_number> for compound nodes
.in -5
.me
Many. See the User's Guide.
[cc]mc *
[cc]mc
.sa
.ul 2
User's Guide for the Software Tools Subsystem Command Interpreter,
Software Tools Subsystem Tutorial
