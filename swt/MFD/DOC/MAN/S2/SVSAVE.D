[cc]mc |
.hd svsave "save shell variables in a file" 05/27/83
integer function svsave (file, trace)
character file (ARB)
bool trace
.sp
Library:  vshlib (shell routine library)
.fs
'Svsave' takes the shell variables at lexic level 1 and writes them
to 'file'. Setting 'trace' produces a trace of the variables being
saved on the users terminal. The trace consists of the name of
each variable being saved followed by its value. The function returns
ERR if the file could not be opened and OK otherwise.
.im
If the file can't be opened, then the function returns an error;
otherwise, the current level of shell variables is traversed and
written to the file.
.am
none
.ca
close, open, print, putch, putlin, trunc
.sa
other sv?* routines (2)
[cc]mc
