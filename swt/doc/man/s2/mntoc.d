.hd mntoc "convert ASCII mnemonic to character" 03/28/80
character function mntoc (buf, p, default)
character buf (ARB), default
integer p
.sp
Library:  vswtlb  (standard Subsystem library)
.fs
'Mntoc' is used to convert a standard ASCII mnemonic
(e.g. ACK, BEL, BS) into an ASCII character code.
The argument 'buf' is an EOS-terminated string presumed to contain
either a single character or a two- or three-character ASCII
mnemonic (in either upper or lower case), starting at position 'p'.
The function return depends on the outcome of the conversion as follows:
(1) if 'buf' contains only one character, the function return is
equivalent to that character;
(2) if 'buf' contains an ASCII mnemonic terminated by a nonalphanumeric
character, the function return is the character code associated with that
mnemonic;
(3) otherwise, the function return is equivalent to the character specified
as the third argument ('default').
In all cases, 'p' is advanced to the first character beyond the presumed
mnemonic or single character.
.im
The mnemonic is transferred to an internal character buffer,
then used in a binary search of a string table containing the
ASCII mnemonics.
.am
p
.ca
mapstr, strbsr
.sa
ctomn
