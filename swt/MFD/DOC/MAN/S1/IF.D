.hd if "conditional statement for Shell files" 03/20/80
if <value>
   then
      { <command> }
   else
      { <command> }
.br
fi
.ds
'If' allows users of the Shell's programming facilities to
execute commands conditionally, after the fashion of the Algol 68
conditional clause.
.sp
The <value> after the if command may be any string; if it is
zero, empty, or missing altogether, it is interpreted as false;
otherwise, it is interpreted as true.
If <value> is true, then the commands after the keyword 'then' are
executed; otherwise, the commands after the keyword 'else' are
executed.
In either alternative, any commands (including nested if commands)
may be used.
.sp
The keyword 'then' is optional.
The keyword 'else' and its associated commands may be omitted if
no action is desired when <value> is false.
The keyword 'fi' is mandatory.
.sp
'If' is not restricted to use in command files, and so may produce
puzzling results when used incorrectly from a terminal.
These can always be handled by typing a 'fi' command or by
generating end-of-file to the command interpreter.
.es
if @[nargs]
   set params = @[args]
fi
.sp
if @[eval i ">=" 10]
   then
      goto exit
   else
      set i = @[eval i + 1]
      goto loop
fi
.sp
if @[flag]; then; echo "Success!"
else; echo "Failure..."
fi
.me
.in +5
.ti -5
"Missing 'fi'" if end-of-file is reached on command input before
a matching 'fi' was found.
.in -5
.bu
Redirectors in front of the 'else' will prevent it from being
recognized.
.sp
Typing "if" on someone's terminal will cause the Shell to ignore
any command they type until an EOF or an unmatched 'fi' is typed.
.sa
then (1), else (1), fi (1), case (1), goto (1),
.ul
User's Guide for the Software Tools Subsystem Command Interpreter
