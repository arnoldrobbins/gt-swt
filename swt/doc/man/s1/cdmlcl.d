[cc]mc |
.hd cdmlcl "compile and load a Cobol DML program" 08/27/84
[cc]mc
cdmlcl <program name> [<'ld' options>] [/ <'cobc' options>]
.ds
'Cdmlcl' is a shell file that invokes the Prime DBMS
Cobol DML preprocessor, the Primos Cobol compiler
and the Primos segmented loader.
[cc]mc |
If 'cdmlcl' is invoked with no <program name> argument,
it automatically processes the last program edited,
since it shares the shell variable 'f' with the shell program 'e'.
[cc]mc
The name of the file containing the program to be compiled must end
with ".cob", although in <program name> it may be specified with
or without the ending ".cob".
If no output file is specified in the <'ld' options>, the output
object file name will be <program name> with no extension.
.sp
Concerning the options,
'cobc' will be called with the <'cobc' options> specified on the
command line; then 'ld' will be called with the <'ld' options>
specified.
.es
cdmlcl myprog.cob
cdmlcl myprog subs.b subs2.b -l mylib
cdmlcl myprog / -ok -l mylist
.me
"<program name>.cob: cannot open"
.bu
An alternate binary file name cannot be specified.
.sa
[cc]mc |
cdmlc (1), cobc (1), ld (1), bind (3)
[cc]mc
