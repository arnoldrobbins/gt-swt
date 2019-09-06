[cc]mc |
.hd svdump "dump the contents of the shell variable common" 05/27/83
subroutine svdump (fd)
file_des fd
.sp
Library:  vshlib (shell routine library)
.fs
'Svdump' outputs all internal shell variable information at
all lexic levels on the open file descriptor 'fd'.
.im
'Svdump' scans the hash table for each lexic level from the first
level to the current level and prints the hash chains (including
the variable names, values, and locations) in the internal shell
variable array.
.am
none
.ca
print
.sa
other sv?* routines (2)
[cc]mc
