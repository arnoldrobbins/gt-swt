.hd forget "destroy shell variables" 03/20/80
forget { <identifier> }
.ds
'Forget' is used to destroy shell variables that were created
by 'declare' or 'set'.  The arguments supplied must be names of
shell variables that are active at the current lexical level.
The named variables will be removed from the command interpreter's
symbol table.
.sp
Note that it is not necessary to explicitly destroy shell variables
that are declared local to a command file; when the execution of the
command file is completed, they will be destroyed automatically.
.es
forget name address telephone_number
forget face
.sa
declare (1), set (1), vars (1), save (1),
.ul
User's Guide for the Software Tools Subsystem Command Interpreter
