[cc]mc |
.hd vtprt "place formatted strings into screen buffers" 07/11/84
[cc]mc
integer function vtprt (row, col, fmt, a1, a2, ... , a10)
integer row, col
character fmt (ARB)
untyped a1, a2, a3, a4, a5, a6, a7, a8, a9, a10
.sp
[cc]mc |
Library: vswtlb (standard Subsystem library)
[cc]mc
.fs
'Vtprt' is used to place formatted strings into the screen buffers.
'Row' and 'col' tell where the resulting string is to be placed.
'Fmt' is a formatting string like that used in encode to define
how the final string is to look. It can be either an EOS terminated
string, or a packed string.
The remaining arguments are the items to be put on the screen
according to formatting control.
.sp
'Vtprt' works equivalent to the Subsystem subroutine 'print'.
The user
is advised to look at the documentation for 'print' for a
full explanation of the formatting capabilities of 'vtprt'.
.im
'Vtprt' checks for the legality of the position (row and col),
and returns ERR if it isn't legal. It then checks the string
for being packed, or unpacked. If it is packed, 'ptoc' is called
to unpack the character string. 'Encode' is then called to
do the formatting, and then 'vt$put' is called to place the string
in the screen buffer.
The size of the resulting string is the function return.
.ca
ptoc, encode, vt$put
.sa
encode (2), print (2), ptoc (2), other vt?* routines (2)
