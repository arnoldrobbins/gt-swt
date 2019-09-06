.hd as6800 "Motorola 6800 cross-assembler" 02/23/82
as6800 [-{l | d}]
.ds
'As6800' is an extremely simplified cross-assembler for the
Motorola 6800 microprocessor.
.sp
It is designed to assemble the output of the SSPL compiler in
a single pass, producing a file of relocatable object code with
a symbol table (suitable for later processing by 'mot' or 'lk').
It is also suitable for limited assembly language coding by
hand (allowing the SSPL run-time package to be assembled).
.sp
'As6800' takes a source program on its first standard input and
produces an object program on the file ".o".
The assembler differs from Motorola's standard in the following
ways:
.sp
.in +5
.ta 6
.tc \
.ti -5
1.\Instruction mnemonics that make use of an accumulator symbol
("a" or "b") may not be separated from the accumulator symbol.
Thus, "add a #5" is illegal; the correct form is "adda #5".
.ti -5
2.\Labels may appear in any mixture
of upper and lower case.
Character case is significant.
Instruction mnemonics must appear in lower case.
Labels may include the underscore (_) and the grave accent (`)
characters;
those labels beginning with underscore are not written to the
object file symbol table and may be used freely as temporaries.
All characters in labels are significant.
.ti -5
3.\Binary and octal number representations are not supported.
Decimal integers may be used, or hexadecimal integers preceded
by a dollar sign ($).
.ti -5
4.\The following pseudo-operations are totally unsupported:
end, pag, opt, equ.
The fcb and fdb pseudo-ops have been replaced by the 'byte'
and 'word' pseudo-ops (otherwise identical in function).
The rmb pseudo-op has been replaced by the 'res' pseudo-op,
with identical function.
The 'org' pseudo-op may not be used to decrease the location
counter; only forward origins are allowed.
.ti -5
5.\Arithmetic expressions more complex than labels or simple
integers are not supported.
(SSPL does not generate them.)
.ti -5
6.\Comments are indicated by preceding commentary text with a
percent sign (%).
This rule applies uniformly; all comments must be preceded by
a percent sign.
.ti -5
7.\Unless the "-l" option is specified, 'as6800' does not produce
an assembly listing.
When "-l" is used, the assembly listing is produced on standard
output one.
.ti -5
8.\Multiple statements may be place on one line provided they
are separated by semicolons (;).
.ti -5
9.\Unless the "-d" option is specified, the 'direct' (page-zero)
addressing mode is not used (since instructions using it
cannot be relocated).
When the "-d" option is used, the user must take care that no
direct-address forward references are made.
.sp
.in -5
The object file produced by 'as6800' contains a number of
"segments," each consisting of a one-byte segment header,
two bytes of segment size, and the text of the segment.
Each byte of the object file occupies one 16-bit word in the
physical file.
.es
rtr.as> as6800
mux.s> lex | sspl | opt6800 | as6800
.fl
".o" for the object code file
.me
Many error messages, hopefully some of which are self-explanatory.
.bu
Locally supported.
.sa
sspl (3), opt6800 (3), as8080 (3), as11 (3), mot (3), lk (3)
