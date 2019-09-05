[cc]mc |
.hd pmacl "assemble and load a PMA program" 08/27/84
[cc]mc
pmacl <program name> [<'ld' options>] [/ <'pmac' options>]
.ds
'Pmacl' is a shell file that invokes the Primos Macro Assembler
and the Primos segmented loader.
[cc]mc |
If 'pmacl' is invoked with no <program name> argument,
it automatically processes the last program edited,
since it shares the shell variable 'f' with the shell program 'e'.
[cc]mc
The name of the file containing the program to be compiled must end
with ".s", although in <program name> it may be specified with
or without the ending ".s".
If no output file is specified in the <'ld' options>, the output
object file name will be <program name> with no extension.
.sp
Concerning the options,
'pmac' will be called with the <'pmac' options> specified on the
command line; then 'ld' will be called with the <'ld' options>
specified.
.es
pmacl myprog.s
pmacl myprog subs.b subs2.b -l mylib
pmacl myprog / -x -l mylist
.me
"<program name>.s: cannot open"
.bu
An alternate binary file name cannot be specified.
.sa
[cc]mc |
pmac (1), ld (1), bind (3)
[cc]mc
