.hd como "divert command output stream" 01/16/83
como { -{c | n | p | t} } [ <pathname> ]
.ds
The 'como' command is used to control the destination of
command output; that is, output from a program that would
otherwise appear on the terminal.  (This is in no way related
to the redirection of standard inputs and outputs provided
by the Subsystem.)  It is useful in conjunction with phantoms
or long command files that are usually run without human
supervision.
.sp
Command output may be routed to the terminal (the normal
case), a file, both the terminal and a file, or to neither
destination (in which case the output is lost).  The options
are as follows:
.tc \
.ta 6
.in +10
.sp
.ti -5
-c\(Continue.) If a <pathname> argument is specified, subsequent
command output is appended to the named file;
otherwise, output to a previously opened file is
continued (see the "-p" option).  Terminal output
is not affected.
.sp
.ti -5
-n\(No output to terminal.) Terminal output is turned off.
File output is not affected.
.sp
.ti -5
-p\(Pause.) File output is turned off.  The file is not
closed, so that file output may be subsequently
resumed with a "como -c" command.  Terminal output
is not affected.
.sp
.ti -5
-t\(Output to terminal.) Terminal output is turned on.  The use of this
option in no way affects the status of file
output.
.in -10
.sp
In all cases, the specification of a <pathname> results
in the opening of the named file and the turning on of file
output, even when the "-p" option is specified.  When used
without any arguments, 'como' closes any file that may have
been receiving command output, turns off file output, and
turns on terminal output.
.sp
.es
como listing
como
como -cn save
.me
"Usage: como ..." for invalid argument syntax.
.br
"bad pathname" the <pathname> could not be found.
.bu
If a <pathname> is specified and the file did not previously exist,
a direct access file is created, rather than a sequential file.
.sa
Primos como$$, Primos COMO command
