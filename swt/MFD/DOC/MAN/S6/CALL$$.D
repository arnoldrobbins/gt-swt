[cc]mc |
.hd call$$ "call a P300, SEG, or EPF runfile" 09/11/84
[cc]mc
integer function call$$ (name, length[, onunit])
integer name (16), length
external onunit
.sp
Library:  vswtlb (standard Subsystem library)
.fs
'Call$$' takes the packed name and name length of a P300 format
[cc]mc |
run file, a SEG segment directory, or EPF run file.
First 'call$$' attempts to restore the file with a call to the Primos
routine REST$$.
If REST$$ returns unsuccessfully, 'call$$' attempts to load the
file as a SEG run file through a call to 'ldseg$'.
If 'ldseg$' returns because the file was not a segment directory,
R$RUN is called with the restore option to attempt to load the file
as an EPF. If all
[cc]mc
attempts to load the file fail, 'call$$' returns ERR.
'Onunit', if specified, indicates that the shell's ANY$ onunit
is to be created.
.sp
'Call$$' returns (with value OK) if and only if the program it
calls exits by calling 'swt' or does a procedure return
from its main procedure.  Otherwise, control goes wherever the
called program sends it.
.sp
Before executing the run file, 'call$$' zeroes out the P300
fault vector in segment 4000, zeroes the program error return
code, calls 'iofl$' to mark which
Subsystem file units are open, and saves the stack base
register in the Subsystem common block for use by 'rtn$$'.
.sp
.im
'Call$$' first zeroes the program error return code and the
P300 fault vector.
It then tries to load the run file in memory with a call
to REST$$.  If there is an error on the restore,
'call$$' calls 'ldseg$' to load the file as a SEG run file.
[cc]mc |
If 'ldseg$' fails because the file is not a segment directory,
R$RUN is called to restore the file in memory as an EPF.
If R$RUN returns an error, 'call$$' returns ERR.
.sp
For P300 run files and SEG segment directories,
if the program just loaded begins in 64V mode, 'call$$'
[cc]mc
executes a PCL instruction to the address of its main
entry control block.  Otherwise, 'call$$' builds an R or
S mode entry control block for the program in the stack.
After setting up an onunit for ANY$ via a call to the Primos
routine MKONU$ (if the user specified a third argument),
'call$$' executes a PCL instruction to the correct entry control block.
[cc]mc |
If the file is an EPF run file, the onunit for ANY$ is still set
(if requested), but then R$INVK is called to start execution of
the file.
[cc]mc
.sp
When the called program returns directly to 'call$$' from 'rtn$$',
'call$$' calls 'cof$' to close all files opened by the program,
restores the user's terminal configuration word (saving the output
suppressed bit) via calls to Primos DUPLX$,
restores the previous saved stack base register and returns with
the value OK.
.ca
cof$, iofl$, ldseg$, move$, Primos break$, Primos duplx$,
[cc]mc |
Primos mkonu$, Primos rest$$, Primos rvonu$, Primos r$run,
Primos r$invk
[cc]mc
.bu
Will destroy the current executing memory image if the object
must be loaded at the same addresses.
[cc]mc |
.sp
The ability to execute EPF's is not really supported until
Prime decides to support EPF's.
[cc]mc
.sa
rtn$$ (6), swt (2)
