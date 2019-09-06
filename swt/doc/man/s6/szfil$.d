[cc]mc |
.hd szfil$ "size an open Primos file descriptor" 09/18/84
longint function szfil$ (fd)
integer fd
.sp
Library: vswtlb (standard Subsystem library)
.fs
'Szfil$' returns the size of the file (in words) associated
with the open Primos
file unit 'fd'. If there is some error on the file, the function
return is ERR. The file is left positioned at the end of file.
.im
Primos PRWF$$ is called to relatively position the file to a large
position until the file reaches end of file. Then PRWF$$ is called to
read the current position of the file. If any error occurs, the function
returns ERR, otherwise the size of the file is returned as the
function return.
.am
none
.sa
gfdata (2), sfdata (2), szseg$ (6)
[cc]mc
