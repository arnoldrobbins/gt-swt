[cc]mc |
.hd vt$db1 "print mnemonics for special characters" 07/11/84
[cc]mc
subroutine vt$db1 (title, seq)
character title (ARB), seq (ARB)
.sp
[cc]mc |
Library: vswtlb (standard Subsystem library)
[cc]mc
.fs
'Vt$db1' is used to print out a label in 'title', along with the
mnemonics for the special (unprintable) character sequence in 'seq'.
.im
'Print' is called to output 'title'; then each character in 'seq',
up to the first EOS, is converted to its associated mnemonic and
printed out. All output is written to ERROUT.
.ca
ctomn, print
.bu
Not to be called by the normal user.
.sp
Mainly used for debugging of the VTH package.
.sa
other vt?* routines (2) and (6)
