.hd ctomn "translate ASCII control character to mnemonic" 03/28/80
integer function ctomn (c, rep)
character c, rep (4)
.sp
Library:  vswtlb  (standard Subsystem library)
.fs
'Ctomn' is used to convert an unprintable ASCII character to its
official ASCII mnemonic.
The first argument is the character to be converted;
the second is a string to receive the mnemonic.
The function return is the length of the string placed in the second
argument.
.sp
If the character passed is printable, it is copied through unchanged
to the receiving string.
If not, its two- or three-character ASCII mnemonic
(e.g. NUL, SOH, etc.) is copied into the receiving string.
.im
If the character is printable, it is placed in the receiving string,
which is then terminated with EOS.
If the character is between 128 and 160, inclusive,
or equals 255,
its value is
used to compute an index into a string table containing the
mnemonics.
The mnemonic thus selected is copied into the receiving string.
.am
rep
.ca
scopy
.sa
mntoc (2)
