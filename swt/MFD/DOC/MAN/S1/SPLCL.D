[cc]mc |
.hd splcl "compile and load a SPL program" 08/27/84
[cc]mc
splcl <program name> [<'ld' options>] [/ <'splc' options>]
.ds
'Splcl' is a shell file that invokes the Primos SPL compiler
and the Primos segmented loader.
[cc]mc |
If 'splcl' is invoked with no <program name> argument,
it automatically processes the last program edited,
since it shares the shell variable 'f' with the shell program 'e'.
[cc]mc
The name of the file containing the program to be compiled must end
with ".spl", although in <program name> it may be specified with
or without the ending ".spl".
If no output file is specified in the <'ld' options>, the output
object file name will be <program name> with no extension.
.sp
Concerning the options,
'splc' will be called with the <'splc' options> specified on the
command line; then 'ld' will be called with the <'ld' options>
specified.
.es
splcl myprog.spl
splcl myprog subs.b subs2.b -l mylib
splcl myprog / -ok -l mylist
.me
"<program name>.spl: cannot open"
.bu
An alternate binary file name cannot be specified.
.sa
[cc]mc |
splc (1), ld (1), bind (3)
[cc]mc
