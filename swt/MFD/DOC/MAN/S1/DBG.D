[cc]mc |
.hd dbg "invoke the Primos source level debugger (DBG)" 08/31/84
[cc]mc
dbg { <DBG option> } <program> { <arguments> }
.ds
'Dbg' allows the user to access the facilities of the
Primos source level debugger (DBG) while still in the Subsystem.
<Program> is a Subsystem program that has been linked
by 'ld' with the "-d" option (i.e., it is a segment directory).
'Dbg' sets up the standard input and output ports and <arguments>
for access by the program and then executes DBG with a call
to Primos routine CP$.
.es
dbg -vfyi -vfyp prog.r> new_rp >prog.f
dbg test.o -s -t 3
.me
.in +5
.ti -5
"command too long" for too many DBG options to fit on a
Primos command line.
.in -5
.bu
If DBG bombs (as it has been known to do), the Subsystem must
be reinitialized with the sequence "dels all;dels 6002" and
then "swt".
.sp
Ratfor programs must be debugged using the Fortran names
and line numbers (yuk!).
[cc]mc |
.sp
When DBG terminates (with the "q" command) it exits to PRIMOS. Typing
"ren" will return back to the subsystem.
[cc]mc
.sa
fc (1), f77c (1), pc (1), plgc (1), ld (1)
