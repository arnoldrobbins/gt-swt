[cc]mc |
.hd plgcl "compile and load a PL/I subset G program" 08/27/84
[cc]mc
plgcl <program name> [<'ld' options>] [/ <'plgc' options>]
.ds
'Plgcl' is a shell file that invokes the Primos PL/I subset G compiler
and the Primos segmented loader.
[cc]mc |
If 'plgcl' is invoked with no <program name> argument,
it automatically processes the last program edited,
since it shares the shell variable 'f' with the shell program 'e'.
[cc]mc
The name of the file containing the program to be compiled must end
with ".plg", although in <program name> it may be specified with
or without the ending ".plg".
If no output file is specified in the <'ld' options>, the output
object file name will be <program name> with no extension.
.sp
Concerning the options,
'plgc' will be called with the <'plgc' options> specified on the
command line; then 'ld' will be called with the <'ld' options>
specified.
.es
plgcl myprog.plg
plgcl myprog subs.b subs2.b -l mylib
plgcl myprog / -ok -l mylist
.me
"<program name>.plg: cannot open"
.bu
An alternate binary file name cannot be specified.
.sa
[cc]mc |
plgc (1), ld (1), init$plg (2), bind (3)
[cc]mc
