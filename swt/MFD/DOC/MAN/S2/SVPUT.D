[cc]mc |
.hd svput "set the value of a shell variable" 05/27/83
integer function svput (name, value)
character name (ARB), value (ARB)
.sp
Library:  vshlib (shell routine library)
.fs
'Svput' sets the value of existing shell variable 'name' or creates
a new variable with the specified value at the current lexic level
if 'name' does not already exist.
The function returns the lexic level of the
variable that was set. If the variable controls a value kept in
the SWT common block, 'svput' updates the value in the
common block to reflect the new value of the variable.
.im
If the variable exists at any lexic level, 'svput' replaces the
previous value. If the variable does not exist, 'svput' calls 'svmake'
to create the variable at the current lexic level.
If the variable controls a location in the SWT common
block, 'svput' saves the current value in the SWT common and copies
the new value in its place.
.am
none
.ca
svmake
.sa
other sv?* routines (2)
[cc]mc
