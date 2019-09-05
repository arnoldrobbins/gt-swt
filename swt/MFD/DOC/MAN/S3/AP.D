[cc]mc |
.hd ap "Generate Object Tape for A & P M6800 Monitor" 07/19/84
ap <file> [<start_address>]
.ds
'Ap' reads the relocatable binary file in <file>, and produces
absolute code, in hexadecimal,
on its first standard output.
The optional <start_address> is where it will relocate the code to.
The default starting address is zero.
.me
"Usage:[bl]ap[bl]..." if called improperly.
.bu
Locally supported.
.sp
This description may not be entirely accurate, since this
command has long been undocumented.
.sa
Whatever other programs are used
for the "Allen and Paul Model 1" terminal.
[cc]mc
