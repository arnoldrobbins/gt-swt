[cc]mc |
.hd svlevl "return the current shell variable lexic level" 05/27/83
integer function svlevl (level)
integer level
.sp
Library:  vshlib (shell routine library)
.fs
'Svlevl' returns the current lexic level of the shell in 'level'.
The function return is also the lexic level.
.im
The lexic level information is retrieved from the internal
shell variable common block and returned. The value will be
in the range from one to some maximum value (currently ten).
.am
level
.sa
other sv?* routines (2)
[cc]mc
