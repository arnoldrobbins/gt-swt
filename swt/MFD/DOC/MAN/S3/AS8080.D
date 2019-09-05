.hd as8080 "Intel 8080 cross-assembler" 02/23/82
as8080
.ds
'As8080' is an extremely simplified cross-assembler for the
Intel 8080 microprocessor.
.sp
It is designed to assemble the output of the SSPL compiler in
a single pass, producing a file of relocatable object code with
a symbol table (suitable for later processing by 'intel' or 'lk').
It is also suitable for limited assembly language coding by
hand (allowing the SSPL run-time package to be assembled).
.sp
'As8080' takes a source program on its first standard input and
produces an object program on the file ".o".
The source program differs from Intel's standard format in
the following ways:
.sp
.in +5
.ta 6
.tc \
.ti -5
1.\Instruction mnemonics and labels may appear in any mixture
of upper and lower case.
Case is significant in labels, but not significant in instruction
mnemonics or register names.
Labels must be defined with trailing colons (:) and
may include the underscore (_) and the grave accent (`)
characters;
those labels beginning with underscore are not written to the
object file symbol table and may be used freely as temporaries.
.ti -5
2.\Register pairs may optionally be referred to as bc, de, hl, and sp.
.ti -5
3.\Binary and octal number representations are not supported.
Decimal integers may be used, or hexadecimal integers preceded
by a dollar sign ($).
.ti -5
4.\The following pseudo-operations are totally unsupported:
end, equ, macro, org, set.
The db and dw pseudo-ops have been replaced by the 'byte'
and 'word' pseudo-ops (otherwise identical in function).
.ti -5
5.\Arithmetic expressions more complex than labels or simple
integers are not supported.
(SSPL does not generate them.)
.ti -5
6.\Comments are indicated by preceding commentary text with a
sharp sign (#).
This rule applies uniformly; all comments must be preceded by
a sharp sign.
.ti -5
7.\'As8080' does not produce an assembly listing.
.ti -5
8.\Multiple statements may be place on one line provided they
are separated by semicolons (;).
.sp
.in -5
The object file produced by 'as8080' contains a number of
"segments," each consisting of a one-byte segment header,
two bytes of segment size, and the text of the segment.
Each byte of the object file occupies one 16-bit word in the
physical file.
.es
rtr.as> as8080
mux.s> lex | sspl | opt8080 | as8080
.fl
".o" for the object code file
.me
Many error messages, hopefully some of which are self-explanatory.
.bu
Locally supported.
.sa
sspl (3), opt8080 (3), as6800 (3), as11 (3), intel (3), lk (3)
