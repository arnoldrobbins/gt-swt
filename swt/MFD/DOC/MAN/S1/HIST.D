[cc]mc |
.hd hist "manipulate the subsystem history mechanism" 09/05/84
hist [ on | off | save [ <file> ] | restore [ <file> ]]
.ds
The Shell contains a mechanism (similar to Berkeley Unix's C-Shell)
called
a history mechanism. This is sort of dynamic macro facility that
allows the user to specifiy a unique substring of a previous command
and have the command recalled and re-executed or have portions of the
command edited and inserted into the current command.
.sp
Up to 128 commands are saved in a circular command queue.
Commands are seached for and retrieved from this queue.
.sp
The possible options to 'hist' do the following
.sp
.tc \
.ta 6
.in +10
.ti -5
on\Turn the history mechanism on and reset the queue. If history is
already enabled then this will clear whatever command history exists
in the queue.
.sp
.ti -5
off\Turn the history mechanism off. Any command history in the queue
is lost.
.sp
.ti -5
save\Save the current command history in the specified file. If
no file is specified,
the command history is saved in the file "=histfile=".
.sp
.ti -5
restore\Restore the command history from a previous session from the
specified file. If no file is specified,
the command history is restored from the file "=histfile=".
.sp
.in -10
'Hist' with no options produces a list of the current command history
on STDOUT.
.sp
See the
.ul
User's Guide for the Software Tools Subsystem Command Interpreter
for a more detailed explanation of the history mechanism, and
examples of its use.
.es
hist
hist on
hist off
hist save
hist restore //jeff/bin/scum
.sa
.ul
User's Guide for the Software Tools Subsystem Command Interpreter
[cc]mc
