.hd trunc "truncate a file" 02/24/82
integer function trunc (fd)
file_des fd
.sp
Library:  vswtlb (standard Subsystem library)
.fs
'Trunc' is used to truncate writeable files at their current position;
that is, to delete the remainder of the file.
The argument is the file descriptor of the file to be truncated;
the function return is OK if the truncation
was successful, ERR otherwise.
.im
'Flush$' is called to empty the buffers associated with the given file.
If the file to be truncated is a terminal file or the null device,
then an immediate successful return is taken.
If the file to be truncated is a disk file,
it is truncated by the Primos routine PRWF$$.
If the return from PRWF$$ is good, 'trunc' returns OK;
if not, 'trunc' returns ERR.
.ca
flush$, mapsu, Primos prwf$$
.bu
Behavior on terminal files is somewhat questionable.
.sa
remove (2), rmtemp (2)
