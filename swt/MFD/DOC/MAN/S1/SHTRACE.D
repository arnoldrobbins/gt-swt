.hd shtrace "trace activity in command interpreter" 02/22/82
shtrace  { on | debug | all | value | <octal_integer>
         | cl | command_line
         | cn | compound_node
         | ex | execution
         | fn | function
         | it | iteration
         | lo | location
         | ls | linked_strings
         | nd | node
[cc]mc |
         | ou | onunit
[cc]mc
         | pd | port_descriptor
         | sr | sv_restore
         | ss | single_step
         | sv | sv_save }
.ds
'Shtrace' is a debugging aid intended for those who maintain the
Subsystem, particularly its command interpreter.
Because of its value in debugging shell programs, it has been
released for general use, with the warning that it may change
without notice.
.sp
In essence, 'shtrace' prints the status of a command line or its
environment as the command is processed by the shell.
Since this involves many operations,
there are many potential "checkpoints" within the command
interpreter.
The 'shtrace' options are intended to pick out the most vital
points along a command's path from entry to execution.
.sp
Each option is specified as a single character-string argument,
which, except for special cases, may be abbreviated with a
two-character mnemonic.
These options are as follows:
.sp
.in +10
.ti -5
command_line (cl)
.br
The command line is printed as it is read, without processing.
(The output from this and other options is preceded by a number
in brackets, e.g. @[2.1];
the integer part is the lexic level of the command (the number
of command inputs currently active), while the fractional part
is the node number of the node within its network.)
.sp
.ti -5
compound_node (cn)
.br
The command line is printed after compound nodes have been
replaced by temporary command files.
.sp
.ti -5
function (fn)
.br
The command line is printed after all function calls have
been evaluated.
.sp
.ti -5
iteration (it)
.br
The command line is printed after all iteration groups have
been expanded.
.sp
.ti -5
execution (ex)
.br
The network about to be executed is printed.
No compound nodes, functions, or iterations will appear in this
version of the command.
.sp
.ti -5
node (nd)
.br
The node about to be executed is printed, along with its
arguments.
.sp
.ti -5
single_step (ss)
.br
Just before a network is executed, the command interpreter will
stop, prompt for input with the string "continue?", and wait
for a reply from the user.
Inputs beginning with "n" or "N" cause execution to be terminated;
other inputs cause processing of commands to be continued.
(This option is most useful when used in conjunction with the
"command_line" option.)
.sp
.ti -5
port_descriptor (pd)
.br
The port descriptor table used by the shell to assign files
to the standard input and output ports is dumped in symbolic
format.
Along with a mnemonic for each standard  port is printed the
file unit associated with it and the source or destination of
the data (file or pipe).
.sp
.ti -5
sv_save (sv)
.br
This option causes the shell variables and their values to be
printed whenever they are saved on disk (e.g., when a 'stop'
or 'save' command is executed).
.sp
.ti -5
sv_restore (sr)
.br
This option causes the shell variables and their values to be
printed whenever they are loaded from disk (e.g., when the
Subsystem is started by the 'swt' command).
.sp
.ti -5
linked_strings (ls)
.br
Whenever garbage collection takes place in the linked string
storage area, a summary of the memory structure is printed.
.sp
.ti -5
location (lo)
.br
Following the execution of each node, the full pathname of the
command just executed is printed.
.sp
[cc]mc |
.ti -5
onunit (ou)
.br
Whenever the shell's default onunit is invoked, the condition
that was raised is printed.
.sp
[cc]mc
.in -10
In addition to these options, there are three "shorthand"
options for specifying common combinations.
The "on" option turns on the "node" and "execution" traces;
"debug" turns on "node", "execution", and "single_step";
"all" turns on all traces available.
.sp
All traces may be turned off by executing 'shtrace' with no
arguments.
.sp
'Shtrace' prints on standard output one
an octal integer reflecting the last state of
the trace control variable, suitable for saving in a shell
variable or otherwise recording for later use.
The special option "value" may be used to simply print the current
value of the control variable without changing it.
If an octal integer is given as an argument to 'shtrace',
that bit pattern is assigned to the trace control variable.
Thus, a user's trace options may be changed and then reset
to their original state.
.es
shtrace on
shtrace
shtrace cn ss pd
set old_shtrace = [shtrace nd]
shtrace [old_shtrace]
.sa
dump (1),
.ul
User's Guide for the Software Tools Subsystem Command Interpreter
