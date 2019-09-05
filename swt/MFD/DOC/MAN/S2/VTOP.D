[cc]mc |
.hd vtop "convert PL/I varying string to packed string" 10/26/83
integer function vtop (vstr, pstr, len)
packed_char vstr (ARB), pstr (len)
integer len
.sp
Library:  vswtlb (standard Subsystem library)
.fs
'Vtop' converts a PL/I-compatible "character varying" string
into a packed character string.
Character varying strings consist of a one-word length field,
followed by up to 32767 words of packed character data.
.sp
The argument 'vstr' is the character-varying string to be converted.
'Pstr' is an array which receives the packed string;
'len' gives the number of words available in 'pstr'.
.sp
The function returns the number of characters copied into 'pstr'.
.sp
.im
'Vtop' first checks that 'len' is large enough to allow it to store
characters in 'str' and then
computes the number of characters it can copy.
If there is room for characters in 'pstr',
'vtop' copies successive words from 'vstr' into 'pstr' until
it fills 'len' words or runs out of characters in 'vstr'.
If 'vstr' contains an odd number of characters,
'vtop' pads the last word with 0's (an EOS character).
.am
pstr
.sa
other conversion routines ('pto?*' and '?*tov'), particularly
'ptov' (2), 'ctop' (2), 'ptoc' (2), 'vtoc' (2), and 'ctov' (2)
[cc]mc
