[cc]mc |
.hd otd "object text dumper" 09/10/84
otd <file_name>
.ds
'Otd' is a program that reads relocatable binary files
and prints their contents in human-readable form.
It is useful for analyzing the output of high level language
compilers.
You can use 'otd' to compare the quality of two compilers'
code generation phases, or for debugging your own compilers.
.es
otd hello.b
.me
"usage: otd ..." if called with not arguments.
.sp
"filename: can't open" if it can't open the file.
.sp
"bad object file" for a an object file format it does not understand.
.sp
"inconsistent block size"
.sp
"unrecognized block type ..."
.sp
"block size ... exceeds buffer space"
.bu
Does not read its standard input port if called with no arguments.
.sa
.ul
VCG User's Guide
[cc]mc
