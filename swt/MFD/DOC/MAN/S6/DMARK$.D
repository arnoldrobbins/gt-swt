.hd dmark$ "return the position of a disk file" 03/25/82
file_mark function dmark$ (f)
file_des f
.sp
Library:  vswtlb (standard Subsystem library)
.fs
'Dmark$' performs the function of 'markf' for disk files.
The single argument is the file descriptor of a disk file;
the function return is the current file pointer value for
the selected file.
ERR is returned if the position of the file could not be
determined.
.sp
As with all Subsystem routines whose names contain the dollar
sign ($), 'dmark$' is not intended for general use.
'Markf' is normally used to provide the required functionality.
.im
The Primos routine PRWF$$ is used to return the current file
position, which is in units of words past the beginning of file.
If for any reason PRWF$$ cannot determine the position, 'dmark$'
returns ERR.
.ca
Primos prwf$$
.sa
markf (2), tmark$ (6), seekf (2)
