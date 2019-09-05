.hd getfd$ "look for an empty file descriptor" "03/25/82"
file_des function getfd$ (fd)
file_des fd
.sp
Library:  vswtlb (standard Subystem library)
.fs
'Getfd$' is used by 'open' and 'mkfd$' to find an unused
file descriptor with which to set up a file unit.  If it
could find one, it returns that file descriptor; otherwise,
it returns ERR.
.im
The file descriptor list is searched to find one that is
available.
The search is attempted first on file descriptors that
lie within the current page of memory.  If one is not found, the
search is then performed on any remaining file descriptors
(possibly requiring paging to bring in the required data);
if a free descriptor is found, then it is returned
to the caller.
If none are found this time, ERR is returned.
.am
fd
.sa
mkfd$ (6), open (2)
