.hd vpsd "Subsystem interlude to SEG's vpsd" 02/28/82
vpsd <program> { <arguments> }
.ds
'Vpsd' allows the user to invoke the Primos V-mode Symbolic
Debugger (VPSD) on a Subsystem program. The program must have
been linked by 'ld' with the "-d" option (i.e., it must be
a segment directory). The standard ports are assigned and
the arguments are set-up, and then a call to the Primos loader (SEG)
with the "vpsd" option is made, via 'sys$$'.
.es
vpsd bogus_program >bonzo
echo Test data | vpsd non_debugged_program -d -l -t 2>answers
.bu
There is no protection in either the shell or 'vpsd' for user
errors (such as changing incorrect memory locations) while in
VPSD.
.sp
'Vpsd' is not much good for debugging programs written in
anything other than assembly. For programs written in a
higher level language, use 'dbg'.
.sp
The single character I/O of VPSD is not the duke's choice.
.sa
dbg (1), sys$$ (2),
[ul Prime Assembly Language Programmer's Guide] (Chapters
18 and 21 on VPSD),
[ul Prime Load and Seg Reference Guide]
