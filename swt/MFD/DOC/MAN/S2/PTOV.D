[cc]mc |
.hd ptov "convert packed string to PL/I varying string" 09/23/83
integer function ptov (pstr, term, vstr, len)
packed_char pstr (ARB), vstr (len)
integer len
character term
.sp
Library:  vswtlb (standard Subsystem library)
.fs
'Ptov' converts a packed character string (e.g., Fortran Hollerith
literals) into a PL/I-compatible "character varying" string.
Character varying strings consist of a one-word length field,
followed by up to 32767 words of packed character data.
.sp
The argument 'pstr' is the packed array to be converted.
'Term' specifies a "termination character"; if the termination character
appears unescaped in the packed string, then
'ptov' terminates the copying operation without copying 'term'.
(For example, most uses of packed strings in
.ul
Software Tools
included a period as a termination character, since in general
there is no other way for a subprogram to tell where a Hollerith
literal ends.)
The argument 'vstr' is an array which
receives the character-varying string;
'len' gives the number of words available in 'vstr',
including the leading one-word length field.
.sp
The function returns the number of characters copied into 'vstr'.
.sp
Many Primos routines return packed character strings that do
not have a termination character, but do have a maximum
length.
When using 'ptov' to convert the output of these routines, one
may use EOS as the termination character to obtain a fixed-length
result.
.im
'Ptov' first checks that 'len' is large enough to allow it
to store characters in 'vstr'.  If there is room for characters
in 'vstr', 'ptov' fetches successive words from 'pstr',
unpacks the characters, checks for escaped characters and 'term',
and then packs the characters into 'vstr'.  When it encounters
'term' or if it fills 'len' words with data, 'ptov' returns
the number of characters copied.
.am
vstr
.sa
other conversion routines ('pto?*' and '?*tov'), particularly
'vtop' (2), 'ctop' (2), 'ptoc' (2), 'vtoc' (2), and 'ctov' (2)
[cc]mc
