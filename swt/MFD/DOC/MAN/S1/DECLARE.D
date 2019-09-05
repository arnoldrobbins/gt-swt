[cc]mc |
.hd declare "create shell variables" 09/11/84
[cc]mc
declare { <identifier> [ = <value> ] }
.ds
'Declare' is the primary method of creating shell variables with
local (i.e., to the command file) scope.  Its arguments are the names
of the variables to be declared;  they are declared at the current
lexical level and assigned the specified values.
If a value is not specified for a variable, it is given the
empty string as a value.
[cc]mc |
Value may contain unprintable characters in a mnemonic format.
The format is '<' ascii_mnemonic '>'. To set dummy to
a dash followed by a control-g and then another dash one would
say:
.sp
.in +5
declare dummy = "-<bel>-".
.in -5
.sp
The quotes are needed to prevent the shell from interpreting the
'<' and '>' signs as I/O redirectors.
[cc]mc
Variables declared
within a command file exist as long as that command file is active;
when its execution is complete, they disappear.
If a variable of the same name is already declared at that level,
its value is not changed.
.sp
Variables may also be created by the 'set' command.
.es
declare name address telephone_number
declare terminal_type
[cc]mc |
declare i = 1 bel = "<bel>"
declare nobel = "@<bel>"
[cc]mc
.bu
Does not complain about multiple declarations of a variable
within a given scope.
.sa
forget (1), set (1), vars (1), save (1),
.ul
User's Guide for the Software Tools Subsystem Command Interpreter
