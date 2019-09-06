.hd cpfil$ "copy one open file to another" 03/25/82
subroutine cpfil$ (ifd, ofd, rc)
integer ifd, ofd, rc
.sp
Library:  vswtlb (standard Subsystem library)
.fs
'Cpfil$' expects 'ifd' to contain the Primos file unit number
of a file open for reading, and 'ofd' to contain the Primos
file unit number of a file open for writing.  'Cpfil$'
attempts to copy the contents of the input file to the output
file.  If any condition arises that prevents completion of the
copy, 'cpfil$' sets 'rc' to ERR; otherwise, it sets it to
OK.  On return, both files are left open and positioned to
the end.
.im
'Cpfil$' makes repeated calls to Primos PRWF$$ with a large
buffer to quickly move the data between the files.
.am
rc
.ca
Primos prwf$$
.sa
cpseg$ (6), filcpy (2), fcopy (2)
