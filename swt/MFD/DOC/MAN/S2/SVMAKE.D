[cc]mc |
.hd svmake "create a shell variable at the current lexic level" 05/27/82
integer function svmake (name, value)
character name (ARB), value (ARB)
.sp
Library:  vshlib (shell routine library)
.fs
'Svmake' creates a shell variable 'name' at the current lexic level
of the shell with the value 'value'.
The function returns the lexic level at which the variable has
been created.
If the variable controls a value kept in the SWT common block,
the value in the common block is updated to reflect the new
value of the variable.
.im
First, 'svmake' checks the existence of the variable at the current
lexic level. If it exists, then the function returns immediately;
otherwise it allocates space in the variable area for the name
and value.
If the variable controls a location in the SWT common block,
'svmake' saves the current value in the SWT common and copies
the new value in its place.
.am
none
.ca
length, ctoc
.sa
other sv?* routines (2)
[cc]mc
