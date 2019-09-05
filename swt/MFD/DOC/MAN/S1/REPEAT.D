[cc]mc |
.hd repeat "loop control structure for Shell files" 09/05/84
repeat
   { <command> }
until @[ <value> ]
.ds
'Repeat' implements a Pascal-like repeat loop in the Shell.
The optional <value> after the 'until' command may be any string or
function call; if it is zero, empty, or missing altogether, it is
interpreted as false, otherwise it is interpreted as true. If <value>
is false, control transfers back to the top of the loop and
the list of commands are executed again, otherwise the loop terminates
and any other commands after the loop are executed.
.sp
'Repeat' operates by saving a copy of any commands entered between
the 'repeat' statement and the 'until' statement in a temporary
file. The top of the file contains a (hopefully) unique label and when
the 'until' statement is entered, an 'if' statement is generated
using <value> as the condition for a 'goto' to the label. For example
the repeat loop
.sp
.nf
.in +5
repeat
   set i = @[eval i + 1]
until @[eval i ">" 7]
.in -5
.fi
.sp
generates the following Shell file
.sp
.nf
.in +5
:L01t
set i = @[eval i + 1]
if @[eval i ">" 7]
else
goto L01t
.in -5
.fi
.sp
and then calls the shell to execute it. Since it is executing as
another level of the shell, the 'exit' command will actually cause
early termination of the loop, but a 'goto' statement to a label
outside the scope of the loop will not work because the label is not
accessible from within the shell file.
Another incidental advantage obtained from pre-processing the
structure and executing as another Shell level is that this loop can
be issued from the terminal and it will behave reasonably, i.e. - it will
execute the loop instead of ignoring any further commands the way
a 'goto' statement does.
.ne 7
.es
declare i = 0
repeat | change ?* "-- & --"     # they pipe, also
   echo @[i]
   set i = @[eval i + 1]
until @[eval i ">" 7]
.sp
repeat
   long_command
   even_longer_command
   if @[flag]
      exit              # terminate the loop early
   fi

   very_short_command
until @[done]
.sp
repeat
   hd swt
   pause for 5
until                   # infinite loop (defaults to false)
.me
.in +5
.ti -5
"Can't create temporary file for repeat loop" if there is a problem
creating a file to hold the processed 'repeat' loop.
.sp
.ti -5
"Too many arguments" if there is an argument overflow while trying
to copy the current arguments for the 'repeat' statement.
.sp
.ti -5
"Missing 'until'" if end-of-file is reached on command input before
a matching 'until' was found.
.in -5
.bu
Since the 'repeat' command causes another level of the shell to be
executed, the arguments need to be copied to the next level. If there
are many arguments to other commands in the network in which the
'repeat' is contained, then there could be an argument overflow.
.sp
Typing 'repeat' on someone's terminal will cause the Shell to ignore
any command they type until an EOF or a matching 'until' is typed.
.sa
if (1), then (1), else (1), fi (1), case (1), goto (1), until (1),
.ul
User's Guide for the Software Tools Subsystem Command Interpreter
[cc]mc
