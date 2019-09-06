[cc]mc |
.hd xcc "compile a C program with Prime compiler" 08/27/84
xcc <pathname> [-c] [-b[<b_pathname>]] [-l[<l_pathname>]]
.ds
'Xcc' compiles the C program in <pathname> with Prime's C compiler.
The ".c" suffix on the source file name is optional, although
'xcc' requires that the source code reside in a file named with
a ".c" suffix.
If the source file name specified in <pathname> does not have a
".c" suffix, 'xcc' will append a ".c" and attempt to process a
file with that name.
The object code is stored in "<pathname>.b".
If the "-b" command-line argument specifies <b_pathname>,
'xcc' stores the object code in a file with that name.
.sp
A full description of the C language is beyond the scope of this
document.  For complete information, refer to [ul The C Programming Language]
by Brian W. Kernighan and Dennis M. Ritchie (Prentice-Hall, 1978).
.sp
The following options are available:
.sp
.in +10
.ta 6
.tc \
.ti -5
-b\Compile the source code into the object file named "<b_pathname>".
'Xcc' places the object code into the file "<pathname>.b"
if this option or <b_pathname> is unspecified.
.sp
.ti -5
-c\Invoke the "-CHECKOUT" option.  This option causes the compiler
to parse the source code without producing object code.
This option suppresses the "-b" and "-l" options.
.sp
.ti -5
-l\Produce a listing in the file "<l_pathname>.l".  If <l_pathname>
is unspecified, 'xcc' places the listing in the file named
"<pathname>.l".
.in -10
.es
xcc file.c
xcc prog.c -l prog_list -b bonzo.b
xcc test.c -c -l
.me
Numerous and self-explanatory.
.bu
There is no way to tell Prime C programs about the Subsytem
standard input/output ports.
.sp
Does not give full access to the all the options available
with Prime's C compiler.
.sa
ld (1), xccl (1), bind (3)
[cc]mc
