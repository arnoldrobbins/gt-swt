[cc]mc |
.hd rfc "command file to rp and fc a Ratfor program" 08/21/84
rfc <file.r> [ [<rp_args>] [/ [<fc_args>]]]
.ds
'Rfc' is a shell program that causes the specified Ratfor program
to be preprocessed and compiled, but not loaded.
It is useful for rebuilding single modules in a multi-module
program.
The source file is expected to be named <program>.r
and the output object code is named <program>.b.
A check is made to verify the existence of the source program;
if it is not present, processing is discontinued.
.sp
The ".r" suffix on the source file name is not required, although
'rfc' requires that the source code reside in a file named with
a ".r" suffix; thus one may write "rfc file" to compile the
contents of "file.r".
.sp
Special options for 'rp' may be placed after the file name.
Options for 'fc' may be placed after the 'rp'
options, as long as the two groups are separated by a slash.
Example:  "rfc prog -a / -c".
.es
rfc profile.r
rfc profile
.sp
rfc stuff.r / -do0q
.me
"<source_file>:  can't open" for missing ".r" file
.br
"Usage: rfc ..." for no arguments
.sa
rp (1), fc (1), fcl (1), ld (1), rfl (1)
[cc]mc
