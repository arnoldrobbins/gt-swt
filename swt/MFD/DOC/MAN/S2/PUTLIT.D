.hd putlit "write literal string on a file" 02/24/82
subroutine putlit (message, delimiter, fd)
packed_char message (ARB)
character delimiter
file_des fd
.sp
Library:  vswtlb (standard Subsystem library)
.fs
'Putlit' provides a way to place a literal string on a
file.  Its first argument is a packed character string, terminated by a
character specified in the second argument.  The third argument is the
file descriptor of the file to be used.
.sp
'Putlit' is maintained for compatibility with earlier versions of
the Subsystem.
In the future, 'Putlin' should be used to write literal strings.
.im
'Putlit' calls 'ptoc' to unpack its first argument, then calls 'putlin'
to print the unpacked string on the specified file.
.ca
ptoc, putlin
.bu
Returns no status to indicate whether or not the write was successful.
.sa
ptoc (2), putlin (2), print (2), encode (2)
