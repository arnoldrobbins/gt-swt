[cc]mc |
.hd svscan "scan a user's list of shell variables" 05/27/83
integer function svscan (name, maxlen, info [, offset] )
character name (maxlen)
integer maxlen, info (3), offset
.sp
Library:  vshlib (shell routine library)
.fs
'Svscan' provides the user with a way of retrieving a list of the
shell variables that are currently declared. Each call to 'svscan'
returns one variable name. The first and second arguments are the
returned name and the maximum length (including the EOS) that the
name can attain. The third argument is a three word array that
'svscan' uses to keep track of its position in the internal shell
variable data structure. The user should set the first element
of this array to zero before the first call to 'svscan' and afterwards
should leave it alone. The last argument is an optional offset
from the current lexic level of the shell at which to scan for the
shell variables. If 'offset' is omitted, 'svscan' scans the current
level. The function returns the length of the returned shell variable
name, or EOF if all variables have been returned. The user should not
make any subroutine calls that will change any shell variables
between the first call to 'svscan' and the final one. Doing so
may cause duplicate names to be returned or may cause some names
to be skipped.
.im
If the first element of the information array is 0, 'svscan' initializes
the rest of the array. Otherwise it checks information in the array
'info' for validity and then scans the variable data structures for
the next shell variable starting at the previous position.
If all shell variables have already been returned, 'svscan' returns
EOF, otherwise it copies as much of the variable name as possible
to the user's receiving buffer and returns the number of characters
copied as the function return.
.am
name, info
.ca
ctoc
.sa
other sv?* routines (2)
[cc]mc
