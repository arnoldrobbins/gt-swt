[cc]mc |
.hd vt$gsq "get a delimited sequence of characters" 07/11/84
[cc]mc
integer function vt$gsq (msg, delim, seq, max)
character msg (ARB), delim, seq (ARB)
integer max
.sp
[cc]mc |
Library: vswtlb (standard Subsystem library)
[cc]mc
.fs
'Vt$gsq' is used to read a sequence of characters from the
users terminal. The first argument is a message which will
be displayed in the status line, if one is enabled. The second
argument is the delimiter used to terminate the sequence. The third
argument is the returned sequence, and the last argument is the
maximum length of the sequence. 'Vt$err' is called to
print error messages for empty sequences, or for sequences
which are too long. The function return is ERR if an illegal
sequence is entered, or the length of the returned sequence.
.am
seq
.ca
ctomn, encode, vt$err, vtmsg, vtupd, Primos c1in
.bu
Not meant to be called by the normal user.
.sa
other vt?* routines (2) and (6)
