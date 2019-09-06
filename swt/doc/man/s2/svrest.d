[cc]mc |
.hd svrest "restore shell variables from a file" 05/27/83
integer function svrest (file, trace)
character file (ARB)
bool trace
.sp
Library:  vshlib (shell routine library)
.fs
'Svrest' takes a file written by 'svsave' and attempts to merge
the variables in the file with those on the current lexic level.
Variables already in existence at the current level will not be
replaced. 'File'
is the name of the file containing the 'svsave'd variables. If
'trace' is set, 'svrest' produces a trace of the restoration
consisting of each variable followed by its value printed on
the terminal. The function returns ERR if the file cannot
be read or if it is misformatted; otherwise, the function returns OK.
.im
If the file cannot be opened then 'svrest' returns ERR, otherwise
it reads pairs of lines containing the names and values of the
variables. For each pair of the lines it calls 'svmake' to merge
the variables with the existing ones. If it reads a name without a
corresponding value, it closes the file and returns ERR.
.am
none
.ca
close, open, print, svmake
.sa
other sv?* routines (2)
[cc]mc
