.hd ioinit "initialize Subsystem I/O areas" 03/25/82
subroutine ioinit
.sp
Library:  vswtlb (standard Subsystem library)
.fs
'Ioinit' reinitializes certain control words in the Subsystem's
input/output common block.
At present, it is used solely for starting the Subsystem from
scratch.
.im
'Ioinit' sets the erase character, kill character, repeat character,
escape character, terminal character buffer pointer,
Subsystem newline character, kill response (the string that gets
printed when a kill character is encountered), terminal attributes,
and terminal character count.
In addition, it "opens" the user's terminal on the file descriptor
designated
by the macro TTY and sets all other file descriptors to "closed",
and sets the Subsystem printer form and printer destination.
Finally, it sets all entries in the standard port table to TTY.
.ca
ctoc
.sa
icomn$ (6)
