.hd lib "concatenate cross-assembler object files" 01/13/83
lib  { <object_file> }
.ds
'Lib' is used to concatenate the object code files produced
by the 'as6800' and 'as8080' cross-assemblers.
This is usually done to generate a library suitable for use
by the link editor 'lk'.
.sp
If arguments are given on the command line, 'lib' concatenates
the named files and places their concatenation on the file "lib.out".
Otherwise, file names are taken from standard input, and their
contents are concatenated and placed on "lib.out".
.es
files .o$ | lib
lib rtrlib new_routine.o
.fl
"lib.out" is always the output file.
.me
"Can't open" for unreadable or unwritable files;
.bu
Locally supported.
.sa
as6800 (3), as8080 (3), size (3), symbols (3), lk (3)
