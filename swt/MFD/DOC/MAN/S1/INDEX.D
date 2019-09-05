.hd index "find index of a character in a string" 03/20/80
index <string> <character>
.ds
'Index' is a version of the PL/I index function.  The string
specified as the first argument is searched for an occurrence of
the character specified as the second argument; if the character
is found, 'index' prints its location in the string (first character
in the string is at position 1) on standard output. If the character
is not found, zero is printed.
.sp
'Index' is equivalent to the 'index' subprogram available in the standard
Software Tools Subsystem library.
.es
index "abcdefghijklmnopqrstuvwxyz" [alpha]
index [upalf] [alpha]
take [index [string] " "]] [string]
.bu
None, unless you consider the argument order a bug.
.sa
take (1), drop (1), substr (1), index (2)
