.hd symbols "print cross-assembly symbol table" 01/15/83
symbols (-6800 | -8080) <object_file>
.ds
'Symbols' prints the symbol table placed in an object code file
by one of the cross-assemblers 'as6800' or 'as8080' or by the
linker 'lk'.
The mandatory first argument specifies the assembler used
to create the original object code file.
.sp
Each symbol is printed along with its (16-bit) value and a
"type" designator, which is "ext" for external, "rel" for
relocatable, or "abs" for absolute (8080 register mnemonics).
.es
symbols -6800 .o
symbols -8080 mux
.me
"Usage: symbols ..." for invalid argument syntax.
.br
Warnings if the object file could not be opened or if it was
improperly structured.
.sa
as6800 (3), as8080 (3), lk (3), size (3)
