.hd dmpfd$ "dump the contents of a file descriptor" 01/05/83
subroutine dmpfd$ (fd, ofd)
file_des fd, ofd
.sp
Library:  vswtlb (standard Subsystem library)
.fs
'Dmpfd$' prints all information that is of importance to the user
about file descriptor 'fd' on file unit 'ofd'.  Among the items of
information produced are the file name (if obtainable), file position
(if a disk file), file buffer information, the most recent file system
return code, and the contents of the file buffer (if a disk file).
Each of these pieces of information is displayed with the appropriate
heading.
.im
'Gfnam$' is called to obtain the name of the file associated with
the descriptor.  If the name could be obtained, it is printed out.
Other file unit information is printed, in the proper format, from
information stored in the Subsystem common areas.  The current
position in a disk file is obtained by calling the Primos routine
PRWF$$.
.ca
gfnam$, mapsu, print, putch, putlin, Primos prwf$$
.sa
dump (1)
