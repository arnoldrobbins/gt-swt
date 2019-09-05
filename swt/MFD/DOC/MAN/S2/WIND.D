.hd wind "position to end of file" 03/23/80
integer function wind (fd)
file_des fd
.sp
Library:  vswtlb (standard Subsystem library)
.fs
'Wind' (pronounced w-eye-nd) is the opposite of 'rewind':
it positions a file's pointer to the
end of the file, rather than the beginning.  The argument is the file
descriptor of the file to be wound.  The function return is OK if the
wind was successful, ERR otherwise.
.im
'Wind' calls 'seekf' with an extremely large position argument,
thus setting the file pointer to EOF.
The return value is whatever 'seekf' returns.
.ca
seekf
.sa
rewind (2), trunc (2), seekf (2)
