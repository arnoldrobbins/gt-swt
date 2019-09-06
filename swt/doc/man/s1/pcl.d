[cc]mc |
.hd pcl "compile and load a Pascal program" 08/27/84
[cc]mc
pcl <program name> [<'ld' options>] [/ <'pc' options>]
.ds
'Pcl' is a shell file that invokes the Primos Pascal compiler
and the Primos segmented loader.
[cc]mc |
If 'pcl' is invoked with no <program name> argument,
it automatically processes the last program edited,
since it shares the shell variable 'f' with the shell program 'e'.
[cc]mc
The name of the file containing the program to be compiled must end
with ".p", although in <program[bl]name> it may be specified with
or without the ending ".p".
If no output file is specified in the <'ld'[bl]options>, the output
object file name will be <program[bl]name> with no extension.
.sp
Concerning the options,
'pc' will be called with the <'pc'[bl]options> specified on the
command line; then 'ld' will be called with the <'ld'[bl]options>
specified.
.es
pcl myprog.p
pcl myprog subs.b subs2.b -l mylib
pcl myprog / -ok -l mylist
.me
"<program name>.p: cannot open"
.bu
An alternate binary file name cannot be specified.
.sa
[cc]mc |
pc (1), ld (1), init$p (2), bind (3)
[cc]mc
