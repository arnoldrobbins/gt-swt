[cc]mc |
.hd vcgdump "display 'vcg' input files" 10/10/84
vcgdump [ <path prefix> ]
.ds
'Vcgdump' displays an input file intended for 'vcg' in a
semi-readable format.
For a complete description of 'vcg' see the
[ul A Re-Usable Code Generator for Prime 50-Series Computers User's Guide].
.sp
'Vcgdump' requires three input files; the first contains entry
points, the second contains external definitions and the
third contains the intermediate form tree.
If no argument is given, these files are
read from standard inputs 1, 2 and 3 respectively.  Otherwise,
'vcgdump' will append the suffixes ".ct1", ".ct2", and ".ct3"
to <path prefix> and use these names for the input files.
.sp
The output of 'vcgdump' is placed on standard output.
.es
vcgdump temp | pg    # use temp.ct(1 2 3)
p.ent> p.ext> p.tree> vcgdump | pr
.bu
.bf 100
This program is only available to licensees of Version 2.0
of the Georgia Tech C Compiler.
.bf 0
.sa
cc (1), ccl (1), ucc (1), vcg (1),
[ul A Re-Usable Code Generator for Prime 50-Series Computers User's Guide]
[cc]mc
