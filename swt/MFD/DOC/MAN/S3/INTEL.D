.hd intel "generate Intel format object tape" 01/13/83
intel <object_file>  [ <relocation> ]
.ds
'Intel' takes the output of the Intel 8080 cross-assembler
('as8080'), relocates it to the desired starting address
(0000 by default), and generates an Intel standard format
object tape on its first standard output.
.sp
'Intel' is useful for down-line loading assembled code to
development systems equipped with a standard ROM loader.
.es
intel mux
intel highloader 16384
.me
"Can't open" for unreadable object file.
.br
"badly formed code file" for erroneous code files.
.bu
Locally supported.
.sa
as8080 (3), lk (3), mot (3)
