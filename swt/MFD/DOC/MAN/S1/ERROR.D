.hd error "output error message, return error code" 03/20/80
error [ -<error_code> ]  { <arbitrary_string> }
.ds
'Error' is used in shell programs to announce the presence of an error
condition and return an error code.
The option argument specifies the error code returned;
the default is 1000
(identical to the value returned by the subprogram 'error').
The arguments specified are written to ERROUT, separated by spaces
and terminated by a NEWLINE.
.es
error File not found.
error -1 "Attention: your program has just been destroyed"
.bu
Probably should understand escape sequences, like 'echo'.
.sa
echo (1), error (2), seterr (2)
