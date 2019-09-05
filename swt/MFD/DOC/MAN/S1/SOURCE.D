[cc]mc |
.hd source "print source for a command or subroutine" 07/19/84
source { <command> | <subroutine> }
[cc]mc
.ds
[cc]mc |
The 'source' command writes a copy of the source code of the
named commands or subroutines
to standard output, in 'cat -h' format.
[cc]mc
.es
source help
.fl
=src=/misc/srcloc for locations of all source code files
[cc]mc |
.me
"Usage:[bl]source[bl]..." if called with no arguments
.bu
Not exactly blindingly fast.
[cc]mc
.sa
[cc]mc |
cat (1),
[cc]mc
locate (1)
