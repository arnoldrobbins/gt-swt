.hd dsdump "produce semi-readable dump of storage" 03/25/82
subroutine dsdump (form)
character form
.sp
Library:  vswtlb (standard Subsystem library)
.fs
'Dsdump' dumps the contents of memory managed by
'dsinit', 'dsget', and 'dsfree' to ERROUT.
It is primarily intended for debugging.
.sp
The single argument is either the defined value LETTER,
signifying that a character-format dump is desired,
or the defined value DIGIT,
signifying that an integer-format dump is desired.
.im
'Dsdump' simply steps through the memory area (in common block DS$MEM)
printing the locations and sizes of available blocks and calling
'dsdbiu' to dump the location, size, and contents of each block
that is in use.
The dump terminates when the end of memory (as indicated by the contents
of the first word of memory) is reached.
.sp
The routine 'print' is used for all output.
.ca
print, dsdbiu
.bu
As advertised, the dump is only semi-readable.
.sa
dsget (2), dsfree (2), dsinit (2), dsdbiu (6)
