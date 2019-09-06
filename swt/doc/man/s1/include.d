.hd include "expand include statements" 03/20/80
include
.ds
Many Ratfor programs use the Ratfor "include" statement to
include a frequently used body of code, such as the standard
definition file "=incl=/swt_def.r.i", as part of the source input.
This is useful for saving disk space, but is sometimes inconvenient
if the programmer wishes to see the entire text of his
program.  The 'include' command is provided to make this possible.
'Include' copies its standard input to its standard output,
while looking for lines that begin with "include", followed by
a file name, possibly enclosed in quotes (" or ').  If such a
line is found, the contents of the named file are inserted
in its place and copying continues as before.  Files to be
included may be nested to a depth of 5.
.es
prog.r> include | pr
.me
.in +5
.ti -5
"Can't open include" if include file could not be found.
.in -5
.sa
rp (1), macro (1)
