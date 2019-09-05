.hd lk "link cross-assembler object files" 01/18/83
lk -(6800 | 8080) { [-(i | l | n)] file }
.ds
'Lk' is used to link together the object code files produced
by the 'as6800' and 'as8080' cross-assemblers.
It produces a file of the same type as the input files,
so the output of 'lk' may itself be linked with other code files.
.sp
If no arguments are given on the command line then they are
taken from standard input.
'Lk' always writes its output to the file "l.out".
.sp
The first argument selects the machine that the object files
have been compiled for: "-6800" refers to the Motorola 6800,
while "-8080" indicates the Intel 8080.
The remaining options select the mode the linker is running
under and the input files that are to be linked.
The available modes are:
.sp
.in +15
.ta 6 16
.tc \
.ti -15
-i\INCLUDE\This is
the default mode.
When in this mode, all object segments encountered in the
files specified are linked together onto "l.out".
.ti -15
-l\LIBRARY\In this mode,
the arguments are taken to be libraries, that is, concatenations
of object code files made with 'lib'.
Each segment is examined to see if it satisfies a previously
[cc]mc |
unresolved external reference, and is linked in only if it does.
[cc]mc
.ti -15
-n\NAMELIST\Any file read
in this mode is considered to be a program that can be expected
to be resident at the time that the output file is to be
run on the target machine.
Any entries encountered in this file's symbol table that
satisfy a previously unresolved external reference are
used to resolve that reference, but the segment itself
is not linked in.
.in -15
.es
lk -6800 tpart1.o tpart2.o -n mux.o -l [libs]
.fl
"l.out" for the output code file.
.me
"Usage: lk ..." for invalid argument syntax.
.br
Many other error messages, hopefully some of which are self-explanatory.
.bu
Locally supported.
.sa
as8080 (3), intel (3), size (3), symbols (3)
