.hd chunk$ "read one chunk of a SEG runfile" 01/05/83
integer function chunk$ (bp, seg, fd)
longint bp
integer seg, fd
.sp
Library:  vswtlb (standard Subsystem library)
.fs
'Chunk$' expects the segment directory to be open on 'fd'
(a Primos file descriptor).  It opens the file in
the segment directory at position 'seg + 2' and
reads 2048 words into memory at position pointed to by 'bp'.
The function return is OK if the read was successful, and ERR if
any errors occur.
.im
[cc]mc |
Straightforward through calls to the Primos routines
[cc]mc
SGDR$$, SRCH$$, and PRWF$$.
.ca
Primos sgdr$$, Primos srch$$, Primos prwf$$
.sa
ldseg$ (6), zmem$ (6)
