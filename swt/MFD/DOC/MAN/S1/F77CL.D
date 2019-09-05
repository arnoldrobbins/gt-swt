[cc]mc |
.hd f77cl "compile and load a Fortran 77 program" 08/27/84
[cc]mc
f77cl <program name> [<'ld' options>] [/ <'f77c' options>]
.ds
'F77cl' is a shell file that invokes the Primos Fortran 77
and the Primos segmented loader.
[cc]mc |
If 'f77cl' is invoked with no <program name> argument,
it automatically processes the last program edited,
since it shares the shell variable 'f' with the shell program 'e'.
[cc]mc
The name of the file containing the program to be compiled must end
with ".f77", although in <program name> it may be specified with
or without the ending ".f77".
If no output file is specified in the <'ld' options>, the output
object file name will be <program name> with no extension.
.sp
Concerning the options,
'f77c' will be called with the <'f77c' options> specified on the
command line; then 'ld' will be called with the <'ld' options>
specified.
.es
f77cl myprog.f77
f77cl myprog subs.b subs2.b -l mylib
f77cl myprog / -ok -l mylist
.me
"<program name>.f77: cannot open"
.bu
An alternate binary file name cannot be specified.
.sa
[cc]mc |
f77c (1), ld (1), init$f (2), bind (3)
[cc]mc
