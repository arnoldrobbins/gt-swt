[cc]mc |
.hd xccl "compile and load a Prime C program" 08/27/84
xccl <program name> [<'ld' options>] [/ <'xcc' options>]
.ds
'Xccl' is a shell file that invokes the Primos C compiler
and the Primos segmented loader.
If 'xccl' is invoked with no <program name> argument,
it automatically processes the last program edited,
since it shares the shell variable 'f' with the shell program 'e'.
The name of the file containing the program to be compiled must end
with ".c", although in <program[bl]name> it may be specified with
or without the ending ".c".
If no output file is specified in the <'ld'[bl]options>, the output
object file name will be <program[bl]name> with no extension.
.sp
Concerning the options,
'xcc' will be called with the <'xcc'[bl]options> specified on the
command line; then 'ld' will be called with the <'ld'[bl]options>
specified.
.es
xccl myprog.c
xccl myprog subs.b subs2.b -l mylib
xccl myprog / -l mylist
.me
"<program name>.c: cannot open"
.sa
xcc (1), ld (1), bind (3)
[cc]mc
