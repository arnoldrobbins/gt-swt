[cc]mc |
.hd szseg$ "size an open Primos segment directory" 09/18/84
subroutine szseg$ (size, fd)
longint size
integer fd
.sp
Library: vswtlb (standard Subsystem library)
.fs
'Szseg$' returns the size of the segment directory open on the Primos
file descriptor 'fd'. If an error occurs while sizing the directory,
'size' will contain ERR, otherwise it will contain the size in words
of the directory.
.im
The directory is read and each of the file entries is checked. If an
entry is a normal file, 'szfil$' is called to size it. If the entry
is another segment directory, 'szseg$' is called recursively to
size the subdirectory.
.am
size
.ca
Primos sgdr$$, Primos srch$$, szfil$ (6)
.sa
gfdata (2), sfdata (2), szfil$ (6)
[cc]mc
