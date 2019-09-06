[cc]mc |
.hd svget "return the value of a shell variable" 05/27/83
integer function svget (name, value, maxval)
character name (ARB), value (maxval)
integer maxval
.sp
Library:  vshlib (shell routine library)
.fs
'Svget' looks up and returns the value of the most recent declaration
of the shell variable 'name'.
'Value' is the array to receive the value and 'maxval' is the
maximum amount of space (including the EOS) in the receiving
string. The function returns the length of the returned string
'value' if the variable is found and EOF otherwise.
.im
'Svget' searches for 'name' from the current lexic level back to
the first lexic level, stopping when it locates the first (most
recent) definition. Any previous declarations are ignored.
If the variable is not located then the function returns EOF;
otherwise, as much of the value as possible is copied into the
receiving buffer and the number of characters transferred is
returned.
.am
value
.ca
ctoc
.bu
Should probably return the lexic level of the variable located.
.sa
other sv?* routines (2)
[cc]mc
