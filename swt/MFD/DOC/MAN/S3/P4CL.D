[cc]mc |
.hd p4cl "compile and load Pascal 4 program" 08/24/84
[cc]mc
p4cl <source> <ld arguments>
.ds
'P4cl' is a shell program that invokes the necessary sequence of
commands to convert a Pascal source file into an executable
program.  The first argument,
.nh
<source>
.hy
specifies the file
that will contain the final executable version of the program.
The Pascal source code is assumed to be in the file named
<source>.p.
[cc]mc |
If 'p4cl' is invoked with no <source> argument,
it automatically processes the last program edited,
since it shares the shell variable 'f' with the shell program 'e'.
[cc]mc
Any further arguments appearing on the command line are
passed directly on to the loader, 'ld'.
.sp
The Pascal compiler, 'p4c', is first invoked to convert
the contents of the source file into an equivalent Fortran program
and write it into the file named <source>.f.  A compilation
listing is also generated on the file <source>.l.  (This listing
contains Fortran forms control characters and may be printed
with 'sp' using the "-f" option.)
.sp
The Fortran compiler is then invoked, using 'fc', to produce a
binary relocatable version of the program in the file <source>.b,
which is then prepared for execution by 'ld'.
.es
p4cl copy
p4cl xref -t -m xref.m
.bu
Locally supported.
.sa
p4c (3), fc (1), ld (1)
