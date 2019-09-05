.hd dputl$ "put a line on a disk file" 03/25/82
integer function dputl$ (line, fd)
character line (ARB)
file_descriptor_struct fd
.sp
Library:  vswtlb (standard Subsystem library)
.fs
'Dputl$' is called by 'putlin' to write a line on a disk file.
The first argument is an EOS-terminated string to be placed on the
disk file; the second argument is the file descriptor of the file
on which the string is to be written.
The function return is OK for a successful call, ERR otherwise.
'Dputl$' is not protected from user error, and so should not be used
except as it is called by 'putlin'.
.im
'Dputl$' maintains a count of blanks to be used for file compression.
When a non-blank character is encountered in the string, any blanks
accumulated are translated to a relative horizontal tab (RHT)
and a blank count, and the non-blank character is output.
Characters placed in the disk buffer are output by a shortcalled
routine internal to 'dputl$'; this routine calls the Primos routine
PRWF$$ to do the actual data transfer.
.ca
Primos prwf$$
.sa
putlin (2), dgetl$ (6), tputl$ (6)
