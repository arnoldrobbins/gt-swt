[cc]mc |
.hd plpcl "compile and load a PL/P program" 08/27/84
[cc]mc
plpcl <program name> [<'ld' options>] [/ <'plpc' options>]
.ds
'Plpcl' is a shell file that invokes the Primos PL/P compiler
and the Primos segmented loader.
[cc]mc |
If 'plpcl' is invoked with no <program name> argument,
it automatically processes the last program edited,
since it shares the shell variable 'f' with the shell program 'e'.
[cc]mc
The name of the file containing the program to be compiled must end
with ".plp", although in <program name> it may be specified with
or without the ending ".plp".
If no output file is specified in the <'ld' options>, the output
object file name will be <program name> with no extension.
.sp
Concerning the options,
'plpc' will be called with the <'plpc' options> specified on the
command line; then 'ld' will be called with the <'ld' options>
specified.
.es
plpcl myprog.plp
plpcl myprog subs.b subs2.b -l mylib
plpcl myprog / -xv -l mylist
.me
"<program name>.plp: cannot open"
.bu
An alternate binary file name cannot be specified.
.sa
[cc]mc |
plpc (1), ld (1), bind (3)
[cc]mc
