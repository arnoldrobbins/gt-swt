[cc]mc |
.hd vt$db2 "dump terminal input tables" 07/11/84
[cc]mc
subroutine vt$db2
.sp
[cc]mc |
Library: vswtlb (standard Subsystem library)
[cc]mc
.fs
'Vt$db2' dumps out the key sequence definitions from the terminal
input tables in semi-formatted form.
.im
For each key sequence definition table, 'vt$db2' first checks to
see if the table is being used.  If so, it prints out all the
entries in the table, with the format being based on what the
information type is.  The types of information stored include the
pointer to the next definition table, a pointer to a definition
sequence, or character values.  Unprintable character values
are converted to mnemonics before being output.
.ca
ctomn, print
.bu
Not meant to be called by the normal user.
.sa
other vt?* routines (2) and (6)
