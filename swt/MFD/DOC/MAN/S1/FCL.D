[cc]mc |
.hd fcl "compile and load a Fortran 66 program" 08/27/84
[cc]mc
fcl <program name> [<'ld' options>] [/ <'fc' options>]
.ds
'Fcl' is a shell program that invokes the Primos Fortran 66 compiler
and the Primos segmented loader.
[cc]mc |
If 'fcl' is invoked with no <program name> argument,
it automatically processes the last program edited,
since it shares the shell variable 'f' with the shell program 'e'.
[cc]mc
The name of the file containing the program to be compiled must end
with ".f", although in <program[bl]name> it may be specified with
or without the ending ".f".
If no output file is specified in the <'ld'[bl]options>, the output
object file name will be <program[bl]name> with no extension.
.sp
Concerning the options,
'fc' will be called with the <'fc'[bl]options> specified on the
command line; then 'ld' will be called with the <'ld'[bl]options>
specified.
.es
fcl myprog.f
fcl myprog subs.b subs2.b -l mylib
fcl myprog / -o -l mylist
.me
"<program name>.f: cannot open"
.bu
An alternate binary file name cannot be specified.
.sa
[cc]mc |
fc (1), ld (1), init$f (2), bind (3)
[cc]mc
