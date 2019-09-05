[cc]mc |
.hd vcg "Prime V-mode code generator" 10/22/84
vcg [-m <module>] [-b [<path>]] [-s [<path>]]
.ds
'Vcg' is a reusable, general purpose code generator which
accepts a linearized intermediate form tree and generates
either 64V-mode object text or PMA or both.
For a complete description of 'vcg' see the
[ul VCG User's Guide].
.sp
'Vcg' requires three input files; the first contains entry
points, the second contains external definitions and the
third contains the intermediate form tree.
.sp
If given, the "-m" argument specifies the name of the <module>
to which 'vcg' will append the suffixes ".ct1", ".ct2", and ".ct3"
for the three input files.
Otherwise, 'vcg' expects the three input files to be
on its three standard input ports.
.sp
The following command line options are available:
.in +8
.ta 6
.tc \
.sp
.ti -5
-b\Generate 'ld'-compatible object text directly.
'Vcg' generates object text by default and places it in the file
"<path>".
If <path> is not specified, but a <module> name is given with
the "-m" argument, 'vcg' will place the object text in the
file "<module>.b".
Otherwise, 'vcg' will print an error message and exit.
.sp
.ti -5
-s\Generate assembly code.
'Vcg' will produce
Prime Macro Assembly Language (PMA)
and place it in the file "<path>".
Object text generation is suppressed unless the "-b"
command line flag is also specified.
If <path> is not specified, but a <module> name is given with
the "-m" argument, 'vcg' will place the PMA in the
file "<module>.s".
Otherwise, 'vcg' will simply write the PMA on its first standard
output port.
.sp
.ti -5
-m\Specify input and output module names.
This option was discussed above.
.in -5
.sp
In general, the user should not invoke this command directly.
Rather, 'vcg' should be called via one of the compiler
interludes, like 'cc'.
.# Personally, I think 'vcg' should be in section 5, not section 1.
.# Oh well.
.es
vcg -m temp # use temp.ct(1 2 3)
p.ent> p.ext> p.tree> vcg -s  # write PMA to stdout
.me
Numerous, but sometimes opaque.
.bu
'Vcg' expects correctly formed input.  When it is presented with
something else, it usually manages to complain, but it may either
die or blithely emit incorrect code.  The major problem in
dealing with 'vcg' is that it is often not easy to tell what
part of the input is causing the difficulty.
.sp
.bf 100
This program is only available to licensees of Version 2.0
of the Georgia Tech C Compiler.
.bf 0
.sa
cc (1), ccl (1), ucc (1), vcgdump (1),
[ul A Re-Usable Code Generator for Prime 50-Series Computers User's Guide],
.ul
User's Guide for the Georgia Tech C Compiler
[cc]mc
