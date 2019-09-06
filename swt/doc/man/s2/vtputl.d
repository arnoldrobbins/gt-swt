[cc]mc |
.hd vtputl "put line into terminal screen buffer" 07/11/84
[cc]mc
subroutine vtputl (str, row, col)
integer row, col
character str (ARB)
.sp
[cc]mc |
Library: vswtlb (standard Subsystem library)
[cc]mc
.fs
'Vtputl' is used to place a string of characters into
the screen buffer, in the specified position. The first
argument is the EOS-terminated string of characters
to be displayed; the second and third arguments are
the (row, column) position on the screen where the first
character of the string is to be displayed. 'Vtputl' only
places the string into the screen buffer; 'vtupd' must be
called before any changes to the internal buffer are
reflected on the screen.
.im
'Vtputl' simply calls 'vt$put' with the same arguments,
plus the length of the string, and then returns.
.ca
vt$put, length
.sa
length (2), and other vt?* routines (2)
