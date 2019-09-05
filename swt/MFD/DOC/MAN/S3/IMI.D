.hd imi "generate IMI prom programmer down-line load stream" 01/13/83
imi <object_file>  [ <relocation> ]
.ds
'Imi' takes the output of the Motorola 6800 cross-assembler
('as6800'), relocates it to the desired starting address
(0000 by default), and generates a down-line load stream suitable
for use by the International Microsystems, Inc., prom programmer.
.sp
Note that the relocation address is given in hexadecimal.
Other bases may be specified by preceding the address with the
desired base followed by the letter "r," e.g. "8r100000".
.es
imi mux
imi highloader 4000
.me
"Can't open" for unreadable object file.
.br
"Usage: imi ..." for missing arguments.
.br
"badly formed code file" for erroneous code files.
.bu
Locally supported.
.sa
as6800 (3), lk (3), intel (3), mot (3)
