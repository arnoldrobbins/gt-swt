.hd mot "generate Motorola format object tape" 01/15/83
mot <object_file>  [ <relocation> ]
.ds
'Mot' takes the output of the Motorola 6800 cross-assembler
('as6800'), relocates it to the desired starting address
(0000 by default), and generates a Motorola standard format
object tape on its first standard output.
.sp
'Mot' is useful for down-line loading assembled code to
development systems equipped with the MIKBUG/MINIBUG ROM
(or any of the many other commercially available ROM's
using the same load format).
.sp
Unlike MIKBUG's Punch command, 'mot' generates an "L"
before and an "S9" after the object text, thus permitting
convenient loading of multiple files without operator
intervention.
.es
mot mux
mot highloader 16384
.me
"Can't open" for unreadable object file.
.br
"Usage: mot ..." for missing arguments.
.br
"badly formed code file" when an error is found in the code file.
.bu
Locally supported.
.sa
as6800 (3), lk (3), intel (3)
